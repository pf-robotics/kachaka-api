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

import grpc
from google._upb._message import RepeatedCompositeContainer

from ..generated import kachaka_api_pb2 as pb2
from ..generated.kachaka_api_pb2_grpc import KachakaApiStub
from ..util.layout import ShelfLocationResolver


class KachakaApiClientBase:
    def __init__(self, target: str = "100.94.1.1:26400"):
        self.stub = KachakaApiStub(grpc.aio.insecure_channel(target))
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

    async def get_object_detection(
        self,
    ) -> tuple[pb2.RosHeader, RepeatedCompositeContainer]:
        request = pb2.GetRequest()
        response: pb2.GetObjectDetectionResponse = (
            await self.stub.GetObjectDetection(request)
        )
        return (response.header, response.objects)

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

    async def start_command(
        self,
        command: pb2.Command,
        *,
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
        response: pb2.StartCommandResponse = await self.stub.StartCommand(
            request
        )
        return response.result

    async def move_shelf(
        self,
        shelf_name_or_id: str,
        location_name_or_id: str,
        *,
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
            cancel_all=cancel_all,
            tts_on_success=tts_on_success,
            title=title,
        )

    async def return_shelf(
        self,
        shelf_name_or_id: str = "",
        *,
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
            cancel_all=cancel_all,
            tts_on_success=tts_on_success,
            title=title,
        )

    async def undock_shelf(
        self,
        *,
        cancel_all: bool = True,
        tts_on_success: str = "",
        title: str = "",
    ) -> pb2.Result:
        return await self.start_command(
            pb2.Command(undock_shelf_command=pb2.UndockShelfCommand()),
            cancel_all=cancel_all,
            tts_on_success=tts_on_success,
            title=title,
        )

    async def move_to_location(
        self,
        location_name_or_id: str,
        *,
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
            cancel_all=cancel_all,
            tts_on_success=tts_on_success,
            title=title,
        )

    async def return_home(
        self,
        *,
        cancel_all: bool = True,
        tts_on_success: str = "",
        title: str = "",
    ) -> pb2.Result:
        return await self.start_command(
            pb2.Command(return_home_command=pb2.ReturnHomeCommand()),
            cancel_all=cancel_all,
            tts_on_success=tts_on_success,
            title=title,
        )

    async def dock_shelf(
        self,
        *,
        cancel_all: bool = True,
        tts_on_success: str = "",
        title: str = "",
    ) -> pb2.Result:
        return await self.start_command(
            pb2.Command(dock_shelf_command=pb2.DockShelfCommand()),
            cancel_all=cancel_all,
            tts_on_success=tts_on_success,
            title=title,
        )

    async def speak(
        self,
        text: str,
        *,
        cancel_all: bool = True,
        tts_on_success: str = "",
        title: str = "",
    ) -> pb2.Result:
        return await self.start_command(
            pb2.Command(speak_command=pb2.SpeakCommand(text=text)),
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
        cancel_all: bool = True,
        tts_on_success: str = "",
        title: str = "",
    ) -> pb2.Result:
        return await self.start_command(
            pb2.Command(
                move_to_pose_command=pb2.MoveToPoseCommand(x=x, y=y, yaw=yaw)
            ),
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

    async def set_robot_velocity(
        self, linear: float, angular: float
    ) -> pb2.Result:
        request = pb2.SetRobotVelocityRequest(linear=linear, angular=angular)
        response: pb2.SetRobotVelocityResponse = (
            await self.stub.SetRobotVelocity(request)
        )
        return response.result

    async def get_history_list(
        self,
    ) -> RepeatedCompositeContainer:
        request = pb2.GetRequest()
        response: pb2.GetHistoryListResponse = await self.stub.GetHistoryList(
            request
        )
        return response.histories

    async def update_resolver(self) -> None:
        self.resolver.set_shelves(await self.get_shelves())
        self.resolver.set_locations(await self.get_locations())
