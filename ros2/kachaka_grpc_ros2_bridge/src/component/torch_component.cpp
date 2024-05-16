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

#include <grpcpp/grpcpp.h>
#include <rclcpp/publisher.hpp>
#include <rclcpp/rclcpp.hpp>
#include <rclcpp/subscription.hpp>
#include <rclcpp_components/register_node_macro.hpp>
#include <std_msgs/msg/detail/u_int8__struct.hpp>
#include <std_msgs/msg/u_int8.hpp>

#include "../error_code.hpp"
#include "../grpc_bridge.hpp"
#include "../ros2_topic_bridge.hpp"
#include "../stub_util.hpp"
#include "kachaka-api.grpc.pb.h"

namespace kachaka::grpc_ros2_bridge {

class TorchComponent : public rclcpp::Node {
 public:
  explicit TorchComponent(const rclcpp::NodeOptions& options)
      : Node("torch", options) {
    stub_ = GetSharedStub(declare_parameter("server_uri", ""));

    rclcpp::QoS qos(rclcpp::KeepLast{1});
    qos.transient_local();
    using namespace std::placeholders;
    set_front_torch_intensity_bridge_ = std::make_unique<
        GrpcBridge<kachaka_api::SetFrontTorchIntensityRequest,
                   kachaka_api::SetFrontTorchIntensityResponse>>(
        this, std::bind(&kachaka_api::KachakaApi::Stub::SetFrontTorchIntensity,
                        *stub_, _1, _2, _3));
    set_back_torch_intensity_bridge_ = std::make_unique<
        GrpcBridge<kachaka_api::SetBackTorchIntensityRequest,
                   kachaka_api::SetBackTorchIntensityResponse>>(
        this, std::bind(&kachaka_api::KachakaApi::Stub::SetBackTorchIntensity,
                        *stub_, _1, _2, _3));
    front_torch_intensity_subscriber_ =
        create_subscription<std_msgs::msg::UInt8>(
            "~/front", 1, [this](const std_msgs::msg::UInt8::SharedPtr msg) {
              TorchIntensityCallback(true, msg);
            });
    back_torch_intensity_subscriber_ =
        create_subscription<std_msgs::msg::UInt8>(
            "~/back", 1, [this](const std_msgs::msg::UInt8::SharedPtr msg) {
              TorchIntensityCallback(false, msg);
            });
  }
  ~TorchComponent() override = default;

  TorchComponent(const TorchComponent&) = delete;
  TorchComponent& operator=(const TorchComponent&) = delete;

 private:
  void TorchIntensityCallback(const bool is_front,
                              const std_msgs::msg::UInt8::SharedPtr msg) {
    if (is_front) {
      kachaka_api::SetFrontTorchIntensityRequest request;
      request.set_intensity(static_cast<int>(msg->data));
      kachaka_api::SetFrontTorchIntensityResponse response;
      set_front_torch_intensity_bridge_->CallSync(request, &response);
    } else {
      kachaka_api::SetBackTorchIntensityRequest request;
      request.set_intensity(static_cast<int>(msg->data));
      kachaka_api::SetBackTorchIntensityResponse response;
      set_back_torch_intensity_bridge_->CallSync(request, &response);
    }
  }

  std::shared_ptr<kachaka_api::KachakaApi::Stub> stub_{nullptr};
  rclcpp::Subscription<std_msgs::msg::UInt8>::SharedPtr
      front_torch_intensity_subscriber_{nullptr};
  rclcpp::Subscription<std_msgs::msg::UInt8>::SharedPtr
      back_torch_intensity_subscriber_{nullptr};
  std::unique_ptr<GrpcBridge<kachaka_api::SetFrontTorchIntensityRequest,
                             kachaka_api::SetFrontTorchIntensityResponse>>
      set_front_torch_intensity_bridge_;
  std::unique_ptr<GrpcBridge<kachaka_api::SetBackTorchIntensityRequest,
                             kachaka_api::SetBackTorchIntensityResponse>>
      set_back_torch_intensity_bridge_;
};

}  // namespace kachaka::grpc_ros2_bridge

RCLCPP_COMPONENTS_REGISTER_NODE(kachaka::grpc_ros2_bridge::TorchComponent)
