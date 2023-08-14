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

#pragma once

#include <chrono>
#include <functional>
#include <memory>
#include <utility>

#include <grpcpp/grpcpp.h>
#include <rclcpp/rclcpp.hpp>

#include "kachaka-api.grpc.pb.h"

namespace {

constexpr std::chrono::milliseconds kTimerInterval{20};
constexpr std::chrono::seconds kTimerDeadlineDuration{5};

}  // namespace

namespace kachaka::grpc_ros2_bridge {

template <class GrpcRequest, class GrpcResponse>
class GrpcBridge {
 public:
  using GrpcService = std::function<grpc::Status(grpc::ClientContext* context,
                                                 const GrpcRequest& request,
                                                 GrpcResponse* response)>;
  using GrpcRequestCreation = std::function<GrpcRequest()>;
  using GrpcResponseCallback =
      std::function<void(const GrpcResponse& response)>;

  explicit GrpcBridge(rclcpp::Node* node, GrpcService grpc_service)
      : node_(node), grpc_service_(std::move(grpc_service)) {}

  virtual ~GrpcBridge() { StopAsync(); }

  GrpcBridge(const GrpcBridge&) = delete;
  GrpcBridge& operator=(const GrpcBridge&) = delete;

  bool StartAsync() {
    if (timer_ != nullptr) {
      return false;
    }
    RCLCPP_INFO(node_->get_logger(), "'%s' bridge starting", node_->get_name());
    stopped_ = false;
    timer_ =
        node_->create_wall_timer(kTimerInterval, [this] { TimerCallback(); });
    return true;
  }

  void SetPauseAsyncCallback(
      const std::function<bool()>& pause_async_callback) {
    pause_async_callback_ = pause_async_callback;
  }

  void StopAsync() {
    stopped_ = true;
    timer_->cancel();
    timer_.reset();
    RCLCPP_INFO(node_->get_logger(), "'%s' bridge stopped", node_->get_name());
  }

  grpc::Status CallSync(
      const GrpcRequest& request, GrpcResponse* response,
      std::optional<std::chrono::seconds> timeout = std::nullopt) {
    std::lock_guard lock(mutex_);
    grpc::ClientContext context;
    if (timeout.has_value()) {
      auto deadline = std::chrono::system_clock::now() + timeout.value();
      context.set_deadline(deadline);
    }
    grpc::Status status = grpc_service_(&context, request, response);
    if (not status.ok()) {
      RCLCPP_ERROR(node_->get_logger(), "'%s' error #%d: %s", node_->get_name(),
                   status.error_code(), status.error_message().c_str());
    }

    return status;
  }

  void SetGrpcRequestCreation(GrpcRequestCreation grpc_request_creation) {
    grpc_request_creation_ = std::move(grpc_request_creation);
  }

  void SetGrpcResponseCallback(GrpcResponseCallback grpc_response_callback) {
    grpc_response_callback_ = std::move(grpc_response_callback);
  }

 private:
  void TimerCallback() {
    if (pause_async_callback_()) {
      return;
    }
    {
      std::lock_guard lock(mutex_);
      grpc::ClientContext context;
      auto deadline = std::chrono::system_clock::now() + kTimerDeadlineDuration;
      context.set_deadline(deadline);
      GrpcRequest request = grpc_request_creation_();
      GrpcResponse response;

      const grpc::Status status = grpc_service_(&context, request, &response);
      if (status.ok()) {
        grpc_response_callback_(response);
      } else if (status.error_code() != grpc::StatusCode::CANCELLED and
                 status.error_code() != grpc::StatusCode::DEADLINE_EXCEEDED) {
        RCLCPP_ERROR(node_->get_logger(), "'%s' error #%d: %s",
                     node_->get_name(), status.error_code(),
                     status.error_message().c_str());
      }

      if (stopped_ or status.error_code() == grpc::StatusCode::UNAVAILABLE) {
        StopAsync();
        return;
      }
    }
  }

  std::function<bool()> pause_async_callback_{[]() {
    return false;
  }};
  rclcpp::Node* node_;
  GrpcService grpc_service_;
  std::mutex mutex_;
  rclcpp::TimerBase::SharedPtr timer_{nullptr};
  std::atomic<bool> stopped_{false};
  GrpcRequestCreation grpc_request_creation_{[]() {
    return GrpcRequest();
  }};
  GrpcResponseCallback grpc_response_callback_{[](const GrpcResponse&) {
  }};
};

}  // namespace kachaka::grpc_ros2_bridge
