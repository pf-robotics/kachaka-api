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

#include <geometry_msgs/msg/pose2_d.hpp>
#include <grpcpp/grpcpp.h>
#include <kachaka_interfaces/msg/location.hpp>
#include <kachaka_interfaces/msg/location_list.hpp>
#include <kachaka_interfaces/msg/shelf.hpp>
#include <kachaka_interfaces/msg/shelf_list.hpp>
#include <rclcpp/rclcpp.hpp>
#include <rclcpp_components/register_node_macro.hpp>
#include <std_msgs/msg/string.hpp>

#include "../ros2_topic_bridge.hpp"
#include "../stub_util.hpp"
#include "kachaka-api.grpc.pb.h"

using namespace std::placeholders;

namespace kachaka::grpc_ros2_bridge {

class LayoutComponent : public rclcpp::Node {
 public:
  explicit LayoutComponent(const rclcpp::NodeOptions& options)
      : Node("layout", options) {
    stub_ = GetSharedStub(declare_parameter("server_uri", ""));

    rclcpp::QoS qos(rclcpp::KeepLast{1});
    qos.transient_local();
    shelf_list_bridge_ =
        std::make_unique<Ros2TopicBridge<kachaka_api::GetShelvesResponse,
                                         kachaka_interfaces::msg::ShelfList>>(
            this,
            std::bind(&kachaka_api::KachakaApi::Stub::GetShelves, *stub_, _1,
                      _2, _3),
            "~/shelves/list", qos);
    shelf_list_bridge_->SetConverter(
        [this](const kachaka_api::GetShelvesResponse& grpc_msg,
               kachaka_interfaces::msg::ShelfList* ros2_msg) {
          for (const auto& shelf : grpc_msg.shelves()) {
            kachaka_interfaces::msg::Shelf ros2_shelf;
            ros2_shelf.id = shelf.id();
            ros2_shelf.name = shelf.name();
            ros2_shelf.pose.x = shelf.pose().x();
            ros2_shelf.pose.y = shelf.pose().y();
            ros2_shelf.pose.theta = shelf.pose().theta();
            ros2_shelf.size.width = shelf.size().width();
            ros2_shelf.size.depth = shelf.size().depth();
            ros2_shelf.home_location_id = shelf.home_location_id();
            ros2_shelf.speed_mode = shelf.speed_mode();
            ros2_msg->shelves.push_back(std::move(ros2_shelf));
          }
          return true;
        });
    shelf_list_bridge_->StartAsync();
    location_list_bridge_ = std::make_unique<
        Ros2TopicBridge<kachaka_api::GetLocationsResponse,
                        kachaka_interfaces::msg::LocationList>>(
        this,
        std::bind(&kachaka_api::KachakaApi::Stub::GetLocations, *stub_, _1, _2,
                  _3),
        "~/locations/list", qos);
    location_list_bridge_->SetConverter(
        [this](const kachaka_api::GetLocationsResponse& grpc_msg,
               kachaka_interfaces::msg::LocationList* ros2_msg) {
          for (const auto& location : grpc_msg.locations()) {
            kachaka_interfaces::msg::Location ros2_location;
            ros2_location.id = location.id();
            ros2_location.name = location.name();
            ros2_location.type = location.type();
            ros2_location.pose.x = location.pose().x();
            ros2_location.pose.y = location.pose().y();
            ros2_location.pose.theta = location.pose().theta();
            ros2_msg->locations.push_back(std::move(ros2_location));
          }
          ros2_msg->default_location_id = grpc_msg.default_location_id();
          return true;
        });
    location_list_bridge_->StartAsync();
  }
  ~LayoutComponent() override {
    shelf_list_bridge_->StopAsync();
    location_list_bridge_->StopAsync();
  }

  LayoutComponent(const LayoutComponent&) = delete;
  LayoutComponent& operator=(const LayoutComponent&) = delete;

 private:
  std::shared_ptr<kachaka_api::KachakaApi::Stub> stub_{nullptr};
  std::unique_ptr<Ros2TopicBridge<kachaka_api::GetShelvesResponse,
                                  kachaka_interfaces::msg::ShelfList>>
      shelf_list_bridge_{nullptr};
  std::unique_ptr<Ros2TopicBridge<kachaka_api::GetLocationsResponse,
                                  kachaka_interfaces::msg::LocationList>>
      location_list_bridge_{nullptr};
};

}  // namespace kachaka::grpc_ros2_bridge

RCLCPP_COMPONENTS_REGISTER_NODE(kachaka::grpc_ros2_bridge::LayoutComponent)
