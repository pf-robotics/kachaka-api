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

#include "kachaka_command.hpp"

namespace kachaka::grpc_ros2_bridge::converter {

std::optional<kachaka_interfaces::msg::KachakaCommand> ConvertToRos2(
    const kachaka_api::Command& in) {
  kachaka_interfaces::msg::KachakaCommand out;
  if (in.has_move_shelf_command()) {
    out.command_type =
        kachaka_interfaces::msg::KachakaCommand::MOVE_SHELF_COMMAND;
    out.move_shelf_command_target_shelf_id =
        in.move_shelf_command().target_shelf_id();
    out.move_shelf_command_destination_location_id =
        in.move_shelf_command().destination_location_id();
    out.move_shelf_command_undock_on_destination = false;
  } else if (in.has_return_shelf_command()) {
    out.command_type =
        kachaka_interfaces::msg::KachakaCommand::RETURN_SHELF_COMMAND;
    out.return_shelf_command_target_shelf_id =
        in.return_shelf_command().target_shelf_id();
  } else if (in.has_undock_shelf_command()) {
    out.command_type =
        kachaka_interfaces::msg::KachakaCommand::UNDOCK_SHELF_COMMAND;
    out.undock_shelf_command_target_shelf_id =
        in.undock_shelf_command().target_shelf_id();
  } else if (in.has_move_to_location_command()) {
    out.command_type =
        kachaka_interfaces::msg::KachakaCommand::MOVE_TO_LOCATION_COMMAND;
    out.move_to_location_command_target_location_id =
        in.move_to_location_command().target_location_id();
  } else if (in.has_return_home_command()) {
    out.command_type =
        kachaka_interfaces::msg::KachakaCommand::RETURN_HOME_COMMAND;
    // always set silent flag as false
    out.return_home_command_silent = false;
  } else if (in.has_dock_shelf_command()) {
    out.command_type =
        kachaka_interfaces::msg::KachakaCommand::DOCK_SHELF_COMMAND;
  } else if (in.has_speak_command()) {
    out.command_type = kachaka_interfaces::msg::KachakaCommand::SPEAK_COMMAND;
    out.speak_command_text = in.speak_command().text();
  } else if (in.has_move_to_pose_command()) {
    out.command_type =
        kachaka_interfaces::msg::KachakaCommand::MOVE_TO_POSE_COMMAND;
    out.move_to_pose_command_x = in.move_to_pose_command().x();
    out.move_to_pose_command_y = in.move_to_pose_command().y();
    out.move_to_pose_command_yaw = in.move_to_pose_command().yaw();
  } else {
    return std::nullopt;
  }
  return out;
}

std::optional<kachaka_api::Command> ConvertToGrpc(
    const kachaka_interfaces::msg::KachakaCommand& in) {
  kachaka_api::Command out;
  switch (in.command_type) {
    case kachaka_interfaces::msg::KachakaCommand::MOVE_SHELF_COMMAND:
      out.mutable_move_shelf_command()->set_target_shelf_id(
          in.move_shelf_command_target_shelf_id);
      out.mutable_move_shelf_command()->set_destination_location_id(
          in.move_shelf_command_destination_location_id);
      break;
    case kachaka_interfaces::msg::KachakaCommand::RETURN_SHELF_COMMAND:
      out.mutable_return_shelf_command()->set_target_shelf_id(
          in.return_shelf_command_target_shelf_id);
      break;
    case kachaka_interfaces::msg::KachakaCommand::UNDOCK_SHELF_COMMAND:
      out.mutable_undock_shelf_command()->set_target_shelf_id(
          in.undock_shelf_command_target_shelf_id);
      break;
    case kachaka_interfaces::msg::KachakaCommand::MOVE_TO_LOCATION_COMMAND:
      out.mutable_move_to_location_command()->set_target_location_id(
          in.move_to_location_command_target_location_id);
      break;
    case kachaka_interfaces::msg::KachakaCommand::RETURN_HOME_COMMAND:
      out.mutable_return_home_command();
      break;
    case kachaka_interfaces::msg::KachakaCommand::DOCK_SHELF_COMMAND:
      out.mutable_dock_shelf_command();
      break;
    case kachaka_interfaces::msg::KachakaCommand::SPEAK_COMMAND:
      out.mutable_speak_command()->set_text(in.speak_command_text);
      break;
    case kachaka_interfaces::msg::KachakaCommand::MOVE_TO_POSE_COMMAND:
      out.mutable_move_to_pose_command()->set_x(in.move_to_pose_command_x);
      out.mutable_move_to_pose_command()->set_y(in.move_to_pose_command_y);
      out.mutable_move_to_pose_command()->set_yaw(in.move_to_pose_command_yaw);
      break;
    default:
      return std::nullopt;
  }
  return out;
}
}  // namespace kachaka::grpc_ros2_bridge::converter
