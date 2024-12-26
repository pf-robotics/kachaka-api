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

#include <geometry_msgs/msg/transform_stamped.hpp>
#include <grpcpp/grpcpp.h>
#include <opencv2/opencv.hpp>
#include <rclcpp/rclcpp.hpp>
#include <rclcpp_components/register_node_macro.hpp>
#include <tf2/LinearMath/Quaternion.h>
#include <tf2_msgs/msg/tf_message.hpp>
#include <tf2_ros/qos.hpp>

#include "../converter/ros_header.hpp"
#include "../ros2_topic_bridge.hpp"
#include "../stub_util.hpp"
#include "kachaka-api.grpc.pb.h"

namespace {
bool ConvertGrpcTfToRosTf(
    const kachaka_api::GetStaticTransformResponse& grpc_msg,
    tf2_msgs::msg::TFMessage* msg, std::string frame_prefix = "") {
  msg->transforms.clear();
  msg->transforms.reserve(grpc_msg.transforms_size());
  for (const auto& transform_grpc : grpc_msg.transforms()) {
    geometry_msgs::msg::TransformStamped transform_ros;
    kachaka::grpc_ros2_bridge::converter::ConvertGrpcHeaderToRos2Header(
        transform_grpc.header(), &(transform_ros.header), frame_prefix);

    transform_ros.child_frame_id =
        frame_prefix + transform_grpc.child_frame_id();
    transform_ros.transform.translation.x = transform_grpc.translation().x();
    transform_ros.transform.translation.y = transform_grpc.translation().y();
    transform_ros.transform.translation.z = transform_grpc.translation().z();
    transform_ros.transform.rotation.x = transform_grpc.rotation().x();
    transform_ros.transform.rotation.y = transform_grpc.rotation().y();
    transform_ros.transform.rotation.z = transform_grpc.rotation().z();
    transform_ros.transform.rotation.w = transform_grpc.rotation().w();

    msg->transforms.push_back(transform_ros);
  }
  return true;
}

}  // namespace

namespace kachaka::grpc_ros2_bridge {

class StaticTfComponent : public rclcpp::Node {
 public:
  explicit StaticTfComponent(const rclcpp::NodeOptions& options)
      : Node("static_tf", options) {
    this->declare_parameter("frame_prefix", "");
    frame_prefix_ = this->get_parameter("frame_prefix").as_string();
    stub_ = GetSharedStub(declare_parameter("server_uri", ""));

    using namespace std::placeholders;
    static_tf_bridge_ = std::make_unique<Ros2TopicBridge<
        kachaka_api::GetStaticTransformResponse, tf2_msgs::msg::TFMessage>>(
        this,
        std::bind(&kachaka_api::KachakaApi::Stub::GetStaticTransform, *stub_,
                  _1, _2, _3),
        "/tf_static", tf2_ros::StaticBroadcasterQoS());
    static_tf_bridge_->SetConverter(
        [this](const kachaka_api::GetStaticTransformResponse& grpc_msg,
               tf2_msgs::msg::TFMessage* ros2_msg) {
          ConvertGrpcTfToRosTf(grpc_msg, ros2_msg, frame_prefix_);
          return true;
        });
    static_tf_bridge_->StartAsync();
  }
  ~StaticTfComponent() override { static_tf_bridge_->StopAsync(); }

  StaticTfComponent(const StaticTfComponent&) = delete;
  StaticTfComponent& operator=(const StaticTfComponent&) = delete;

 private:
  std::string frame_prefix_;
  std::shared_ptr<kachaka_api::KachakaApi::Stub> stub_{nullptr};
  std::unique_ptr<Ros2TopicBridge<kachaka_api::GetStaticTransformResponse,
                                  tf2_msgs::msg::TFMessage>>
      static_tf_bridge_{nullptr};
};

}  // namespace kachaka::grpc_ros2_bridge

RCLCPP_COMPONENTS_REGISTER_NODE(kachaka::grpc_ros2_bridge::StaticTfComponent)
