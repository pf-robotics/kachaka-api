#  Copyright 2023 Preferred Robotics, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import json
import socket
from typing import AsyncIterator, Iterator, NamedTuple, TypedDict

import grpc
from google._upb._message import RepeatedCompositeContainer

from ..generated import kachaka_api_pb2 as pb2
from ..generated.kachaka_api_pb2_grpc import KachakaApiStub
from ..util.layout import ShelfLocationResolver

MAX_LINEAR_VELOCITY = 0.3
MAX_ANGULAR_VELOCITY = 1.57


class ErrorCode(NamedTuple):
    code: int
    error_type: str
    title: str
    description: str
    title_en: str
    description_en: str
    ref_url: str


def _resolve_hostname(domain: str) -> str | None:
    try:
        return socket.gethostbyname(domain)
    except socket.gaierror:
        return None


def _resolve_target(target: str) -> str | None:
    try:
        hostname, port = target.split(":")
    except ValueError:
        return None

    ip = _resolve_hostname(hostname)
    if ip is None:
        return None

    return f"{ip}:{port}"


class KachakaApiClientBase:
    def __init__(self, target: str = "100.94.1.1:26400") -> None:
        target_resolved = _resolve_target(target)
        if target_resolved is None:
            raise ValueError(f"Invalid target: {target}")
        self.stub = KachakaApiStub(grpc.aio.insecure_channel(target_resolved))
        self.resolver = ShelfLocationResolver()

    async def get_robot_serial_number(self) -> str:
        request = pb2.GetRequest()
        response: pb2.GetRobotSerialNumberResponse = (
            await self.stub.GetRobotSerialNumber(request)
        )
        return response.serial_number

    async def get_robot_version(self) -> str:
        request = pb2.GetRequest()
        response: pb2.GetRobotVersionResponse = await self.stub.GetRobotVersion(
            request
        )
        return response.version

    async def get_robot_pose(self) -> pb2.Pose:
        request = pb2.GetRequest()
        response: pb2.GetRobotPoseResponse = await self.stub.GetRobotPose(
            request
        )
        return response.pose

    async def get_png_map(self) -> pb2.Map:
        request = pb2.GetRequest()
        response: pb2.GetPngMapResponse = await self.stub.GetPngMap(request)
        return response.map

    async def get_battery_info(self) -> tuple[float, pb2.PowerSupplyStatus]:
        request = pb2.GetRequest()
        response: pb2.GetBatteryInfoResponse = await self.stub.GetBatteryInfo(
            request
        )
        return (response.battery_percentage, response.power_supply_status)

    async def get_object_detection(
        self,
    ) -> tuple[pb2.RosHeader, RepeatedCompositeContainer]:
        request = pb2.GetRequest()
        response: pb2.GetObjectDetectionResponse = (
            await self.stub.GetObjectDetection(request)
        )
        return (response.header, response.objects)

    async def get_object_detection_features(
        self,
    ) -> tuple[pb2.RosHeader, RepeatedCompositeContainer]:
        request = pb2.GetRequest()
        response: pb2.GetObjectDetectionFeaturesResponse = (
            await self.stub.GetObjectDetectionFeatures(request)
        )
        return (response.header, response.features)

    async def get_ros_imu(self) -> pb2.RosImu:
        request = pb2.GetRequest()
        response: pb2.GetRosImuResponse = await self.stub.GetRosImu(request)
        return response.imu

    async def get_ros_odometry(self) -> pb2.RosOdometry:
        request = pb2.GetRequest()
        response: pb2.GetRosOdometryResponse = await self.stub.GetRosOdometry(
            request
        )
        return response.odometry

    async def get_ros_wheel_odometry(self) -> pb2.RosOdometry:
        request = pb2.GetRequest()
        response: pb2.GetRosWheelOdometryResponse = (
            await self.stub.GetRosWheelOdometry(request)
        )
        return response.odometry

    async def get_ros_laser_scan(self) -> pb2.RosLaserScan:
        request = pb2.GetRequest()
        response: pb2.GetRosLaserScanResponse = await self.stub.GetRosLaserScan(
            request
        )
        return response.scan

    async def get_front_camera_ros_camera_info(self) -> pb2.RosCameraInfo:
        request = pb2.GetRequest()
        response: pb2.GetFrontCameraRosCameraInfoResponse = (
            await self.stub.GetFrontCameraRosCameraInfo(request)
        )
        return response.camera_info

    async def get_front_camera_ros_image(self) -> pb2.RosImage:
        request = pb2.GetRequest()
        response: pb2.GetFrontCameraRosImageResponse = (
            await self.stub.GetFrontCameraRosImage(request)
        )
        return response.image

    async def get_front_camera_ros_compressed_image(
        self,
    ) -> pb2.RosCompressedImage:
        request = pb2.GetRequest()
        response: pb2.GetFrontCameraRosCompressedImageResponse = (
            await self.stub.GetFrontCameraRosCompressedImage(request)
        )
        return response.image

    async def get_back_camera_ros_camera_info(self) -> pb2.RosCameraInfo:
        request = pb2.GetRequest()
        response: pb2.GetBackCameraRosCameraInfoResponse = (
            await self.stub.GetBackCameraRosCameraInfo(request)
        )
        return response.camera_info

    async def get_back_camera_ros_image(self) -> pb2.RosImage:
        request = pb2.GetRequest()
        response: pb2.GetBackCameraRosImageResponse = (
            await self.stub.GetBackCameraRosImage(request)
        )
        return response.image

    async def get_back_camera_ros_compressed_image(
        self,
    ) -> pb2.RosCompressedImage:
        request = pb2.GetRequest()
        response: pb2.GetBackCameraRosCompressedImageResponse = (
            await self.stub.GetBackCameraRosCompressedImage(request)
        )
        return response.image

    async def get_tof_camera_ros_camera_info(self) -> pb2.RosCameraInfo:
        request = pb2.GetRequest()
        response: pb2.GetTofCameraRosCameraInfoResponse = (
            await self.stub.GetTofCameraRosCameraInfo(request)
        )
        return response.camera_info

    async def get_tof_camera_ros_image(self) -> pb2.RosImage:
        request = pb2.GetRequest()
        response: pb2.GetTofCameraRosImageResponse = (
            await self.stub.GetTofCameraRosImage(request)
        )
        if not response.is_available:
            raise Exception("tof is not available on charger.")
        return response.image

    async def get_tof_camera_ros_compressed_image(
        self,
    ) -> pb2.RosCompressedImage:
        request = pb2.GetRequest()
        response: pb2.GetTofCameraRosCompressedImageResponse = (
            await self.stub.GetTofCameraRosCompressedImage(request)
        )
        if not response.is_available:
            raise Exception("tof is not available on charger.")
        return response.image

    async def start_command(
        self,
        command: pb2.Command,
        *,
        wait_for_completion: bool = True,
        cancel_all: bool = True,
        tts_on_success: str = "",
        title: str = "",
    ) -> pb2.Result:
        request = pb2.StartCommandRequest(
            command=command,
            cancel_all=cancel_all,
            tts_on_success=tts_on_success,
            title=title,
        )
        # Get the cursor position before start_command
        command_state_metadata = pb2.Metadata(cursor=0)
        command_state_metadata.cursor = (
            await self.stub.GetCommandState(
                pb2.GetRequest(metadata=command_state_metadata)
            )
        ).metadata.cursor
        response: pb2.StartCommandResponse = await self.stub.StartCommand(
            request
        )
        if not response.result.success or not wait_for_completion:
            return response.result
        while True:
            command_result_response: pb2.GetLastCommandResultResponse = (
                await self.stub.GetLastCommandResult(
                    pb2.GetRequest(metadata=command_state_metadata)
                )
            )
            command_state_metadata.cursor = (
                command_result_response.metadata.cursor
            )
            if command_result_response.command_id == response.command_id:
                break
        return (await self.get_last_command_result())[0]

    async def move_shelf(
        self,
        shelf_name_or_id: str,
        location_name_or_id: str,
        *,
        wait_for_completion: bool = True,
        cancel_all: bool = True,
        tts_on_success: str = "",
        title: str = "",
    ) -> pb2.Result:
        shelf_id = self.resolver.get_shelf_id_by_name(shelf_name_or_id)
        location_id = self.resolver.get_location_id_by_name(location_name_or_id)
        return await self.start_command(
            pb2.Command(
                move_shelf_command=pb2.MoveShelfCommand(
                    target_shelf_id=shelf_id,
                    destination_location_id=location_id,
                )
            ),
            wait_for_completion=wait_for_completion,
            cancel_all=cancel_all,
            tts_on_success=tts_on_success,
            title=title,
        )

    async def return_shelf(
        self,
        shelf_name_or_id: str = "",
        *,
        wait_for_completion: bool = True,
        cancel_all: bool = True,
        tts_on_success: str = "",
        title: str = "",
    ) -> pb2.Result:
        shelf_id = self.resolver.get_shelf_id_by_name(shelf_name_or_id)
        return await self.start_command(
            pb2.Command(
                return_shelf_command=pb2.ReturnShelfCommand(
                    target_shelf_id=shelf_id
                )
            ),
            wait_for_completion=wait_for_completion,
            cancel_all=cancel_all,
            tts_on_success=tts_on_success,
            title=title,
        )

    async def undock_shelf(
        self,
        *,
        wait_for_completion: bool = True,
        cancel_all: bool = True,
        tts_on_success: str = "",
        title: str = "",
    ) -> pb2.Result:
        return await self.start_command(
            pb2.Command(undock_shelf_command=pb2.UndockShelfCommand()),
            wait_for_completion=wait_for_completion,
            cancel_all=cancel_all,
            tts_on_success=tts_on_success,
            title=title,
        )

    async def move_to_location(
        self,
        location_name_or_id: str,
        *,
        wait_for_completion: bool = True,
        cancel_all: bool = True,
        tts_on_success: str = "",
        title: str = "",
    ) -> pb2.Result:
        location_id = self.resolver.get_location_id_by_name(location_name_or_id)
        return await self.start_command(
            pb2.Command(
                move_to_location_command=pb2.MoveToLocationCommand(
                    target_location_id=location_id
                )
            ),
            wait_for_completion=wait_for_completion,
            cancel_all=cancel_all,
            tts_on_success=tts_on_success,
            title=title,
        )

    async def return_home(
        self,
        *,
        wait_for_completion: bool = True,
        cancel_all: bool = True,
        tts_on_success: str = "",
        title: str = "",
    ) -> pb2.Result:
        return await self.start_command(
            pb2.Command(return_home_command=pb2.ReturnHomeCommand()),
            wait_for_completion=wait_for_completion,
            cancel_all=cancel_all,
            tts_on_success=tts_on_success,
            title=title,
        )

    async def dock_shelf(
        self,
        *,
        wait_for_completion: bool = True,
        cancel_all: bool = True,
        tts_on_success: str = "",
        title: str = "",
    ) -> pb2.Result:
        return await self.start_command(
            pb2.Command(dock_shelf_command=pb2.DockShelfCommand()),
            wait_for_completion=wait_for_completion,
            cancel_all=cancel_all,
            tts_on_success=tts_on_success,
            title=title,
        )

    async def speak(
        self,
        text: str,
        *,
        wait_for_completion: bool = True,
        cancel_all: bool = True,
        tts_on_success: str = "",
        title: str = "",
    ) -> pb2.Result:
        return await self.start_command(
            pb2.Command(speak_command=pb2.SpeakCommand(text=text)),
            wait_for_completion=wait_for_completion,
            cancel_all=cancel_all,
            tts_on_success=tts_on_success,
            title=title,
        )

    async def move_to_pose(
        self,
        x: float,
        y: float,
        yaw: float,
        *,
        wait_for_completion: bool = True,
        cancel_all: bool = True,
        tts_on_success: str = "",
        title: str = "",
    ) -> pb2.Result:
        return await self.start_command(
            pb2.Command(
                move_to_pose_command=pb2.MoveToPoseCommand(x=x, y=y, yaw=yaw)
            ),
            wait_for_completion=wait_for_completion,
            cancel_all=cancel_all,
            tts_on_success=tts_on_success,
            title=title,
        )

    async def move_forward(
        self,
        distance_meter: float,
        *,
        wait_for_completion: bool = True,
        cancel_all: bool = True,
        tts_on_success: str = "",
        title: str = "",
    ) -> pb2.Result:
        return await self.start_command(
            pb2.Command(
                move_forward_command=pb2.MoveForwardCommand(
                    distance_meter=distance_meter
                )
            ),
            wait_for_completion=wait_for_completion,
            cancel_all=cancel_all,
            tts_on_success=tts_on_success,
            title=title,
        )

    async def rotate_in_place(
        self,
        angle_radian: float,
        *,
        wait_for_completion: bool = True,
        cancel_all: bool = True,
        tts_on_success: str = "",
        title: str = "",
    ) -> pb2.Result:
        return await self.start_command(
            pb2.Command(
                rotate_in_place_command=pb2.RotateInPlaceCommand(
                    angle_radian=angle_radian
                )
            ),
            wait_for_completion=wait_for_completion,
            cancel_all=cancel_all,
            tts_on_success=tts_on_success,
            title=title,
        )

    async def dock_any_shelf_with_registration(
        self,
        target_location_id: str,
        dock_forward: bool = False,
        *,
        wait_for_completion: bool = True,
        cancel_all: bool = True,
        tts_on_success: str = "",
        title: str = "",
    ) -> pb2.Result:
        return await self.start_command(
            pb2.Command(
                dock_any_shelf_with_registration_command=pb2.DockAnyShelfWithRegistrationCommand(
                    target_location_id=target_location_id,
                    dock_forward=dock_forward,
                )
            ),
            wait_for_completion=wait_for_completion,
            cancel_all=cancel_all,
            tts_on_success=tts_on_success,
            title=title,
        )

    async def cancel_command(self) -> tuple[pb2.Result, pb2.Command]:
        request = pb2.EmptyRequest()
        response: pb2.CancelCommandResponse = await self.stub.CancelCommand(
            request
        )
        return (response.result, response.command)

    async def get_command_state(self) -> tuple[pb2.CommandState, pb2.Command]:
        request = pb2.GetRequest()
        response: pb2.GetCommandStateResponse = await self.stub.GetCommandState(
            request
        )
        return (response.state, response.command)

    async def is_command_running(self) -> bool:
        request = pb2.GetRequest()
        response: pb2.GetCommandStateResponse = await self.stub.GetCommandState(
            request
        )
        return response.state == pb2.CommandState.COMMAND_STATE_RUNNING

    async def get_running_command(self) -> pb2.Command | None:
        request = pb2.GetRequest()
        response: pb2.GetCommandStateResponse = await self.stub.GetCommandState(
            request
        )
        return response.command if response.HasField("command") else None

    async def get_last_command_result(self) -> tuple[pb2.Result, pb2.Command]:
        request = pb2.GetRequest()
        response: pb2.GetLastCommandResultResponse = (
            await self.stub.GetLastCommandResult(request)
        )
        return (response.result, response.command)

    async def get_locations(
        self,
    ) -> RepeatedCompositeContainer:
        request = pb2.GetRequest()
        response: pb2.GetLocationsResponse = await self.stub.GetLocations(
            request
        )
        return response.locations

    async def get_default_location_id(self) -> str:
        request = pb2.GetRequest()
        response: pb2.GetLocationsResponse = await self.stub.GetLocations(
            request
        )
        return response.default_location_id

    async def get_shelves(
        self,
    ) -> RepeatedCompositeContainer:
        request = pb2.GetRequest()
        response: pb2.GetShelvesResponse = await self.stub.GetShelves(request)
        return response.shelves

    async def get_moving_shelf_id(self) -> str:
        request = pb2.GetRequest()
        response: pb2.GetMovingShelfIdResponse = (
            await self.stub.GetMovingShelfId(request)
        )
        return response.shelf_id

    async def reset_shelf_pose(self, shelf_id: str) -> pb2.Result:
        request = pb2.ResetShelfPoseRequest(shelf_id=shelf_id)
        response: pb2.ResetShelfPoseResponse = await self.stub.ResetShelfPose(
            request
        )
        return response.result

    async def set_auto_homing_enabled(self, enable: bool) -> pb2.Result:
        request = pb2.SetAutoHomingEnabledRequest(enable=enable)
        response: pb2.SetAutoHomingEnabledResponse = (
            await self.stub.SetAutoHomingEnabled(request)
        )
        return response.result

    async def get_auto_homing_enabled(self) -> bool:
        request = pb2.GetRequest()
        response: pb2.GetAutoHomingEnabledResponse = (
            await self.stub.GetAutoHomingEnabled(request)
        )
        return response.enabled

    async def set_manual_control_enabled(self, enable: bool) -> pb2.Result:
        request = pb2.SetManualControlEnabledRequest(enable=enable)
        response: pb2.SetManualControlEnabledResponse = (
            await self.stub.SetManualControlEnabled(request)
        )
        return response.result

    async def get_manual_control_enabled(self) -> bool:
        request = pb2.GetRequest()
        response: pb2.GetManualControlEnabledResponse = (
            await self.stub.GetManualControlEnabled(request)
        )
        return response.enabled

    async def _impl_set_robot_velocity(
        self, linear: float, angular: float
    ) -> pb2.Result:
        request = pb2.SetRobotVelocityRequest(
            linear=linear / MAX_LINEAR_VELOCITY,
            angular=angular / MAX_ANGULAR_VELOCITY,
        )
        response: pb2.SetRobotVelocityResponse = (
            await self.stub.SetRobotVelocity(request)
        )
        return response.result

    async def set_robot_velocity(
        self, linear: float, angular: float
    ) -> pb2.Result:
        result = await self._impl_set_robot_velocity(linear, angular)
        if result.success:
            return result
        await self.set_manual_control_enabled(True)
        return await self._impl_set_robot_velocity(linear, angular)

    async def set_robot_stop(self):
        await self.set_robot_velocity(0, 0)
        await self.set_manual_control_enabled(False)

    async def get_map_list(self) -> RepeatedCompositeContainer:
        request = pb2.GetRequest()
        response: pb2.GetMapListResponse = await self.stub.GetMapList(request)
        return response.map_list_entries

    async def get_current_map_id(self) -> str:
        request = pb2.GetRequest()
        response: pb2.GetCurrentMapIdResponse = await self.stub.GetCurrentMapId(
            request
        )
        return response.id

    async def load_map_preview(self, map_id: str) -> tuple[pb2.Result, pb2.Map]:
        request = pb2.LoadMapPreviewRequest(map_id=map_id)
        response: pb2.LoadMapPreviewResponse = await self.stub.LoadMapPreview(
            request
        )
        return response.map

    async def export_map(
        self, map_id: str, output_file_path: str
    ) -> pb2.Result:
        request = pb2.ExportMapRequest(map_id=map_id)
        responses: AsyncIterator[pb2.ExportMapResponse] = self.stub.ExportMap(
            request
        )
        data = bytes()
        result = pb2.Result(success=False)
        async for response in responses:
            if response.HasField("middle_of_stream"):
                data += response.middle_of_stream.data
            elif response.HasField("end_of_stream"):
                result = response.end_of_stream.result

        if not result.success:
            return result

        with open(output_file_path, "wb") as file:
            file.write(data)
        return result

    async def import_map(
        self, target_file_path: str, chunk_size: int = 1024 * 1024
    ) -> tuple[pb2.Result, str]:
        def request_iterator() -> Iterator[pb2.ImportMapRequest]:
            with open(target_file_path, mode="rb") as file:
                while True:
                    chunk: bytes = file.read(chunk_size)
                    if not chunk:
                        break
                    yield pb2.ImportMapRequest(data=chunk)

        response: pb2.ImportMapResponse = await self.stub.ImportMap(
            request_iterator()
        )
        return response.result, response.map_id

    async def get_shortcuts(self) -> dict[str, str]:
        request = pb2.GetRequest()
        response: pb2.GetShortcutsResponse = await self.stub.GetShortcuts(
            request
        )
        return {item.id: item.name for item in response.shortcuts}

    async def start_shortcut_command(
        self, target_shortcut_id: str, cancel_all: bool = True
    ) -> pb2.Result:
        request = pb2.StartShortcutCommandRequest(
            target_shortcut_id=target_shortcut_id, cancel_all=cancel_all
        )
        response: pb2.StartShortcutCommandResponse = (
            await self.stub.StartShortcutCommand(request)
        )
        return response.result

    class Pose2d(TypedDict):
        x: float
        y: float
        theta: float

    async def switch_map(
        self,
        map_id: str,
        *,
        pose: Pose2d | None = None,
        inherit_docking_state_and_docked_shelf: bool = False,
    ) -> pb2.Result:
        # If "pose" is not specified, the initial pose is automatically determined to the charger pose.
        initial_pose = (
            pb2.Pose(x=pose["x"], y=pose["y"], theta=pose["theta"])
            if pose
            else None
        )
        request = pb2.SwitchMapRequest(
            map_id=map_id,
            initial_pose=initial_pose,
            inherit_docking_state_and_docked_shelf=inherit_docking_state_and_docked_shelf,
        )
        response: pb2.SwitchMapResponse = await self.stub.SwitchMap(request)
        return response.result

    async def get_history_list(
        self,
    ) -> RepeatedCompositeContainer:
        request = pb2.GetRequest()
        response: pb2.GetHistoryListResponse = await self.stub.GetHistoryList(
            request
        )
        return response.histories

    async def get_speaker_volume(self) -> int:
        """
        Get the current volume of the speaker. The volume is in the range of 0 to 10.
        """
        request = pb2.GetRequest()
        response: pb2.GetSpeakerVolumeResponse = (
            await self.stub.GetSpeakerVolume(request)
        )
        return response.volume

    async def set_speaker_volume(self, volume: int) -> pb2.Result:
        """
        Set the volume of the speaker. The volume is in the range of 0 to 10.
        """
        request = pb2.SetSpeakerVolumeRequest(volume=volume)
        response: pb2.SetSpeakerVolumeResponse = (
            await self.stub.SetSpeakerVolume(request)
        )
        return response.result

    async def restart_robot(self) -> pb2.Result:
        request = pb2.EmptyRequest()
        response: pb2.RestartRobotResponse = await self.stub.RestartRobot(
            request
        )
        return response.result

    async def get_error(self) -> list[int]:
        request = pb2.GetRequest()
        response: pb2.GetErrorResponse = await self.stub.GetError(request)
        return response.error_codes

    async def get_robot_error_code(self) -> dict[int, ErrorCode]:
        request = pb2.EmptyRequest()
        response: pb2.GetRobotErrorCodeJsonResponse = (
            await self.stub.GetRobotErrorCodeJson(request)
        )
        return {
            item["code"]: (
                ErrorCode(
                    item["code"],
                    item["error_type"],
                    item["title"],
                    item["description"],
                    item["title_en"],
                    item["description_en"],
                    item["ref_url"],
                )
            )
            for item in json.loads(response.json)
        }

    async def set_emergency_stop(self) -> int:
        request = pb2.EmptyRequest()
        response: pb2.SetEmergencyStopResponse = (
            await self.stub.SetEmergencyStop(request)
        )
        return response.result.error_code

    async def update_resolver(self) -> None:
        self.resolver.set_shelves(await self.get_shelves())
        self.resolver.set_locations(await self.get_locations())

    async def set_robot_pose(self, pose: Pose2d) -> pb2.Result:
        pose = pb2.Pose(x=pose["x"], y=pose["y"], theta=pose["theta"])
        request = pb2.SetRobotPoseRequest(pose=pose)
        response: pb2.SetRobotPoseResponse = await self.stub.SetRobotPose(
            request
        )
        return response.result
