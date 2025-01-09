//  Copyright 2023 Preferred Robotics, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//     http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#pragma once

#include <atomic>
#include <memory>
#include <utility>

#if defined(ROS_DISTRO_JAZZY)  // Jazzy
#include <cv_bridge/cv_bridge.hpp>
#else  // Humble (default)
#include <cv_bridge/cv_bridge.h>
#endif

#include <grpcpp/grpcpp.h>
#include <opencv2/opencv.hpp>
#include <rclcpp/rclcpp.hpp>
#include <rclcpp_components/register_node_macro.hpp>
#include <sensor_msgs/msg/camera_info.hpp>
#include <sensor_msgs/msg/compressed_image.hpp>
#include <sensor_msgs/msg/image.hpp>

#include "converter/ros_header.hpp"
#include "kachaka-api.grpc.pb.h"
#include "ros2_topic_bridge.hpp"
#include "stub_util.hpp"

namespace kachaka::grpc_ros2_bridge {

template <class GetCameraInfoResponse, class GetImageResponse,
          class GetCompressedImageResponse>
class CameraBridge {
 public:
  explicit CameraBridge(
      std::string frame_prefix,
      std::shared_ptr<kachaka_api::KachakaApi::Stub> stub, rclcpp::Node* node,
      bool is_depth,
      typename GrpcBridge<kachaka_api::GetRequest,
                          GetCameraInfoResponse>::GrpcService
          camera_info_service,
      typename GrpcBridge<kachaka_api::GetRequest,
                          GetImageResponse>::GrpcService image_service,
      typename GrpcBridge<kachaka_api::GetRequest,
                          GetCompressedImageResponse>::GrpcService
          compressed_image_service)
      : frame_prefix_(std::move(frame_prefix)),
        stub_(std::move(stub)),
        node_(node) {
    rclcpp::SensorDataQoS qos;
    // camera_info
    camera_info_publisher_ =
        node->create_publisher<sensor_msgs::msg::CameraInfo>("~/camera_info",
                                                             qos);
    camera_info_compressed_publisher_ =
        node->create_publisher<sensor_msgs::msg::CameraInfo>(
            "~/image_raw/camera_info", qos);
    using namespace std::placeholders;
    camera_info_bridge_ = std::make_unique<
        GrpcBridge<kachaka_api::GetRequest, GetCameraInfoResponse>>(
        node, camera_info_service);

    // raw image
    image_bridge_ = std::make_unique<
        Ros2TopicBridge<GetImageResponse, sensor_msgs::msg::Image>>(
        node, image_service, "~/image_raw", qos);
    image_bridge_->SetConverter([this](const GetImageResponse& grpc_msg,
                                       sensor_msgs::msg::Image* ros2_msg) {
      ConvertToRos2Image(grpc_msg.image(), ros2_msg, this->frame_prefix_);
      if (camera_info_publisher_->get_subscription_count() > 0) {
        PublishCameraInfo(camera_info_publisher_, grpc_msg.image().header(),
                          this->frame_prefix_);
      }
      return true;
    });
    image_bridge_->StartAsync();

    // compressed image
    std::string compressed_image_topic = "~/image_raw/compressed";
    if (is_depth) {
      compressed_image_topic += "Depth";
    }
    compressed_image_bridge_ =
        std::make_unique<Ros2TopicBridge<GetCompressedImageResponse,
                                         sensor_msgs::msg::CompressedImage>>(
            node, compressed_image_service, compressed_image_topic, qos);
    compressed_image_bridge_->SetConverter(
        [this](const GetCompressedImageResponse& grpc_msg,
               sensor_msgs::msg::CompressedImage* ros2_msg) {
          ConvertToRos2CompressedImage(grpc_msg.image(), ros2_msg,
                                       this->frame_prefix_);
          if (camera_info_compressed_publisher_->get_subscription_count() > 0) {
            PublishCameraInfo(camera_info_compressed_publisher_,
                              grpc_msg.image().header(), this->frame_prefix_);
          }
          return true;
        });
    compressed_image_bridge_->StartAsync();
  }

  ~CameraBridge() {
    compressed_image_bridge_->StopAsync();
    image_bridge_->StopAsync();
  }

  CameraBridge(const CameraBridge&) = delete;
  CameraBridge& operator=(const CameraBridge&) = delete;

 private:
  void PublishCameraInfo(
      rclcpp::Publisher<sensor_msgs::msg::CameraInfo>::SharedPtr& publisher,
      const kachaka_api::RosHeader& header, const std::string& frame_prefix) {
    if (!camera_info_) {
      camera_info_ = GetCameraInfo(camera_info_last_cursor_);
    }
    if (camera_info_) {
      converter::ConvertGrpcHeaderToRos2Header(header, &camera_info_->header,
                                               frame_prefix);
      publisher->publish(*camera_info_);
    }
  }

