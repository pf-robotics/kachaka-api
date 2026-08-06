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

#include "dynamic_tf_bridge.hpp"

#include <rclcpp/rclcpp.hpp>
#include <tf2_msgs/msg/tf_message.hpp>
#include <tf2_ros/qos.hpp>

#include "converter/ros_header.hpp"
#include "kachaka-api.grpc.pb.h"

namespace {
constexpr char kMapFrameId[] = "map";

// Returns true if the converted message has at least one transform.
bool ConvertGrpcTfToRosTf(
    const kachaka_api::GetDynamicTransformResponse& grpc_msg,
    tf2_msgs::msg::TFMessage* msg, const std::string& frame_prefix = "",
    const bool publish_map_tf = true) {
  msg->transforms.clear();
  msg->transforms.reserve(grpc_msg.transforms_size());
  for (const auto& transform_grpc : grpc_msg.transforms()) {
    // Check the frame_id on the gRPC side not to depend on frame_prefix.
    if (!publish_map_tf && transform_grpc.header().frame_id() == kMapFrameId) {
      continue;
    }

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
  return !msg->transforms.empty();
}

}  // namespace

namespace kachaka::grpc_ros2_bridge {

TfStreamClient::TfStreamClient(
    std::string frame_prefix, bool publish_map_tf,
    std::shared_ptr<kachaka_api::KachakaApi::Stub> stub, rclcpp::Node* node)
    : frame_prefix_(std::move(frame_prefix)),
      publish_map_tf_(publish_map_tf),
      stub_(stub),
      node_(node),
      publisher_(node->create_publisher<tf2_msgs::msg::TFMessage>(
          "/tf", tf2_ros::DynamicBroadcasterQoS(5))) {}

void TfStreamClient::ReadStream() {
  grpc::ClientContext context;
  kachaka_api::EmptyRequest request;

  std::unique_ptr<grpc::ClientReader<kachaka_api::GetDynamicTransformResponse>>
      reader(stub_->GetDynamicTransform(&context, request));

  kachaka_api::GetDynamicTransformResponse response;

  while (reader->Read(&response)) {
    tf2_msgs::msg::TFMessage msg;
    if (ConvertGrpcTfToRosTf(response, &msg, frame_prefix_, publish_map_tf_)) {
      publisher_->publish(msg);
    }
  }
  RCLCPP_INFO(node_->get_logger(), "dynamic tf server is stopped.");
}

}  // namespace kachaka::grpc_ros2_bridge
