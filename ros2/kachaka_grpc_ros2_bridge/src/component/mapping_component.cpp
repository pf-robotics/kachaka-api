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

#include <grpcpp/grpcpp.h>
#include <nav_msgs/msg/occupancy_grid.hpp>
#include <opencv2/opencv.hpp>
#include <rclcpp/rclcpp.hpp>
#include <rclcpp_components/register_node_macro.hpp>
#include <std_msgs/msg/string.hpp>
#include <tf2/LinearMath/Quaternion.h>

#include "../ros2_topic_bridge.hpp"
#include "../stub_util.hpp"
#include "kachaka-api.grpc.pb.h"

namespace kachaka::grpc_ros2_bridge {

static constexpr std::string_view kOriginFrameId = "map";

class MappingComponent : public rclcpp::Node {
 public:
  explicit MappingComponent(const rclcpp::NodeOptions& options)
      : Node("map", options) {
    stub_ = GetSharedStub(declare_parameter("server_uri", ""));

    rclcpp::QoS qos(rclcpp::KeepLast{1});
    qos.transient_local();
    using namespace std::placeholders;
    map_bridge_ =
        std::make_unique<Ros2TopicBridge<kachaka_api::GetPngMapResponse,
                                         nav_msgs::msg::OccupancyGrid>>(
            this,
            std::bind(&kachaka_api::KachakaApi::Stub::GetPngMap, *stub_, _1, _2,
                      _3),
            "~/map", qos);
    map_bridge_->SetConverter(
        [this](const kachaka_api::GetPngMapResponse& grpc_msg,
               nav_msgs::msg::OccupancyGrid* ros2_msg) {
          ros2_msg->header.frame_id = kOriginFrameId;
          ros2_msg->header.stamp = get_clock()->now();
          if (grpc_msg.map().data().empty()) {
            return false;
          }
          FillMapMetaData(grpc_msg, ros2_msg);
          FillOccupancyGridData(grpc_msg, ros2_msg);
          return true;
        });
    map_bridge_->StartAsync();
  }
  ~MappingComponent() override { map_bridge_->StopAsync(); }

  MappingComponent(const MappingComponent&) = delete;
  MappingComponent& operator=(const MappingComponent&) = delete;

 private:
  static void FillMapMetaData(const kachaka_api::GetPngMapResponse& grpc_msg,
                              nav_msgs::msg::OccupancyGrid* ros2_msg) {
    ros2_msg->info.width = grpc_msg.map().width();
    ros2_msg->info.height = grpc_msg.map().height();
    ros2_msg->info.resolution = static_cast<float>(grpc_msg.map().resolution());
    ros2_msg->info.origin.position.x = grpc_msg.map().origin().x();
    ros2_msg->info.origin.position.y = grpc_msg.map().origin().y();
    tf2::Quaternion q;
    q.setRPY(0.0, 0.0, grpc_msg.map().origin().theta());
    ros2_msg->info.origin.orientation.x = q.x();
    ros2_msg->info.origin.orientation.y = q.y();
    ros2_msg->info.origin.orientation.z = q.z();
    ros2_msg->info.origin.orientation.w = q.w();
  }

  static void FillOccupancyGridData(
      const kachaka_api::GetPngMapResponse& grpc_msg,
      nav_msgs::msg::OccupancyGrid* ros2_msg) {
    std::vector<uchar> buffer(grpc_msg.map().data().begin(),
                              grpc_msg.map().data().end());
    cv::Mat map = cv::imdecode(cv::Mat(buffer, false), cv::IMREAD_GRAYSCALE);
    cv::Mat flipped;
    cv::flip(map, flipped, 0);
    ros2_msg->data.reserve(grpc_msg.map().height() * grpc_msg.map().width());
    ros2_msg->data.assign(flipped.begin<uint8_t>(), flipped.end<uint8_t>());

    // The occupancy grid uses color images for the user interface.
    // However, the occupancy grid has to follow the ROS convention.
    // Avoid using occupancy constants and instead use a pure grayscale
    // occupancy grid.
    static constexpr int8_t kPngOccupied = -82;
    static constexpr int8_t kPngFree = -3;
    static constexpr int8_t kPngUnkown = -22;
    static constexpr int8_t kRosOccupied = 100;
    static constexpr int8_t kRosFree = 0;
    static constexpr int8_t kRosUnkown = -1;
    for (int8_t& value : ros2_msg->data) {
      if (value == kPngOccupied) {
        value = kRosOccupied;
      } else if (value == kPngFree) {
        value = kRosFree;
      } else {
        value = kRosUnkown;
      }
    }
  }

  std::shared_ptr<kachaka_api::KachakaApi::Stub> stub_{nullptr};
  std::unique_ptr<Ros2TopicBridge<kachaka_api::GetPngMapResponse,
                                  nav_msgs::msg::OccupancyGrid>>
      map_bridge_{nullptr};
};

}  // namespace kachaka::grpc_ros2_bridge

RCLCPP_COMPONENTS_REGISTER_NODE(kachaka::grpc_ros2_bridge::MappingComponent)