  std::optional<sensor_msgs::msg::CameraInfo> GetCameraInfo(
      std::atomic_int64_t& cursor) {
    kachaka_api::GetRequest request;
    GetCameraInfoResponse response;
    request.mutable_metadata()->set_cursor(cursor);
    const auto status = camera_info_bridge_->CallSync(request, &response);
    if (!status.ok()) {
      return std::nullopt;
    }
    cursor = response.metadata().cursor();
    sensor_msgs::msg::CameraInfo camera_info;
    camera_info.width = response.camera_info().width();
    camera_info.height = response.camera_info().height();
    camera_info.distortion_model = response.camera_info().distortion_model();
    camera_info.d.resize(response.camera_info().d().size());
    for (int i = 0; i < static_cast<int>(camera_info.d.size()); i++) {
      camera_info.d[i] = response.camera_info().d()[i];
    }
    if (response.camera_info().k().size() !=
        static_cast<int>(camera_info.k.size())) {
      RCLCPP_ERROR(node_->get_logger(),
                   "size of camera_info.k is different from that of grpc!");
      return std::nullopt;
    }
    for (int i = 0; i < static_cast<int>(camera_info.k.size()); i++) {
      camera_info.k[i] = response.camera_info().k()[i];
    }
    if (response.camera_info().r().size() !=
        static_cast<int>(camera_info.r.size())) {
      RCLCPP_ERROR(node_->get_logger(),
                   "size of camera_info.r is different from that of grpc!");
      return std::nullopt;
    }
    for (int i = 0; i < static_cast<int>(camera_info.r.size()); i++) {
      camera_info.r[i] = response.camera_info().r()[i];
    }
    if (response.camera_info().p().size() !=
        static_cast<int>(camera_info.p.size())) {
      RCLCPP_ERROR(node_->get_logger(),
                   "size of camera_info.p is different from that of grpc!");
      return std::nullopt;
    }
    for (int i = 0; i < static_cast<int>(camera_info.p.size()); i++) {
      camera_info.p[i] = response.camera_info().p()[i];
    }
    camera_info.binning_x = response.camera_info().binning_x();
    camera_info.binning_y = response.camera_info().binning_y();
    camera_info.roi.x_offset = response.camera_info().roi().x_offset();
    camera_info.roi.y_offset = response.camera_info().roi().y_offset();
    camera_info.roi.height = response.camera_info().roi().height();
    camera_info.roi.width = response.camera_info().roi().width();
    camera_info.roi.do_rectify = response.camera_info().roi().do_rectify();
    return camera_info;
  }

  static void ConvertToRos2Image(const kachaka_api::RosImage& grpc_msg,
                                 sensor_msgs::msg::Image* ros2_msg,
                                 const std::string& frame_prefix = "") {
    converter::ConvertGrpcHeaderToRos2Header(grpc_msg.header(),
                                             &ros2_msg->header, frame_prefix);
    std::vector<uchar> buffer(grpc_msg.data().begin(), grpc_msg.data().end());
    ros2_msg->data = std::move(buffer);
    ros2_msg->height = grpc_msg.height();
    ros2_msg->width = grpc_msg.width();
    ros2_msg->encoding = grpc_msg.encoding();
    ros2_msg->is_bigendian = grpc_msg.is_bigendian();
    ros2_msg->step = grpc_msg.step();
  }

  static void ConvertToRos2CompressedImage(
      const kachaka_api::RosCompressedImage& grpc_msg,
      sensor_msgs::msg::CompressedImage* ros2_msg,
      const std::string& frame_prefix = "") {
    converter::ConvertGrpcHeaderToRos2Header(grpc_msg.header(),
                                             &ros2_msg->header, frame_prefix);
    ros2_msg->format = grpc_msg.format();
    std::vector<uchar> buffer(grpc_msg.data().begin(), grpc_msg.data().end());
    ros2_msg->data = std::move(buffer);
  }

  std::string frame_prefix_;
  std::shared_ptr<kachaka_api::KachakaApi::Stub> stub_{nullptr};
  rclcpp::Node* node_;
  std::unique_ptr<GrpcBridge<kachaka_api::GetRequest, GetCameraInfoResponse>>
      camera_info_bridge_{nullptr};
  std::unique_ptr<Ros2TopicBridge<GetImageResponse, sensor_msgs::msg::Image>>
      image_bridge_{nullptr};
  std::unique_ptr<Ros2TopicBridge<GetCompressedImageResponse,
                                  sensor_msgs::msg::CompressedImage>>
      compressed_image_bridge_{nullptr};
  std::atomic_int64_t camera_info_last_cursor_{0};
  std::optional<sensor_msgs::msg::CameraInfo> camera_info_;
  rclcpp::Publisher<sensor_msgs::msg::CameraInfo>::SharedPtr
      camera_info_publisher_;
  rclcpp::Publisher<sensor_msgs::msg::CameraInfo>::SharedPtr
      camera_info_compressed_publisher_;
};

}  // namespace kachaka::grpc_ros2_bridge
