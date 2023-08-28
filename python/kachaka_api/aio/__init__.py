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
from typing import Awaitable, Callable, Generic, ParamSpec, Protocol, TypeVar

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
        self.callback: CallbackType[U] = None
        self.get_function = get_function
        self.pick_response = pick_response

    async def _run(self) -> None:
        cursor = 0
        while self.callback is not None:
            request = build_get_request(cursor)
            response = await self.get_function(request)
            cursor = response.metadata.cursor
            if self.callback is not None:
                picked_response = self.pick_response(response)
                await self.callback(picked_response)

    def set_callback(self, callback: CallbackType[U]) -> None:
        if self.callback is not None and callback is not None:
            raise RuntimeError("Callback is already set")
        self.callback = callback
        if callback is not None:
            asyncio.create_task(self._run())


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

        self.robot_pose: ResponseHandler[
            pb2.GetRobotPoseResponse, pb2.Pose
        ] = ResponseHandler(self.stub.GetRobotPose, lambda r: r.pose)

        self.png_map: ResponseHandler[
            pb2.GetPngMapResponse, pb2.Map
        ] = ResponseHandler(self.stub.GetPngMap, lambda r: r.map)

        self.object_detection: TupleResponseHandler[
            pb2.GetObjectDetectionResponse,
            tuple[pb2.RosHeader, RepeatedCompositeContainer],
            [pb2.RosHeader, RepeatedCompositeContainer],
        ] = TupleResponseHandler(
            self.stub.GetObjectDetection, lambda r: (r.header, r.objects)
        )

        self.ros_imu: ResponseHandler[
            pb2.GetRosImuResponse, pb2.RosImu
        ] = ResponseHandler(self.stub.GetRosImu, lambda r: r.imu)

        self.ros_odometry: ResponseHandler[
            pb2.GetRosOdometryResponse, pb2.RosOdometry
        ] = ResponseHandler(self.stub.GetRosOdometry, lambda r: r.odometry)

        self.ros_laser_scan: ResponseHandler[
            pb2.GetRosLaserScanResponse, pb2.RosLaserScan
        ] = ResponseHandler(self.stub.GetRosLaserScan, lambda r: r.scan)

        self.front_camera_ros_image: ResponseHandler[
            pb2.GetFrontCameraRosImageResponse, pb2.RosImage
        ] = ResponseHandler(self.stub.GetFrontCameraRosImage, lambda r: r.image)

        self.front_camera_ros_compressed_image: ResponseHandler[
            pb2.GetFrontCameraRosCompressedImageResponse, pb2.RosCompressedImage
        ] = ResponseHandler(
            self.stub.GetFrontCameraRosCompressedImage, lambda r: r.image
        )

        self.command_state: TupleResponseHandler[
            pb2.GetCommandStateResponse,
            tuple[pb2.CommandState, pb2.Command],
            [pb2.CommandState, pb2.Command],
        ] = TupleResponseHandler(
            self.stub.GetCommandState, lambda r: (r.state, r.command)
        )

        self.last_command_result: TupleResponseHandler[
            pb2.GetLastCommandResultResponse,
            tuple[pb2.Result, pb2.Command],
            [pb2.Result, pb2.Command],
        ] = TupleResponseHandler(
            self.stub.GetLastCommandResult, lambda r: (r.result, r.command)
        )

        self.locations: ResponseHandler[
            pb2.GetLocationsResponse, RepeatedCompositeContainer
        ] = ResponseHandler(self.stub.GetLocations, lambda r: r.locations)

        self.shelves: ResponseHandler[
            pb2.GetShelvesResponse, RepeatedCompositeContainer
        ] = ResponseHandler(self.stub.GetShelves, lambda r: r.shelves)

        self.auto_homing_enabled: ResponseHandler[
            pb2.GetAutoHomingEnabledResponse, bool
        ] = ResponseHandler(self.stub.GetAutoHomingEnabled, lambda r: r.enabled)

        self.manual_control_enabled: ResponseHandler[
            pb2.GetManualControlEnabledResponse, bool
        ] = ResponseHandler(
            self.stub.GetManualControlEnabled, lambda r: r.enabled
        )

        self.history_list: ResponseHandler[
            pb2.GetHistoryListResponse, RepeatedCompositeContainer
        ] = ResponseHandler(self.stub.GetHistoryList, lambda r: r.histories)

    def set_robot_pose_callback(self, callback: CallbackType[pb2.Pose]) -> None:
        self.robot_pose.set_callback(callback)

    def set_png_map_callback(self, callback: CallbackType[pb2.Map]) -> None:
        self.png_map.set_callback(callback)

    def set_object_detection_callback(
        self,
        callback: Callable[
            [pb2.RosHeader, RepeatedCompositeContainer], Awaitable[None]
        ]
        | None,
    ) -> None:
        self.object_detection.set_tuple_callback(callback)

    def set_ros_imu_callback(
        self,
        callback: CallbackType[pb2.RosImu],
    ) -> None:
        self.ros_imu.set_callback(callback)

    def set_ros_odometry_callback(
        self,
        callback: CallbackType[pb2.RosOdometry],
    ) -> None:
        self.ros_odometry.set_callback(callback)

    def set_ros_laser_scan_callback(
        self,
        callback: CallbackType[pb2.RosLaserScan],
    ) -> None:
        self.ros_laser_scan.set_callback(callback)

    def set_front_camera_ros_image_callback(
        self,
        callback: CallbackType[pb2.RosImage],
    ) -> None:
        self.front_camera_ros_image.set_callback(callback)

    def set_front_camera_ros_compressed_image_callback(
        self,
        callback: CallbackType[pb2.RosCompressedImage],
    ) -> None:
        self.front_camera_ros_compressed_image.set_callback(callback)

    def set_command_state_callback(
        self,
        callback: Callable[[pb2.CommandState, pb2.Command], Awaitable[None]]
        | None,
    ) -> None:
        self.command_state.set_tuple_callback(callback)

    def set_locations_callback(
        self, callback: CallbackType[RepeatedCompositeContainer]
    ) -> None:
        self.locations.set_callback(callback)

    def set_shelves_callback(
        self, callback: CallbackType[RepeatedCompositeContainer]
    ) -> None:
        self.shelves.set_callback(callback)

    def set_last_command_result_callback(
        self,
        callback: Callable[[pb2.Result, pb2.Command], Awaitable[None]] | None,
    ) -> None:
        self.last_command_result.set_tuple_callback(callback)

    def set_auto_homing_enabled_callback(
        self, callback: CallbackType[bool]
    ) -> None:
        self.auto_homing_enabled.set_callback(callback)

    def set_manual_control_enabled_callback(
        self, callback: CallbackType[bool]
    ) -> None:
        self.manual_control_enabled.set_callback(callback)

    def set_history_list_callback(
        self, callback: CallbackType[RepeatedCompositeContainer]
    ) -> None:
        self.history_list.set_callback(callback)
