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

#include <grpcpp/grpcpp.h>
#include <kachaka_interfaces/msg/object_detection.hpp>
#include <kachaka_interfaces/msg/object_detection_list_stamped.hpp>
#include <rclcpp/rclcpp.hpp>
#include <rclcpp_components/register_node_macro.hpp>
#include <sensor_msgs/msg/region_of_interest.hpp>

#include "../ros2_topic_bridge.hpp"
#include "../stub_util.hpp"
#include "kachaka-api.grpc.pb.h"

using namespace std::placeholders;

namespace kachaka::grpc_ros2_bridge {

class ObjectDetectionComponent : public rclcpp::Node {
 public:
  explicit ObjectDetectionComponent(const rclcpp::NodeOptions& options)
      : Node("object_detection", options) {
    stub_ = GetSharedStub(declare_parameter("server_uri", ""));

    rclcpp::SensorDataQoS qos;
    object_detection_bridge_ = std::make_unique<
        Ros2TopicBridge<kachaka_api::GetObjectDetectionResponse,
                        kachaka_interfaces::msg::ObjectDetectionListStamped>>(
        this,
        std::bind(&kachaka_api::KachakaApi::Stub::GetObjectDetection, *stub_,
                  _1, _2, _3),
        "~/result", qos);
    object_detection_bridge_->SetConverter(
        [this](const kachaka_api::GetObjectDetectionResponse& grpc_msg,
               kachaka_interfaces::msg::ObjectDetectionListStamped* ros2_msg) {
          ros2_msg->header.stamp = rclcpp::Time(grpc_msg.header().stamp_nsec());
          // ros2_msg->header.frame_id = grpc_msg.header().frame_id();
          ros2_msg->header.frame_id = std::string(this->get_namespace()).substr(1) == "kachaka" ? grpc_msg.header().frame_id() : std::string(this->get_namespace()).substr(1) + "/" + grpc_msg.header().frame_id();
          for (const auto& object : grpc_msg.objects()) {
            kachaka_interfaces::msg::ObjectDetection ros2_object;
            const std::optional<uint8_t> lavel =
                ConvertToRos2ObjectLabel(object.label());
            if (!lavel.has_value()) {
              continue;
            }
            ros2_object.label = lavel.value();
            ros2_object.roi.x_offset = object.roi().x_offset();
            ros2_object.roi.y_offset = object.roi().y_offset();
            ros2_object.roi.height = object.roi().height();
            ros2_object.roi.width = object.roi().width();
            ros2_object.roi.do_rectify = object.roi().do_rectify();
            ros2_object.score = object.score();
            ros2_object.distance_median = object.distance_median();
            ros2_msg->detection.push_back(std::move(ros2_object));
          }
          return true;
        });
    object_detection_bridge_->StartAsync();
  }
  ~ObjectDetectionComponent() override {
    object_detection_bridge_->StopAsync();
  }

  ObjectDetectionComponent(const ObjectDetectionComponent&) = delete;
  ObjectDetectionComponent& operator=(const ObjectDetectionComponent&) = delete;

 private:
  std::optional<uint8_t> ConvertToRos2ObjectLabel(const uint32_t label) {
    switch (label) {
      case kachaka_api::ObjectLabel::OBJECT_LABEL_PERSON:
        return kachaka_interfaces::msg::ObjectDetection::PERSON;
      case kachaka_api::ObjectLabel::OBJECT_LABEL_SHELF:
        return kachaka_interfaces::msg::ObjectDetection::SHELF;
      case kachaka_api::ObjectLabel::OBJECT_LABEL_CHARGER:
        return kachaka_interfaces::msg::ObjectDetection::CHARGER;
      case kachaka_api::ObjectLabel::OBJECT_LABEL_DOOR:
        return kachaka_interfaces::msg::ObjectDetection::DOOR;
    }
    return std::nullopt;
  }

  std::shared_ptr<kachaka_api::KachakaApi::Stub> stub_{nullptr};
  std::unique_ptr<
      Ros2TopicBridge<kachaka_api::GetObjectDetectionResponse,
                      kachaka_interfaces::msg::ObjectDetectionListStamped>>
      object_detection_bridge_{nullptr};
};

}  // namespace kachaka::grpc_ros2_bridge

RCLCPP_COMPONENTS_REGISTER_NODE(
    kachaka::grpc_ros2_bridge::ObjectDetectionComponent)
