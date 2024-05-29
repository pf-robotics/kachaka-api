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
#include <rclcpp/rclcpp.hpp>
#include <rclcpp_components/register_node_macro.hpp>
#include <sensor_msgs/msg/battery_state.hpp>
#include <std_msgs/msg/string.hpp>

#include "../ros2_topic_bridge.hpp"
#include "../stub_util.hpp"
#include "kachaka-api.grpc.pb.h"

namespace kachaka::grpc_ros2_bridge {

class RobotInfoComponent : public rclcpp::Node {
 public:
  explicit RobotInfoComponent(const rclcpp::NodeOptions& options)
      : Node("robot_info", options) {
    stub_ = GetSharedStub(declare_parameter("server_uri", ""));

    rclcpp::QoS qos(rclcpp::KeepLast{1});
    qos.transient_local();
    using namespace std::placeholders;
    get_robot_version_bridge_ =
        std::make_unique<Ros2TopicBridge<kachaka_api::GetRobotVersionResponse,
                                         std_msgs::msg::String>>(
            this,
            std::bind(&kachaka_api::KachakaApi::Stub::GetRobotVersion, *stub_,
                      _1, _2, _3),
            "~/version", qos);
    get_robot_version_bridge_->SetConverter(
        [this](const kachaka_api::GetRobotVersionResponse& grpc_msg,
               std_msgs::msg::String* ros2_msg) {
          ros2_msg->data = grpc_msg.version();
          return true;
        });

    rclcpp::SensorDataQoS qos_battery_state;
    get_battery_state_bridge_ =
        std::make_unique<Ros2TopicBridge<kachaka_api::GetBatteryInfoResponse,
                                         sensor_msgs::msg::BatteryState>>(
            this,
            std::bind(&kachaka_api::KachakaApi::Stub::GetBatteryInfo, *stub_,
                      _1, _2, _3),
            "~/battery_state", qos_battery_state);
    get_battery_state_bridge_->SetConverter(
        [this](const kachaka_api::GetBatteryInfoResponse& grpc_msg,
               sensor_msgs::msg::BatteryState* ros2_msg) {
          ros2_msg->voltage = -1.0;
          ros2_msg->percentage = grpc_msg.remaining_percentage() / 100.0;
          ros2_msg->power_supply_status = grpc_msg.power_supply_status();
          return true;
        });

    get_robot_version_bridge_->StartAsync();
    get_battery_state_bridge_->StartAsync();
  }
  ~RobotInfoComponent() override {
    get_robot_version_bridge_->StopAsync();
    get_battery_state_bridge_->StopAsync();
  }

  RobotInfoComponent(const RobotInfoComponent&) = delete;
  RobotInfoComponent& operator=(const RobotInfoComponent&) = delete;

 private:
  std::shared_ptr<kachaka_api::KachakaApi::Stub> stub_{nullptr};
  std::unique_ptr<Ros2TopicBridge<kachaka_api::GetRobotVersionResponse,
                                  std_msgs::msg::String>>
      get_robot_version_bridge_{nullptr};
  std::unique_ptr<Ros2TopicBridge<kachaka_api::GetBatteryInfoResponse,
                                  sensor_msgs::msg::BatteryState>>
      get_battery_state_bridge_{nullptr};
};

}  // namespace kachaka::grpc_ros2_bridge

RCLCPP_COMPONENTS_REGISTER_NODE(kachaka::grpc_ros2_bridge::RobotInfoComponent)
