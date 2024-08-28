//  Copyright 2024 Preferred Robotics, Inc.
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

#include <memory>

#include <grpcpp/grpcpp.h>
#include <nav_msgs/msg/odometry.hpp>
#include <rclcpp/rclcpp.hpp>
#include <rclcpp_components/register_node_macro.hpp>

#include "../converter/ros_header.hpp"
#include "../ros2_topic_bridge.hpp"
#include "../stub_util.hpp"
#include "kachaka-api.grpc.pb.h"

namespace {

void SetOdometryMsg(const kachaka_api::RosOdometry& odometry,
                    nav_msgs::msg::Odometry* ros2_msg) {
  kachaka::grpc_ros2_bridge::converter::ConvertGrpcHeaderToRos2Header(
      odometry.header(), &ros2_msg->header);
  ros2_msg->child_frame_id = odometry.child_frame_id();
  ros2_msg->pose.pose.position.x = odometry.pose().pose().position().x();
  ros2_msg->pose.pose.position.y = odometry.pose().pose().position().y();
  ros2_msg->pose.pose.position.z = odometry.pose().pose().position().z();

  ros2_msg->pose.pose.orientation.x = odometry.pose().pose().orientation().x();
  ros2_msg->pose.pose.orientation.y = odometry.pose().pose().orientation().y();
  ros2_msg->pose.pose.orientation.z = odometry.pose().pose().orientation().z();
  ros2_msg->pose.pose.orientation.w = odometry.pose().pose().orientation().w();
  std::copy(odometry.pose().covariance().begin(),
            odometry.pose().covariance().end(),
            ros2_msg->pose.covariance.begin());

  ros2_msg->twist.twist.linear.x = odometry.twist().twist().linear().x();
  ros2_msg->twist.twist.linear.y = odometry.twist().twist().linear().y();
  ros2_msg->twist.twist.linear.z = odometry.twist().twist().linear().z();

  ros2_msg->twist.twist.angular.x = odometry.twist().twist().angular().x();
  ros2_msg->twist.twist.angular.y = odometry.twist().twist().angular().y();
  ros2_msg->twist.twist.angular.z = odometry.twist().twist().angular().z();

  std::copy(odometry.twist().covariance().begin(),
            odometry.twist().covariance().end(),
            ros2_msg->twist.covariance.begin());
}

}  // namespace

namespace kachaka::grpc_ros2_bridge {

class WheelOdometryComponent : public rclcpp::Node {
 public:
  explicit WheelOdometryComponent(const rclcpp::NodeOptions& options)
      : Node("wheel_odometry", options) {
    stub_ = GetSharedStub(declare_parameter("server_uri", ""));

    rclcpp::SensorDataQoS qos;
    using namespace std::placeholders;
    wheel_odometry_bridge_ = std::make_unique<Ros2TopicBridge<
        kachaka_api::GetRosWheelOdometryResponse, nav_msgs::msg::Odometry>>(
        this,
        std::bind(&kachaka_api::KachakaApi::Stub::GetRosWheelOdometry, *stub_,
                  _1, _2, _3),
        "~/wheel_odometry", qos);
    wheel_odometry_bridge_->SetConverter(
        [](const kachaka_api::GetRosWheelOdometryResponse& grpc_msg,
           nav_msgs::msg::Odometry* ros2_msg) {
          const auto& odometry = grpc_msg.odometry();
          SetOdometryMsg(odometry, ros2_msg);
          return true;
        });
    wheel_odometry_bridge_->StartAsync();
  }
  ~WheelOdometryComponent() override { wheel_odometry_bridge_->StopAsync(); }

  WheelOdometryComponent(const WheelOdometryComponent&) = delete;
  WheelOdometryComponent& operator=(const WheelOdometryComponent&) = delete;

 private:
  std::shared_ptr<kachaka_api::KachakaApi::Stub> stub_{nullptr};
  std::unique_ptr<Ros2TopicBridge<kachaka_api::GetRosWheelOdometryResponse,
                                  nav_msgs::msg::Odometry>>
      wheel_odometry_bridge_{nullptr};
};

}  // namespace kachaka::grpc_ros2_bridge

RCLCPP_COMPONENTS_REGISTER_NODE(
    kachaka::grpc_ros2_bridge::WheelOdometryComponent)
