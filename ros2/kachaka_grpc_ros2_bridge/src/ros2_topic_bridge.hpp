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

#include <atomic>
#include <thread>
#include <utility>

#include <grpcpp/grpcpp.h>
#include <rclcpp/rclcpp.hpp>

#include "grpc_bridge.hpp"
#include "kachaka-api.grpc.pb.h"

namespace kachaka::grpc_ros2_bridge {

template <class GrpcResponse, class Ros2Msg>
class Ros2TopicBridge
    : public GrpcBridge<kachaka_api::GetRequest, GrpcResponse> {
 public:
  using Converter = std::function<bool(const GrpcResponse&, Ros2Msg*)>;

  explicit Ros2TopicBridge(
      rclcpp::Node* node,
      typename GrpcBridge<kachaka_api::GetRequest, GrpcResponse>::GrpcService
          grpc_service,
      std::string ros2_topic, const rclcpp::QoS& qos)
      : GrpcBridge<kachaka_api::GetRequest, GrpcResponse>(node, grpc_service),
        ros2_topic_(std::move(ros2_topic)),
        publisher_(node->create_publisher<Ros2Msg>(ros2_topic_, qos)) {
    this->SetGrpcRequestCreation([this]() {
      kachaka_api::GetRequest request;
      request.mutable_metadata()->set_cursor(last_cursor_);
      return request;
    });
    this->SetPauseAsyncCallback([this]() {
      return publisher_->get_subscription_count() == 0 and not first_publish_;
    });
    this->SetGrpcResponseCallback([this](const GrpcResponse& response) {
      Ros2Msg msg;
      if (converter_(response, &msg)) {
        publisher_->publish(msg);
        first_publish_ = false;
      }
      last_cursor_ = response.metadata().cursor();
    });
  }
  ~Ros2TopicBridge() = default;

  Ros2TopicBridge(const Ros2TopicBridge&) = delete;
  Ros2TopicBridge& operator=(const Ros2TopicBridge&) = delete;

  void SetConverter(Converter converter) { converter_ = std::move(converter); }

 private:
  std::string ros2_topic_;
  Converter converter_{[](const GrpcResponse&, Ros2Msg*) {
    return false;
  }};
  typename rclcpp::Publisher<Ros2Msg>::SharedPtr publisher_;
  bool first_publish_{true};
  std::atomic_int64_t last_cursor_{0};
};

}  // namespace kachaka::grpc_ros2_bridge
