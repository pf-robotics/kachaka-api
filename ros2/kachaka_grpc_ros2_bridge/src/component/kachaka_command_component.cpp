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
#include <future>
#include <thread>

#include <grpcpp/grpcpp.h>
#include <kachaka_interfaces/action/exec_kachaka_command.hpp>
#include <rclcpp/rclcpp.hpp>
#include <rclcpp_action/rclcpp_action.hpp>
#include <rclcpp_components/register_node_macro.hpp>

#include "../converter/kachaka_command.hpp"
#include "../grpc_bridge.hpp"
#include "../stub_util.hpp"
#include "kachaka-api.grpc.pb.h"

namespace kachaka::grpc_ros2_bridge {

static constexpr std::chrono::seconds kWaitForRunningTimeout{5};
static constexpr std::chrono::seconds kWaitForPendingTimeout{60};

static std::string CommandStateToString(
    const kachaka_api::CommandState& action_state) {
  switch (action_state) {
    case kachaka_api::CommandState::COMMAND_STATE_PENDING:
      return "PENDING";
    case kachaka_api::CommandState::COMMAND_STATE_RUNNING:
      return "RUNNING";
    default:
      return "UNKNOWN";
  }
}

class KachakaCommandComponent : public rclcpp::Node {
 public:
  using ExecKachakaCommand = kachaka_interfaces::action::ExecKachakaCommand;

  explicit KachakaCommandComponent(const rclcpp::NodeOptions& options)
      : Node("kachaka_command", options) {
    stub_ = GetSharedStub(declare_parameter("server_uri", ""));

    using namespace std::placeholders;
    start_command_bridge_ =
        std::make_unique<GrpcBridge<kachaka_api::StartCommandRequest,
                                    kachaka_api::StartCommandResponse>>(
            this, std::bind(&kachaka_api::KachakaApi::Stub::StartCommand,
                            *stub_, _1, _2, _3));
    cancel_command_bridge_ =
        std::make_unique<GrpcBridge<kachaka_api::EmptyRequest,
                                    kachaka_api::CancelCommandResponse>>(
            this, std::bind(&kachaka_api::KachakaApi::Stub::CancelCommand,
                            *stub_, _1, _2, _3));
    action_state_bridge_ =
        std::make_unique<GrpcBridge<kachaka_api::GetRequest,
                                    kachaka_api::GetCommandStateResponse>>(
            this, std::bind(&kachaka_api::KachakaApi::Stub::GetCommandState,
                            *stub_, _1, _2, _3));
    action_server_ = rclcpp_action::create_server<ExecKachakaCommand>(
        this, "~/execute",
        std::bind(&KachakaCommandComponent::HandleGoal, this, _1, _2),
        std::bind(&KachakaCommandComponent::HandleCancel, this, _1),
        std::bind(&KachakaCommandComponent::HandleAccepted, this, _1));
  }
  ~KachakaCommandComponent() override {
    if (wait_for_completion_future_.valid()) {
      wait_for_completion_future_.wait();
    }
  }

  KachakaCommandComponent(const KachakaCommandComponent&) = delete;
  KachakaCommandComponent& operator=(const KachakaCommandComponent&) = delete;

  rclcpp_action::GoalResponse HandleGoal(
      [[maybe_unused]] const rclcpp_action::GoalUUID& uuid,
      [[maybe_unused]] std::shared_ptr<const ExecKachakaCommand::Goal> goal) {
    std::lock_guard<std::mutex> lock(mutex_);
    return rclcpp_action::GoalResponse::ACCEPT_AND_EXECUTE;
  }

  rclcpp_action::CancelResponse HandleCancel(
      const std::shared_ptr<rclcpp_action::ServerGoalHandle<ExecKachakaCommand>>
          goal_handle) {
    std::lock_guard<std::mutex> lock(mutex_);
    kachaka_api::EmptyRequest request;
    kachaka_api::CancelCommandResponse response;
    grpc::Status status = cancel_command_bridge_->CallSync(request, &response);
    if (not status.ok()) {
      return rclcpp_action::CancelResponse::REJECT;
    }

    auto result = std::make_shared<ExecKachakaCommand::Result>();
    result->success = response.result().success();
    result->error_code = response.result().error_code();
    goal_handle->canceled(result);
    return rclcpp_action::CancelResponse::ACCEPT;
  }

