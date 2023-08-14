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

#include <chrono>
#include <memory>
#include <thread>
#include <tuple>
#include <utility>

#include <geometry_msgs/msg/twist.hpp>
#include <grpcpp/grpcpp.h>
#include <rclcpp/rclcpp.hpp>
#include <rclcpp_components/register_node_macro.hpp>
#include <std_msgs/msg/bool.hpp>
#include <std_srvs/srv/set_bool.hpp>

#include "../error_code.hpp"
#include "../grpc_bridge.hpp"
#include "../ros2_topic_bridge.hpp"
#include "../stub_util.hpp"
#include "kachaka-api.grpc.pb.h"

using namespace std::chrono_literals;
using namespace std::placeholders;

namespace kachaka::grpc_ros2_bridge {

static constexpr double kMaxLinearVelocity = 0.3;
static constexpr double kMaxAngularVelocity = 1.57;

class ManualControlComponent : public rclcpp::Node {
 public:
  explicit ManualControlComponent(const rclcpp::NodeOptions& options)
      : Node("manual_control", options) {
    stub_ = GetSharedStub(declare_parameter("server_uri", ""));

    rclcpp::SensorDataQoS qos;
    using namespace std::placeholders;
    set_manual_control_enabled_bridge_ = std::make_unique<
        GrpcBridge<kachaka_api::SetManualControlEnabledRequest,
                   kachaka_api::SetManualControlEnabledResponse>>(
        this, std::bind(&kachaka_api::KachakaApi::Stub::SetManualControlEnabled,
                        *stub_, _1, _2, _3));
    set_manual_control_enabled_service_ =
        create_service<std_srvs::srv::SetBool>(
            "~/set_enabled",
            std::bind(&ManualControlComponent::HandleSetManualControlEnabled,
                      this, _1, _2, _3));
    set_robot_velocity_bridge_ =
        std::make_unique<GrpcBridge<kachaka_api::SetRobotVelocityRequest,
                                    kachaka_api::SetRobotVelocityResponse>>(
            this, std::bind(&kachaka_api::KachakaApi::Stub::SetRobotVelocity,
                            *stub_, _1, _2, _3));
    twist_subscriber_ = create_subscription<geometry_msgs::msg::Twist>(
        "~/cmd_vel", qos,
        [this](const geometry_msgs::msg::Twist& msg) { CmdVelCallback(msg); });
  }
  ~ManualControlComponent() override = default;

  ManualControlComponent(const ManualControlComponent&) = delete;
  ManualControlComponent& operator=(const ManualControlComponent&) = delete;

 private:
  void CmdVelCallback(const geometry_msgs::msg::Twist& msg) {
    kachaka_api::SetRobotVelocityRequest request;
    request.set_linear(msg.linear.x / kMaxLinearVelocity);
    request.set_angular(msg.angular.z / kMaxAngularVelocity);
    kachaka_api::SetRobotVelocityResponse response;
    set_robot_velocity_bridge_->CallSync(request, &response);

    if (not response.result().success() and
        response.result().error_code() ==
            error_code::kErrorCodeApiGrpcSetRobotVelocityNotInTeleopMode) {
      SetManualControlEnabled(true);
    }
  }

  std::tuple<grpc::Status, kachaka_api::SetManualControlEnabledResponse>
  SetManualControlEnabled(const bool enabled) {
    kachaka_api::SetManualControlEnabledRequest grpc_request;
    grpc_request.set_enable(enabled);
    grpc_request.set_use_shelf_registration(false);
    kachaka_api::SetManualControlEnabledResponse grpc_response;
    RCLCPP_INFO(get_logger(), "manual control %s",
                enabled ? "enabled" : "disabled");
    const auto status = set_manual_control_enabled_bridge_->CallSync(
        grpc_request, &grpc_response);
    return {status, grpc_response};
  }

  void HandleSetManualControlEnabled(
      [[maybe_unused]] const std::shared_ptr<rmw_request_id_t>& header,
      const std_srvs::srv::SetBool::Request::SharedPtr& request,
      const std_srvs::srv::SetBool::Response::SharedPtr& response) {
    const auto [status, grpc_response] = SetManualControlEnabled(request->data);
    if (status.ok()) {
      response->success = grpc_response.result().success();
    } else {
      response->success = status.ok();
    }
  }

  std::shared_ptr<kachaka_api::KachakaApi::Stub> stub_{nullptr};
  std::unique_ptr<GrpcBridge<kachaka_api::SetRobotVelocityRequest,
                             kachaka_api::SetRobotVelocityResponse>>
      set_robot_velocity_bridge_;
  std::unique_ptr<GrpcBridge<kachaka_api::SetManualControlEnabledRequest,
                             kachaka_api::SetManualControlEnabledResponse>>
      set_manual_control_enabled_bridge_;
  rclcpp::Service<std_srvs::srv::SetBool>::SharedPtr
      set_manual_control_enabled_service_{nullptr};
  rclcpp::Subscription<geometry_msgs::msg::Twist>::SharedPtr twist_subscriber_{
      nullptr};
};

}  // namespace kachaka::grpc_ros2_bridge

RCLCPP_COMPONENTS_REGISTER_NODE(
    kachaka::grpc_ros2_bridge::ManualControlComponent)
