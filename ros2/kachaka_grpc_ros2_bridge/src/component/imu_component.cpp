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
#include <sensor_msgs/msg/imu.hpp>

#include "../converter/ros_header.hpp"
#include "../ros2_topic_bridge.hpp"
#include "../stub_util.hpp"
#include "kachaka-api.grpc.pb.h"

namespace kachaka::grpc_ros2_bridge {

class ImuComponent : public rclcpp::Node {
 public:
  explicit ImuComponent(const rclcpp::NodeOptions& options)
      : Node("imu", options) {
    this->declare_parameter("frame_prefix", "");
    frame_prefix_ = this->get_parameter("frame_prefix").as_string();
    stub_ = GetSharedStub(declare_parameter("server_uri", ""));

    rclcpp::SensorDataQoS qos;
    using namespace std::placeholders;
    imu_bridge_ = std::make_unique<
        Ros2TopicBridge<kachaka_api::GetRosImuResponse, sensor_msgs::msg::Imu>>(
        this,
        std::bind(&kachaka_api::KachakaApi::Stub::GetRosImu, *stub_, _1, _2,
                  _3),
        "~/imu", qos);
    imu_bridge_->SetConverter(
        [this](const kachaka_api::GetRosImuResponse& grpc_msg,
               sensor_msgs::msg::Imu* ros2_msg) {
          const auto& imu = grpc_msg.imu();
          converter::ConvertGrpcHeaderToRos2Header(
              imu.header(), &ros2_msg->header, this->frame_prefix_);
          ros2_msg->orientation.x = imu.orientation().x();
          ros2_msg->orientation.y = imu.orientation().y();
          ros2_msg->orientation.z = imu.orientation().z();
          ros2_msg->orientation.w = imu.orientation().w();
          for (int i = 0;
               i < static_cast<int>(ros2_msg->orientation_covariance.size());
               i++) {
            ros2_msg->orientation_covariance[i] =
                imu.orientation_covariance()[i];
          }

          ros2_msg->angular_velocity.x = imu.angular_velocity().x();
          ros2_msg->angular_velocity.y = imu.angular_velocity().y();
          ros2_msg->angular_velocity.z = imu.angular_velocity().z();
          for (int i = 0; i < static_cast<int>(
                                  ros2_msg->angular_velocity_covariance.size());
               i++) {
            ros2_msg->angular_velocity_covariance[i] =
                imu.angular_velocity_covariance()[i];
          }

          ros2_msg->linear_acceleration.x = imu.linear_acceleration().x();
          ros2_msg->linear_acceleration.y = imu.linear_acceleration().y();
          ros2_msg->linear_acceleration.z = imu.linear_acceleration().z();
          for (int i = 0;
               i < static_cast<int>(
                       ros2_msg->linear_acceleration_covariance.size());
               i++) {
            ros2_msg->linear_acceleration_covariance[i] =
                imu.linear_acceleration_covariance()[i];
          }

          return true;
        });
    imu_bridge_->StartAsync();
  }
  ~ImuComponent() override { imu_bridge_->StopAsync(); }

  ImuComponent(const ImuComponent&) = delete;
  ImuComponent& operator=(const ImuComponent&) = delete;

 private:
  std::string frame_prefix_;
  std::shared_ptr<kachaka_api::KachakaApi::Stub> stub_{nullptr};
  std::unique_ptr<
      Ros2TopicBridge<kachaka_api::GetRosImuResponse, sensor_msgs::msg::Imu>>
      imu_bridge_{nullptr};
};

}  // namespace kachaka::grpc_ros2_bridge

RCLCPP_COMPONENTS_REGISTER_NODE(kachaka::grpc_ros2_bridge::ImuComponent)
