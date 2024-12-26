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
#include "../dynamic_tf_bridge.hpp"
#include "../stub_util.hpp"
#include "kachaka-api.grpc.pb.h"

namespace kachaka::grpc_ros2_bridge {

class DynamicTfComponent : public rclcpp::Node {
 public:
  explicit DynamicTfComponent(const rclcpp::NodeOptions& options)
      : Node("dynamic_tf", options) {
    RCLCPP_INFO(this->get_logger(), "start dynamic tf");

    this->declare_parameter("frame_prefix", "");
    frame_prefix_ = this->get_parameter("frame_prefix").as_string();
    stub_ = GetSharedStub(declare_parameter("server_uri", ""));

    RCLCPP_INFO(this->get_logger(), "get stub");

    dynamic_tf_client_ =
        std::make_unique<TfStreamClient>(frame_prefix_, stub_, this);

    dynamic_tf_client_->ReadStream();
    RCLCPP_INFO(this->get_logger(), "start read dynamic tf");
  }
  ~DynamicTfComponent() override {}

  DynamicTfComponent(const DynamicTfComponent&) = delete;
  DynamicTfComponent& operator=(const DynamicTfComponent&) = delete;

 private:
  std::string frame_prefix_;
  std::shared_ptr<kachaka_api::KachakaApi::Stub> stub_{nullptr};
  std::unique_ptr<TfStreamClient> dynamic_tf_client_;
};

}  // namespace kachaka::grpc_ros2_bridge

RCLCPP_COMPONENTS_REGISTER_NODE(kachaka::grpc_ros2_bridge::DynamicTfComponent)