  void HandleAccepted(
      const std::shared_ptr<rclcpp_action::ServerGoalHandle<ExecKachakaCommand>>
          goal_handle) {
    std::lock_guard<std::mutex> lock(mutex_);
    RCLCPP_INFO(get_logger(), "executing command_type #%d",
                goal_handle->get_goal()->kachaka_command.command_type);
    auto action =
        converter::ConvertToGrpc(goal_handle->get_goal()->kachaka_command);
    if (not action.has_value()) {
      const std::string message = "invalid 'kachaka_command' format";
      RCLCPP_WARN(get_logger(), "%s", message.c_str());
      auto result = std::make_shared<ExecKachakaCommand::Result>();
      // TODO(youtalk): Set result->error_code
      result->success = false;
      goal_handle->abort(result);
      return;
    }

    kachaka_api::StartCommandRequest request;
    request.mutable_command()->CopyFrom(action.value());
    request.set_cancel_all(goal_handle->get_goal()->cancel_all);
    request.set_tts_on_success(goal_handle->get_goal()->tts_on_success);
    kachaka_api::StartCommandResponse response;
    grpc::Status status = start_command_bridge_->CallSync(request, &response);
    if (not status.ok() or not response.result().success()) {
      RCLCPP_WARN(get_logger(), "StartCommand: failed");
      auto result = std::make_shared<ExecKachakaCommand::Result>();
      if (not status.ok()) {
        result->success = status.ok();
        result->error_code = status.error_code();
      } else {
        result->success = response.result().success();
        result->error_code = response.result().error_code();
      }
      goal_handle->abort(result);
      return;
    }

    wait_for_completion_future_ =
        std::async(std::launch::async,
                   std::bind(&KachakaCommandComponent::WaitForCompletion, this,
                             goal_handle));
  }

 private:
  bool WaitForCommandState(
      const std::shared_ptr<
          rclcpp_action::ServerGoalHandle<ExecKachakaCommand>>& goal_handle,
      const kachaka_api::CommandState& action_state,
      const std::chrono::seconds timeout) {
    kachaka_api::GetRequest request;
    request.mutable_metadata()->set_cursor(action_state_last_cursor_);

    while (rclcpp::ok()) {
      kachaka_api::GetCommandStateResponse response;
      const auto status =
          action_state_bridge_->CallSync(request, &response, timeout);
      if (not status.ok()) {
        auto result = std::make_shared<ExecKachakaCommand::Result>();
        result->success = false;
        goal_handle->abort(result);
        return false;
      }

      RCLCPP_INFO(get_logger(),
                  "GetCommandState: waiting for '%s' (current = '%s')",
                  CommandStateToString(action_state).c_str(),
                  CommandStateToString(response.state()).c_str());

      action_state_last_cursor_ = response.metadata().cursor();
      request.mutable_metadata()->set_cursor(action_state_last_cursor_);
      if (response.state() == action_state) {
        break;
      }
    }

    return true;
  }

  void WaitForCompletion(
      const std::shared_ptr<rclcpp_action::ServerGoalHandle<ExecKachakaCommand>>
          goal_handle) {
    std::lock_guard<std::mutex> lock(mutex_);

    if (not WaitForCommandState(
            goal_handle, kachaka_api::CommandState::COMMAND_STATE_RUNNING,
            kWaitForRunningTimeout) or
        not WaitForCommandState(
            goal_handle, kachaka_api::CommandState::COMMAND_STATE_PENDING,
            kWaitForPendingTimeout)) {
      return;
    }

    auto result = std::make_shared<ExecKachakaCommand::Result>();
    result->success = true;
    goal_handle->succeed(result);
  }

  std::shared_ptr<kachaka_api::KachakaApi::Stub> stub_{nullptr};
  std::mutex mutex_;
  std::atomic_int64_t action_state_last_cursor_{0};
  std::unique_ptr<GrpcBridge<kachaka_api::StartCommandRequest,
                             kachaka_api::StartCommandResponse>>
      start_command_bridge_{nullptr};
  std::unique_ptr<
      GrpcBridge<kachaka_api::EmptyRequest, kachaka_api::CancelCommandResponse>>
      cancel_command_bridge_{nullptr};
  std::unique_ptr<
      GrpcBridge<kachaka_api::GetRequest, kachaka_api::GetCommandStateResponse>>
      action_state_bridge_{nullptr};
  rclcpp_action::Server<
      kachaka_interfaces::action::ExecKachakaCommand>::SharedPtr action_server_{
      nullptr};
  std::future<void> wait_for_completion_future_;
};

}  // namespace kachaka::grpc_ros2_bridge

RCLCPP_COMPONENTS_REGISTER_NODE(
    kachaka::grpc_ros2_bridge::KachakaCommandComponent)
