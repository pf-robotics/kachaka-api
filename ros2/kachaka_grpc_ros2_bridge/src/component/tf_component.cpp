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

#include <atomic>
#include <memory>
#include <thread>
#include <utility>

#include <geometry_msgs/msg/transform_stamped.hpp>
#include <grpcpp/grpcpp.h>
#include <rclcpp/rclcpp.hpp>
#include <rclcpp_components/register_node_macro.hpp>
#include <std_msgs/msg/string.hpp>
#include <tf2/LinearMath/Quaternion.h>
#include <tf2_ros/transform_broadcaster.h>

#include "../grpc_bridge.hpp"
#include "../stub_util.hpp"
#include "kachaka-api.grpc.pb.h"
#include "tf2_ros/static_transform_broadcaster.h"

namespace kachaka::grpc_ros2_bridge {

static constexpr std::string_view kOriginFrameId = "map";

class TfComponent : public rclcpp::Node {
 public:
  explicit TfComponent(const rclcpp::NodeOptions& options)
      : Node("tf", options) {
    stub_ = GetSharedStub(declare_parameter("server_uri", ""));

    tf_broadcaster_ = std::make_unique<tf2_ros::TransformBroadcaster>(this);
    tf_static_broadcaster_ =
        std::make_unique<tf2_ros::StaticTransformBroadcaster>(this);
    using namespace std::placeholders;
    get_robot_pose_bridge_ = std::make_unique<
        GrpcBridge<kachaka_api::GetRequest, kachaka_api::GetRobotPoseResponse>>(
        this, std::bind(&kachaka_api::KachakaApi::Stub::GetRobotPose, *stub_,
                        _1, _2, _3));
    get_robot_pose_bridge_->SetGrpcRequestCreation([this]() {
      kachaka_api::GetRequest request;
      request.mutable_metadata()->set_cursor(robot_pose_last_cursor_);
      return request;
    });
    get_robot_pose_bridge_->SetGrpcResponseCallback(
        [this](const kachaka_api::GetRobotPoseResponse& response) {
          const auto t = TransformStampedFromPose(
              get_clock()->now(), "base_footprint", response.pose());
          {
            std::lock_guard lock(mutex_);
            tf_broadcaster_->sendTransform(t);
          }
          robot_pose_last_cursor_ = response.metadata().cursor();
        });
    get_robot_pose_bridge_->StartAsync();
    get_shelves_bridge_ = std::make_unique<
        GrpcBridge<kachaka_api::GetRequest, kachaka_api::GetShelvesResponse>>(
        this, std::bind(&kachaka_api::KachakaApi::Stub::GetShelves, *stub_, _1,
                        _2, _3));
    get_shelves_bridge_->SetGrpcRequestCreation([this]() {
      kachaka_api::GetRequest request;
      request.mutable_metadata()->set_cursor(shelves_last_cursor_);
      return request;
    });
    get_shelves_bridge_->SetGrpcResponseCallback(
        [this](const kachaka_api::GetShelvesResponse& response) {
          const auto now = get_clock()->now();
          for (const auto& shelf : response.shelves()) {
            const auto t =
                TransformStampedFromPose(now, shelf.id(), shelf.pose());
            {
              std::lock_guard lock(mutex_);
              tf_static_broadcaster_->sendTransform(t);
            }
          }
          shelves_last_cursor_ = response.metadata().cursor();
        });
    get_shelves_bridge_->StartAsync();
    get_locations_bridge_ = std::make_unique<
        GrpcBridge<kachaka_api::GetRequest, kachaka_api::GetLocationsResponse>>(
        this, std::bind(&kachaka_api::KachakaApi::Stub::GetLocations, *stub_,
                        _1, _2, _3));
    get_locations_bridge_->SetGrpcRequestCreation([this]() {
      kachaka_api::GetRequest request;
      request.mutable_metadata()->set_cursor(locations_last_cursor_);
      return request;
    });
    get_locations_bridge_->SetGrpcResponseCallback(
        [this](const kachaka_api::GetLocationsResponse& response) {
          const auto now = get_clock()->now();
          for (const auto& location : response.locations()) {
            const auto t =
                TransformStampedFromPose(now, location.id(), location.pose());
            {
              std::lock_guard lock(mutex_);
              tf_static_broadcaster_->sendTransform(t);
            }
          }
          locations_last_cursor_ = response.metadata().cursor();
        });
    get_locations_bridge_->StartAsync();
  }
  ~TfComponent() override {
    get_robot_pose_bridge_->StopAsync();
    get_shelves_bridge_->StopAsync();
    get_locations_bridge_->StopAsync();
  }

  TfComponent(const TfComponent&) = delete;
  TfComponent& operator=(const TfComponent&) = delete;

 private:
  static geometry_msgs::msg::TransformStamped TransformStampedFromPose(
      const rclcpp::Time& stamp, std::string frame_id,
      const kachaka_api::Pose& pose) {
    geometry_msgs::msg::TransformStamped t;
    t.header.stamp = stamp;
    t.header.frame_id = kOriginFrameId;
    t.child_frame_id = std::move(frame_id);
    t.transform.translation.x = pose.x();
    t.transform.translation.y = pose.y();
    tf2::Quaternion q;
    q.setRPY(0, 0, pose.theta());
    t.transform.rotation.x = q.x();
    t.transform.rotation.y = q.y();
    t.transform.rotation.z = q.z();
    t.transform.rotation.w = q.w();
    return t;
  }

  std::shared_ptr<kachaka_api::KachakaApi::Stub> stub_{nullptr};
  std::mutex mutex_{};
  std::unique_ptr<tf2_ros::TransformBroadcaster> tf_broadcaster_{nullptr};
  std::unique_ptr<tf2_ros::StaticTransformBroadcaster> tf_static_broadcaster_{
      nullptr};
  std::unique_ptr<
      GrpcBridge<kachaka_api::GetRequest, kachaka_api::GetRobotPoseResponse>>
      get_robot_pose_bridge_{nullptr};
  std::unique_ptr<
      GrpcBridge<kachaka_api::GetRequest, kachaka_api::GetShelvesResponse>>
      get_shelves_bridge_{nullptr};
  std::unique_ptr<
      GrpcBridge<kachaka_api::GetRequest, kachaka_api::GetLocationsResponse>>
      get_locations_bridge_{nullptr};
  std::atomic_int64_t robot_pose_last_cursor_{0};
  std::atomic_int64_t shelves_last_cursor_{0};
  std::atomic_int64_t locations_last_cursor_{0};
};

}  // namespace kachaka::grpc_ros2_bridge

RCLCPP_COMPONENTS_REGISTER_NODE(kachaka::grpc_ros2_bridge::TfComponent)
