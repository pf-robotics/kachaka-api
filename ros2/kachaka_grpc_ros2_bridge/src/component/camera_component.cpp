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

#include <atomic>
#include <memory>

#include <cv_bridge/cv_bridge.h>
#include <grpcpp/grpcpp.h>
#include <opencv2/opencv.hpp>
#include <rclcpp/rclcpp.hpp>
#include <rclcpp_components/register_node_macro.hpp>
#include <sensor_msgs/msg/camera_info.hpp>
#include <sensor_msgs/msg/compressed_image.hpp>
#include <sensor_msgs/msg/image.hpp>

#include "../converter/ros_header.hpp"
#include "../ros2_topic_bridge.hpp"
#include "../stub_util.hpp"
#include "kachaka-api.grpc.pb.h"

namespace kachaka::grpc_ros2_bridge {

class CameraComponent : public rclcpp::Node {
 public:
  explicit CameraComponent(const rclcpp::NodeOptions& options)
      : Node("camera", options) {
    stub_ = GetSharedStub(declare_parameter("server_uri", ""));

    rclcpp::SensorDataQoS qos;
    // camera_info
    front_camera_info_publisher_ =
        create_publisher<sensor_msgs::msg::CameraInfo>("~/camera_info", qos);
    front_camera_info_compressed_publisher_ =
        create_publisher<sensor_msgs::msg::CameraInfo>(
            "~/image_raw/camera_info", qos);
    using namespace std::placeholders;
    front_camera_info_bridge_ = std::make_unique<
        GrpcBridge<kachaka_api::GetRequest,
                   kachaka_api::GetFrontCameraRosCameraInfoResponse>>(
        this,
        std::bind(&kachaka_api::KachakaApi::Stub::GetFrontCameraRosCameraInfo,
                  *stub_, _1, _2, _3));

    // raw image
    front_camera_bridge_ = std::make_unique<Ros2TopicBridge<
        kachaka_api::GetFrontCameraRosImageResponse, sensor_msgs::msg::Image>>(
        this,
        std::bind(&kachaka_api::KachakaApi::Stub::GetFrontCameraRosImage,
                  *stub_, _1, _2, _3),
        "~/image_raw", qos);
    front_camera_bridge_->SetConverter(
        [this](const kachaka_api::GetFrontCameraRosImageResponse& grpc_msg,
               sensor_msgs::msg::Image* ros2_msg) {
          ConvertToRos2Image(grpc_msg.image(), ros2_msg);
          if (front_camera_info_publisher_->get_subscription_count() > 0) {
            PublishFrontCameraInfo(front_camera_info_publisher_,
                                   grpc_msg.image().header());
          }
          return true;
        });
    front_camera_bridge_->StartAsync();

    // compressed image
    front_camera_compressed_bridge_ = std::make_unique<
        Ros2TopicBridge<kachaka_api::GetFrontCameraRosCompressedImageResponse,
                        sensor_msgs::msg::CompressedImage>>(
        this,
        std::bind(
            &kachaka_api::KachakaApi::Stub::GetFrontCameraRosCompressedImage,
            *stub_, _1, _2, _3),
        "~/image_raw/compressed", qos);
    front_camera_compressed_bridge_->SetConverter(
        [this](const kachaka_api::GetFrontCameraRosCompressedImageResponse&
                   response,
               sensor_msgs::msg::CompressedImage* ros2_msg) {
          ConvertToRos2CompressedImage(response.image(), ros2_msg);
          if (front_camera_info_compressed_publisher_
                  ->get_subscription_count() > 0) {
            PublishFrontCameraInfo(front_camera_info_compressed_publisher_,
                                   response.image().header());
          }
          return true;
        });
    front_camera_compressed_bridge_->StartAsync();
  }

  ~CameraComponent() override {
    front_camera_compressed_bridge_->StopAsync();
    front_camera_bridge_->StopAsync();
  }

  CameraComponent(const CameraComponent&) = delete;
  CameraComponent& operator=(const CameraComponent&) = delete;

 private:
  void PublishFrontCameraInfo(
      rclcpp::Publisher<sensor_msgs::msg::CameraInfo>::SharedPtr& publisher,
      const kachaka_api::RosHeader& header) {
    if (!front_camera_info_) {
      front_camera_info_ = GetCameraInfo(front_camera_info_last_cursor_);
    }
    if (front_camera_info_) {
      converter::ConvertGrpcHeaderToRos2Header(header,
                                               &front_camera_info_->header);
      publisher->publish(*front_camera_info_);
    }
  }

  std::optional<sensor_msgs::msg::CameraInfo> GetCameraInfo(
      std::atomic_int64_t& cursor) {
    kachaka_api::GetRequest request;
    kachaka_api::GetFrontCameraRosCameraInfoResponse response;
    request.mutable_metadata()->set_cursor(cursor);
    const auto status = front_camera_info_bridge_->CallSync(request, &response);
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
      RCLCPP_ERROR(get_logger(),
                   "size of camera_info.k is different from that of grpc!");
      return std::nullopt;
    }
    for (int i = 0; i < static_cast<int>(camera_info.k.size()); i++) {
      camera_info.k[i] = response.camera_info().k()[i];
    }
    if (response.camera_info().r().size() !=
        static_cast<int>(camera_info.r.size())) {
      RCLCPP_ERROR(get_logger(),
                   "size of camera_info.r is different from that of grpc!");
      return std::nullopt;
    }
    for (int i = 0; i < static_cast<int>(camera_info.r.size()); i++) {
      camera_info.r[i] = response.camera_info().r()[i];
    }
    if (response.camera_info().p().size() !=
        static_cast<int>(camera_info.p.size())) {
      RCLCPP_ERROR(get_logger(),
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
                                 sensor_msgs::msg::Image* ros2_msg) {
    converter::ConvertGrpcHeaderToRos2Header(grpc_msg.header(),
                                             &ros2_msg->header);
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
      sensor_msgs::msg::CompressedImage* ros2_msg) {
    converter::ConvertGrpcHeaderToRos2Header(grpc_msg.header(),
                                             &ros2_msg->header);
    ros2_msg->format = grpc_msg.format();
    std::vector<uchar> buffer(grpc_msg.data().begin(), grpc_msg.data().end());
    ros2_msg->data = std::move(buffer);
  }

  std::shared_ptr<kachaka_api::KachakaApi::Stub> stub_{nullptr};
  std::unique_ptr<GrpcBridge<kachaka_api::GetRequest,
                             kachaka_api::GetFrontCameraRosCameraInfoResponse>>
      front_camera_info_bridge_{nullptr};
  std::unique_ptr<Ros2TopicBridge<kachaka_api::GetFrontCameraRosImageResponse,
                                  sensor_msgs::msg::Image>>
      front_camera_bridge_{nullptr};
  std::unique_ptr<
      Ros2TopicBridge<kachaka_api::GetFrontCameraRosCompressedImageResponse,
                      sensor_msgs::msg::CompressedImage>>
      front_camera_compressed_bridge_{nullptr};
  std::atomic_int64_t front_camera_info_last_cursor_{0};
  std::optional<sensor_msgs::msg::CameraInfo> front_camera_info_;
  rclcpp::Publisher<sensor_msgs::msg::CameraInfo>::SharedPtr
      front_camera_info_publisher_;
  rclcpp::Publisher<sensor_msgs::msg::CameraInfo>::SharedPtr
      front_camera_info_compressed_publisher_;
};

}  // namespace kachaka::grpc_ros2_bridge

RCLCPP_COMPONENTS_REGISTER_NODE(kachaka::grpc_ros2_bridge::CameraComponent)
