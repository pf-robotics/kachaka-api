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

#include <memory>

#include <diagnostic_msgs/msg/diagnostic_array.hpp>
#include <diagnostic_msgs/msg/diagnostic_status.hpp>
#include <diagnostic_msgs/msg/key_value.hpp>
#include <grpcpp/grpcpp.h>
#include <nlohmann/json.hpp>
#include <rclcpp/rclcpp.hpp>
#include <rclcpp_components/register_node_macro.hpp>

#include "../converter/ros_header.hpp"
#include "../grpc_bridge.hpp"
#include "../ros2_topic_bridge.hpp"
#include "../stub_util.hpp"
#include "kachaka-api.grpc.pb.h"

namespace kachaka::grpc_ros2_bridge {
using json = nlohmann::json;

class DiagnosticsComponent : public rclcpp::Node {
 public:
  explicit DiagnosticsComponent(const rclcpp::NodeOptions& options)
      : Node("diagnostics", options) {
    stub_ = GetSharedStub(declare_parameter("server_uri", ""));

    rclcpp::SensorDataQoS qos;
    using namespace std::placeholders;
    get_robot_error_code_json_bridge_ = std::make_unique<GrpcBridge<
        kachaka_api::EmptyRequest, kachaka_api::GetRobotErrorCodeJsonResponse>>(
        this, std::bind(&kachaka_api::KachakaApi::Stub::GetRobotErrorCodeJson,
                        *stub_, _1, _2, _3));
    kachaka_api::EmptyRequest request;
    kachaka_api::GetRobotErrorCodeJsonResponse response;
    get_robot_error_code_json_bridge_->CallSync(request, &response);
    json response_dictionary;
    response_dictionary = json::parse(response.json());
    for (auto& element : response_dictionary) {
      auto error_code = std::to_string(element[this->CODE].get<int>());
      robot_error_dictionary_[error_code] = element;
    }

    diagnostic_bridge_ = std::make_unique<Ros2TopicBridge<
        kachaka_api::GetErrorResponse, diagnostic_msgs::msg::DiagnosticArray>>(
        this,
        std::bind(&kachaka_api::KachakaApi::Stub::GetError, *stub_, _1, _2, _3),
        "~/error_status", qos);
    diagnostic_bridge_->SetConverter(
        [&, this](const kachaka_api::GetErrorResponse& grpc_msg,
                  diagnostic_msgs::msg::DiagnosticArray* ros2_msg) {
          ros2_msg->header.stamp = this->now();
          ros2_msg->header.frame_id = "";

          const auto& error_codes = grpc_msg.error_codes();
          for (auto& ec : error_codes) {
            auto ec_str = std::to_string(ec);
            if (this->robot_error_dictionary_.contains(ec_str)) {
              const auto& error_info = this->robot_error_dictionary_[ec_str];
              diagnostic_msgs::msg::DiagnosticStatus diag;
              if (error_info[this->ERROR_TYPE] == this->ERROR_TYPE_BUG ||
                  error_info[this->ERROR_TYPE] == this->ERROR_TYPE_IGNORE) {
                diag.level = diagnostic_msgs::msg::DiagnosticStatus::OK;
              } else if (error_info[this->ERROR_TYPE] ==
                         this->ERROR_TYPE_WARN) {
                diag.level = diagnostic_msgs::msg::DiagnosticStatus::WARN;
              } else {
                // ERROR_TYPE_ERROR, ERROR_TYPE_FATAL
                // ERROR_TYPE_CALL_FOR_SUPPORT
                diag.level = diagnostic_msgs::msg::DiagnosticStatus::ERROR;
              }
              diag.name = std::to_string(error_info[this->CODE].get<int>());
              diag.message = error_info[this->TITLE_EN].get<std::string>();
              diagnostic_msgs::msg::KeyValue code, title, description, e_title,
                  e_description, error_type, ref_url;
              title.key = this->TITLE;
              title.value = error_info[this->TITLE].get<std::string>();
              description.key = this->DESC;
              description.value = error_info[this->DESC].get<std::string>();
              e_title.key = this->TITLE_EN;
              e_title.value = error_info[this->TITLE_EN].get<std::string>();
              e_description.key = this->DESC_EN;
              e_description.value =
                  error_info[this->DESC_EN].get<std::string>();
              error_type.key = this->ERROR_TYPE;
              error_type.value =
                  error_info[this->ERROR_TYPE].get<std::string>();
              ref_url.key = this->REF_URL;
              ref_url.value = error_info[this->REF_URL].get<std::string>();
              diag.values.emplace_back(code);
              diag.values.emplace_back(title);
              diag.values.emplace_back(description);
              diag.values.emplace_back(e_title);
              diag.values.emplace_back(e_description);
              diag.values.emplace_back(error_type);
              diag.values.emplace_back(ref_url);
              ros2_msg->status.emplace_back(diag);
            }
          }

          return true;
        });

    diagnostic_bridge_->StartAsync();
  }
  ~DiagnosticsComponent() override { diagnostic_bridge_->StopAsync(); }

  DiagnosticsComponent(const DiagnosticsComponent&) = delete;
  DiagnosticsComponent& operator=(const DiagnosticsComponent&) = delete;

 private:
  const std::string CODE = "code";
  const std::string TITLE = "title";
  const std::string TITLE_EN = "title_en";
  const std::string DESC = "description";
  const std::string DESC_EN = "description_en";
  const std::string ERROR_TYPE = "error_type";
  const std::string REF_URL = "ref_url";
  const std::string ERROR_TYPE_BUG = "Bug";
  const std::string ERROR_TYPE_IGNORE = "Ignore";
  const std::string ERROR_TYPE_WARN = "Warn";
  const std::string ERROR_TYPE_ERROR = "Error";
  const std::string ERROR_TYPE_FATAL = "Fatal";
  const std::string ERROR_TYPE_CALL_FOR_SUPPORT = "CallForSupport";
  json robot_error_dictionary_;
  std::shared_ptr<kachaka_api::KachakaApi::Stub> stub_{nullptr};
  std::unique_ptr<Ros2TopicBridge<kachaka_api::GetErrorResponse,
                                  diagnostic_msgs::msg::DiagnosticArray>>
      diagnostic_bridge_{nullptr};
  std::unique_ptr<GrpcBridge<kachaka_api::EmptyRequest,
                             kachaka_api::GetRobotErrorCodeJsonResponse>>
      get_robot_error_code_json_bridge_;
};

}  // namespace kachaka::grpc_ros2_bridge

RCLCPP_COMPONENTS_REGISTER_NODE(kachaka::grpc_ros2_bridge::DiagnosticsComponent)
