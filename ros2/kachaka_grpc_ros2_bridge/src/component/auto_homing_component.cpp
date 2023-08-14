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
#include <rclcpp/rclcpp.hpp>
#include <rclcpp_components/register_node_macro.hpp>
#include <std_srvs/srv/set_bool.hpp>

#include "../error_code.hpp"
#include "../grpc_bridge.hpp"
#include "../ros2_topic_bridge.hpp"
#include "../stub_util.hpp"
#include "kachaka-api.grpc.pb.h"

using namespace std::chrono_literals;
using namespace std::placeholders;

namespace kachaka::grpc_ros2_bridge {

class AutoHomingComponent : public rclcpp::Node {
 public:
  explicit AutoHomingComponent(const rclcpp::NodeOptions& options)
      : Node("auto_homing", options) {
    stub_ = GetSharedStub(declare_parameter("server_uri", ""));

    rclcpp::QoS qos(rclcpp::KeepLast{1});
    qos.transient_local();
    using namespace std::placeholders;
    set_auto_homing_enabled_bridge_ =
        std::make_unique<GrpcBridge<kachaka_api::SetAutoHomingEnabledRequest,
                                    kachaka_api::SetAutoHomingEnabledResponse>>(
            this,
            std::bind(&kachaka_api::KachakaApi::Stub::SetAutoHomingEnabled,
                      *stub_, _1, _2, _3));
    set_auto_homing_enabled_service_ = create_service<std_srvs::srv::SetBool>(
        "~/set_enabled",
        std::bind(&AutoHomingComponent::HandleSetAutoHomingEnabled, this, _1,
                  _2, _3));
  }
  ~AutoHomingComponent() override = default;

  AutoHomingComponent(const AutoHomingComponent&) = delete;
  AutoHomingComponent& operator=(const AutoHomingComponent&) = delete;

 private:
  std::tuple<grpc::Status, kachaka_api::SetAutoHomingEnabledResponse>
  SetAutoHomingEnabled(const bool enabled) {
    kachaka_api::SetAutoHomingEnabledRequest grpc_request;
    grpc_request.set_enable(enabled);
    kachaka_api::SetAutoHomingEnabledResponse grpc_response;
    RCLCPP_INFO(get_logger(), "auto homing %s",
                enabled ? "enabled" : "disabled");
    const auto status =
        set_auto_homing_enabled_bridge_->CallSync(grpc_request, &grpc_response);
    return {status, grpc_response};
  }

  void HandleSetAutoHomingEnabled(
      [[maybe_unused]] const std::shared_ptr<rmw_request_id_t>& header,
      const std_srvs::srv::SetBool::Request::SharedPtr& request,
      const std_srvs::srv::SetBool::Response::SharedPtr& response) {
    const auto [status, grpc_response] = SetAutoHomingEnabled(request->data);
    if (status.ok()) {
      response->success = grpc_response.result().success();
    } else {
      response->success = status.ok();
    }
  }

  std::shared_ptr<kachaka_api::KachakaApi::Stub> stub_{nullptr};
  rclcpp::Service<std_srvs::srv::SetBool>::SharedPtr
      set_auto_homing_enabled_service_{nullptr};
  std::unique_ptr<GrpcBridge<kachaka_api::SetAutoHomingEnabledRequest,
                             kachaka_api::SetAutoHomingEnabledResponse>>
      set_auto_homing_enabled_bridge_;
};

}  // namespace kachaka::grpc_ros2_bridge

RCLCPP_COMPONENTS_REGISTER_NODE(kachaka::grpc_ros2_bridge::AutoHomingComponent)
