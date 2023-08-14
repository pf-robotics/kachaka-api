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

#include <geometry_msgs/msg/pose_stamped.hpp>
#include <kachaka_interfaces/msg/kachaka_command.hpp>
#include <rclcpp/rclcpp.hpp>
#include <rclcpp_action/rclcpp_action.hpp>
#include <rclcpp_components/register_node_macro.hpp>
#include <tf2/LinearMath/Matrix3x3.h>
#include <tf2/LinearMath/Quaternion.h>

#include "../converter/kachaka_command.hpp"
#include "../grpc_bridge.hpp"
#include "../stub_util.hpp"
#include "kachaka-api.grpc.pb.h"

namespace kachaka::grpc_ros2_bridge {

class GoalPoseComponent : public rclcpp::Node {
 public:
  explicit GoalPoseComponent(const rclcpp::NodeOptions& options)
      : Node("goal_pose", options) {
    exec_kachaka_command_client_ = rclcpp_action::create_client<
        kachaka_interfaces::action::ExecKachakaCommand>(
        this, "kachaka_command/execute");
    goal_pose_subscriber_ =
        create_subscription<geometry_msgs::msg::PoseStamped>(
            "~/goal_pose", 5,
            [this](const geometry_msgs::msg::PoseStamped& msg) {
              GoalPoseCallback(msg);
            });
  }

 private:
  void GoalPoseCallback(const geometry_msgs::msg::PoseStamped& msg) {
    kachaka_interfaces::action::ExecKachakaCommand::Goal goal;
    goal.kachaka_command.command_type =
        kachaka_interfaces::msg::KachakaCommand::MOVE_TO_POSE_COMMAND;
    goal.kachaka_command.move_to_pose_command_x = msg.pose.position.x;
    goal.kachaka_command.move_to_pose_command_y = msg.pose.position.y;
    tf2::Quaternion q(msg.pose.orientation.x, msg.pose.orientation.y,
                      msg.pose.orientation.z, msg.pose.orientation.w);
    tf2::Matrix3x3 m(q);
    double roll, pitch, yaw;
    m.getRPY(roll, pitch, yaw);
    goal.kachaka_command.move_to_pose_command_yaw = yaw;
    exec_kachaka_command_client_->async_send_goal(goal);
    RCLCPP_INFO(get_logger(), "sent goal_pose (%.3f, %.3f, %.3f)",
                goal.kachaka_command.move_to_pose_command_x,
                goal.kachaka_command.move_to_pose_command_y,
                goal.kachaka_command.move_to_pose_command_yaw);
  }

  rclcpp_action::Client<kachaka_interfaces::action::ExecKachakaCommand>::
      SharedPtr exec_kachaka_command_client_{nullptr};
  rclcpp::Subscription<geometry_msgs::msg::PoseStamped>::SharedPtr
      goal_pose_subscriber_{nullptr};
};

}  // namespace kachaka::grpc_ros2_bridge

RCLCPP_COMPONENTS_REGISTER_NODE(kachaka::grpc_ros2_bridge::GoalPoseComponent)
