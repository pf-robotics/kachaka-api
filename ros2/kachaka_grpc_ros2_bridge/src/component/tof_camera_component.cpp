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

#include <grpcpp/grpcpp.h>
#include <rclcpp/rclcpp.hpp>
#include <rclcpp_components/register_node_macro.hpp>

#include "../camera_bridge.hpp"
#include "kachaka-api.grpc.pb.h"

namespace kachaka::grpc_ros2_bridge {

class TofCameraComponent : public rclcpp::Node {
 public:
  explicit TofCameraComponent(const rclcpp::NodeOptions& options)
      : Node("tof_camera", options) {
    this->declare_parameter("frame_prefix", "");
    frame_prefix_ = this->get_parameter("frame_prefix").as_string();
    stub_ = GetSharedStub(declare_parameter("server_uri", ""));
    using namespace std::placeholders;
    tof_camera_bridge_ = std::make_unique<
        CameraBridge<kachaka_api::GetTofCameraRosCameraInfoResponse,
                     kachaka_api::GetTofCameraRosImageResponse,
                     kachaka_api::GetTofCameraRosCompressedImageResponse>>(
        frame_prefix_, stub_, this, true,
        std::bind(&kachaka_api::KachakaApi::Stub::GetTofCameraRosCameraInfo,
                  *stub_, _1, _2, _3),
        std::bind(&kachaka_api::KachakaApi::Stub::GetTofCameraRosImage, *stub_,
                  _1, _2, _3),
        std::bind(
            &kachaka_api::KachakaApi::Stub::GetTofCameraRosCompressedImage,
            *stub_, _1, _2, _3));
  }

  ~TofCameraComponent() = default;

  TofCameraComponent(const TofCameraComponent&) = delete;
  TofCameraComponent& operator=(const TofCameraComponent&) = delete;

 private:
  std::string frame_prefix_;
  std::shared_ptr<kachaka_api::KachakaApi::Stub> stub_{nullptr};
  std::unique_ptr<
      CameraBridge<kachaka_api::GetTofCameraRosCameraInfoResponse,
                   kachaka_api::GetTofCameraRosImageResponse,
                   kachaka_api::GetTofCameraRosCompressedImageResponse>>
      tof_camera_bridge_;
};

}  // namespace kachaka::grpc_ros2_bridge

RCLCPP_COMPONENTS_REGISTER_NODE(kachaka::grpc_ros2_bridge::TofCameraComponent)
