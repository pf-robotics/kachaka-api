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
#include <sensor_msgs/msg/laser_scan.hpp>

#include "../converter/ros_header.hpp"
#include "../ros2_topic_bridge.hpp"
#include "../stub_util.hpp"
#include "kachaka-api.grpc.pb.h"

namespace kachaka::grpc_ros2_bridge {

class LidarComponent : public rclcpp::Node {
 public:
  explicit LidarComponent(const rclcpp::NodeOptions& options)
      : Node("lidar", options) {
    this->declare_parameter("frame_prefix", "");
    frame_prefix_ = this->get_parameter("frame_prefix").as_string();
    stub_ = GetSharedStub(declare_parameter("server_uri", ""));

    rclcpp::SensorDataQoS qos;
    using namespace std::placeholders;
    scan_bridge_ =
        std::make_unique<Ros2TopicBridge<kachaka_api::GetRosLaserScanResponse,
                                         sensor_msgs::msg::LaserScan>>(
            this,
            std::bind(&kachaka_api::KachakaApi::Stub::GetRosLaserScan, *stub_,
                      _1, _2, _3),
            "~/scan", qos);
    scan_bridge_->SetConverter(
        [this](const kachaka_api::GetRosLaserScanResponse& grpc_msg,
               sensor_msgs::msg::LaserScan* ros2_msg) {
          converter::ConvertGrpcHeaderToRos2Header(
              grpc_msg.scan().header(), &ros2_msg->header, this->frame_prefix_);
          ros2_msg->angle_min = grpc_msg.scan().angle_min();
          ros2_msg->angle_max = grpc_msg.scan().angle_max();
          ros2_msg->angle_increment = grpc_msg.scan().angle_increment();
          ros2_msg->time_increment = grpc_msg.scan().time_increment();
          ros2_msg->scan_time = grpc_msg.scan().scan_time();
          ros2_msg->range_min = grpc_msg.scan().range_min();
          ros2_msg->range_max = grpc_msg.scan().range_max();
          ros2_msg->ranges.reserve(grpc_msg.scan().ranges().size());
          std::copy(grpc_msg.scan().ranges().begin(),
                    grpc_msg.scan().ranges().end(),
                    std::back_inserter(ros2_msg->ranges));
          ros2_msg->intensities.reserve(grpc_msg.scan().intensities().size());
          std::copy(grpc_msg.scan().intensities().begin(),
                    grpc_msg.scan().intensities().end(),
                    std::back_inserter(ros2_msg->intensities));
          return true;
        });
    scan_bridge_->StartAsync();
  }
  ~LidarComponent() override { scan_bridge_->StopAsync(); }

  LidarComponent(const LidarComponent&) = delete;
  LidarComponent& operator=(const LidarComponent&) = delete;

 private:
  std::string frame_prefix_;
  std::shared_ptr<kachaka_api::KachakaApi::Stub> stub_{nullptr};
  std::unique_ptr<Ros2TopicBridge<kachaka_api::GetRosLaserScanResponse,
                                  sensor_msgs::msg::LaserScan>>
      scan_bridge_{nullptr};
};

}  // namespace kachaka::grpc_ros2_bridge

RCLCPP_COMPONENTS_REGISTER_NODE(kachaka::grpc_ros2_bridge::LidarComponent)
