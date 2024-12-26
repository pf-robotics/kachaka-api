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

#include "ros_header.hpp"

#include <rclcpp/rclcpp.hpp>
#include <std_msgs/msg/header.hpp>

#include "kachaka-api.pb.h"

namespace kachaka::grpc_ros2_bridge::converter {

void ConvertGrpcHeaderToRos2Header(const kachaka_api::RosHeader& grpc_header,
                                   std_msgs::msg::Header* ros2_header,
                                   const std::string& frame_prefix) {
  ros2_header->stamp = rclcpp::Time(grpc_header.stamp_nsec());
  ros2_header->frame_id = frame_prefix + grpc_header.frame_id();
}

}  // namespace kachaka::grpc_ros2_bridge::converter
