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

from __future__ import annotations

import asyncio
from typing import (
    AsyncGenerator,
    Awaitable,
    Callable,
    Generic,
    ParamSpec,
    Protocol,
    TypeVar,
)

from google._upb._message import RepeatedCompositeContainer

from ..generated import kachaka_api_pb2 as pb2
from .base import KachakaApiClientBase


def build_get_request(cursor: int) -> pb2.GetRequest:
    return pb2.GetRequest(metadata=pb2.Metadata(cursor=cursor))


class HasMetadata(Protocol):
    metadata: pb2.Metadata


T = TypeVar("T", bound=HasMetadata)
U = TypeVar("U")
P = ParamSpec("P")
CallbackType = Callable[[U], Awaitable[None]] | None


class ResponseHandler(Generic[T, U]):
    def __init__(
        self,
        get_function: Callable[[pb2.GetRequest], Awaitable[T]],
        pick_response: Callable[[T], U],
    ) -> None:
        self._callback: CallbackType[U] = None
        self._get_function = get_function
        self._pick_response = pick_response

    async def get(self, cursor: int = 0) -> tuple[int, U]:
        request: pb2.GetRequest = build_get_request(cursor)
        response: T = await self._get_function(request)
        cursor = response.metadata.cursor
        return (cursor, self._pick_response(response))

    async def _run(self) -> None:
        cursor = 0
        while self._callback is not None:
            (cursor, picked_response) = await self.get(cursor)
            await self._callback(picked_response)

    def set_callback(self, callback: CallbackType[U]) -> None:
        if self._callback is not None and callback is not None:
            raise RuntimeError("Callback is already set")
        self._callback = callback
        if callback is not None:
            asyncio.create_task(self._run())

    async def stream(self) -> AsyncGenerator[U, None]:
        cursor = 0
        while True:
            (cursor, picked_response) = await self.get(cursor)
            yield picked_response


class TupleResponseHandler(ResponseHandler[T, U], Generic[T, U, P]):
    def set_tuple_callback(
        self, callback: Callable[P, Awaitable[None]] | None
    ) -> None:
        if callback is None:
            self.callback = None
            return
        if self.callback is not None:
            raise RuntimeError("Callback is already set")

        def extract_tuple_and_run(args: U) -> Awaitable[None]:
            assert isinstance(args, tuple)
            return callback(*args)

        self.callback = extract_tuple_and_run
        asyncio.create_task(self._run())


class KachakaApiClient(KachakaApiClientBase):
    def __init__(self, target: str = "100.94.1.1:26400") -> None:
        super().__init__(target)
        self._running = True

        self.png_map = ResponseHandler[pb2.GetPngMapResponse, pb2.Map](
            self.stub.GetPngMap, lambda r: r.map
        )
        self.set_png_map_callback = self.png_map.set_callback

        self.robot_pose = ResponseHandler[pb2.GetRobotPoseResponse, pb2.Pose](
            self.stub.GetRobotPose, lambda r: r.pose
        )
        self.set_robot_pose_callback = self.robot_pose.set_callback

        self.object_detection = TupleResponseHandler[
            pb2.GetObjectDetectionResponse,
            tuple[pb2.RosHeader, RepeatedCompositeContainer],
            [pb2.RosHeader, RepeatedCompositeContainer],
        ](self.stub.GetObjectDetection, lambda r: (r.header, r.objects))
        self.object_detection_callback = (
            self.object_detection.set_tuple_callback
        )

        self.ros_imu = ResponseHandler[pb2.GetRosImuResponse, pb2.RosImu](
            self.stub.GetRosImu, lambda r: r.imu
        )
        self.set_ros_imu_callback = self.ros_imu.set_callback

        self.ros_odometry = ResponseHandler[
            pb2.GetRosOdometryResponse, pb2.RosOdometry
        ](self.stub.GetRosOdometry, lambda r: r.odometry)
        self.set_ros_odometry_callback = self.ros_odometry.set_callback

        self.ros_laser_scan = ResponseHandler[
            pb2.GetRosLaserScanResponse, pb2.RosLaserScan
        ](self.stub.GetRosLaserScan, lambda r: r.scan)
        self.set_ros_laser_scan_callback = self.ros_laser_scan.set_callback

        self.front_camera_ros_image = ResponseHandler[
            pb2.GetFrontCameraRosImageResponse, pb2.RosImage
        ](self.stub.GetFrontCameraRosImage, lambda r: r.image)
        self.set_front_camera_ros_image_callback = (
            self.front_camera_ros_image.set_callback
        )

        self.front_camera_ros_compressed_image = ResponseHandler[
            pb2.GetFrontCameraRosCompressedImageResponse, pb2.RosCompressedImage
        ](self.stub.GetFrontCameraRosCompressedImage, lambda r: r.image)
        self.set_front_camera_ros_compressed_image_callback = (
            self.front_camera_ros_compressed_image.set_callback
        )

        self.command_state = TupleResponseHandler[
            pb2.GetCommandStateResponse,
            tuple[pb2.CommandState, pb2.Command],
            [pb2.CommandState, pb2.Command],
        ](self.stub.GetCommandState, lambda r: (r.state, r.command))
        self.set_command_state_callback = self.command_state.set_callback

        self.last_command_result = TupleResponseHandler[
            pb2.GetLastCommandResultResponse,
            tuple[pb2.Result, pb2.Command],
            [pb2.Result, pb2.Command],
        ](self.stub.GetLastCommandResult, lambda r: (r.result, r.command))
        self.set_last_command_result_callback = (
            self.last_command_result.set_tuple_callback
        )

        self.shelves = ResponseHandler[
            pb2.GetShelvesResponse, RepeatedCompositeContainer
        ](self.stub.GetShelves, lambda r: r.shelves)
        self.set_shelves_callback = self.shelves.set_callback

        self.locations = ResponseHandler[
            pb2.GetLocationsResponse, RepeatedCompositeContainer
        ](self.stub.GetLocations, lambda r: r.locations)
        self.set_locations_callback = self.locations.set_callback

        self.history_list = ResponseHandler[
            pb2.GetHistoryListResponse, RepeatedCompositeContainer
        ](self.stub.GetHistoryList, lambda r: r.histories)
        self.set_history_list_callback = self.history_list.set_callback

        self.auto_homing_enabled = ResponseHandler[
            pb2.GetAutoHomingEnabledResponse, bool
        ](self.stub.GetAutoHomingEnabled, lambda r: r.enabled)
        self.set_auto_homing_enabled_callback = (
            self.auto_homing_enabled.set_callback
        )

        self.manual_control_enabled = ResponseHandler[
            pb2.GetManualControlEnabledResponse, bool
        ](self.stub.GetManualControlEnabled, lambda r: r.enabled)
        self.set_manual_control_enabled_callback = (
            self.manual_control_enabled.set_callback
        )
