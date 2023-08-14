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
from typing import Awaitable, Optional, Tuple

from ..generated.kachaka_api_pb2 import (
    Command,
    CommandState,
    GetRequest,
    History,
    Location,
    Map,
    Metadata,
    ObjectDetection,
    Pose,
    Result,
    RosCameraInfo,
    RosCompressedImage,
    RosHeader,
    RosImage,
    RosImu,
    RosLaserScan,
    Shelf,
)
from .base import KachakaApiClientBase


def build_get_request(cursor: int) -> GetRequest:
    return GetRequest(metadata=Metadata(cursor=cursor))


class KachakaApiClient(KachakaApiClientBase):
    def __init__(self, target: str = "100.94.1.1:26400") -> None:
        super().__init__(target)
        self._running = True

        self.get_robot_serial_number_cursor = 0
        self.get_robot_version_cursor = 0
        self.get_robot_pose_cursor = 0
        self.get_png_map_cursor = 0
        self.get_object_detection_cursor = 0
        self.get_ros_imu_cursor = 0
        self.get_ros_laser_scan_cursor = 0
        self.get_front_camera_ros_camera_info_cursor = 0
        self.get_front_camera_ros_image_cursor = 0
        self.get_front_camera_ros_compressed_image_cursor = 0
        self.get_command_state_cursor = 0
        self.get_last_command_result_cursor = 0
        self.get_locations_cursor = 0
        self.get_default_location_id_cursor = 0
        self.get_shelves_cursor = 0
        self.get_auto_homing_enabled_cursor = 0
        self.get_manual_control_enabled_cursor = 0
        self.get_history_list_cursor = 0

        self._robot_serial_number: Optional[str] = None
        self._robot_serial_number_callback: Optional[
            callable[[str], Awaitable[None]]
        ] = None
        self._robot_version: Optional[str] = None
        self._robot_version_callback: Optional[
            callable[[str], Awaitable[None]]
        ] = None
        self._robot_pose: Optional[Pose] = None
        self._robot_pose_callback: Optional[
            callable[[Pose], Awaitable[None]]
        ] = None
        self._png_map: Optional[Map] = None
        self._png_map_callback: Optional[
            callable[[Map], Awaitable[None]]
        ] = None
        self._object_detection: Optional[
            Tuple[RosHeader, list[ObjectDetection]]
        ] = None
        self._object_detection_callback: Optional[
            callable[[RosHeader, list[ObjectDetection]], Awaitable[None]]
        ] = None
        self._ros_imu: Optional[RosImu] = None
        self._ros_imu_callback: Optional[
            callable[[RosImu], Awaitable[None]]
        ] = None
        self._ros_laser_scan: Optional[RosLaserScan] = None
        self._ros_laser_scan_callback: Optional[
            callable[[RosLaserScan], Awaitable[None]]
        ] = None
        self._front_camera_ros_camera_info: Optional[RosCameraInfo] = None
        self._front_camera_ros_camera_info_callback: Optional[
            callable[[RosCameraInfo], Awaitable[None]]
        ] = None
        self._front_camera_ros_image: Optional[RosImage] = None
        self._front_camera_ros_image_callback: Optional[
            callable[[RosImage], Awaitable[None]]
        ] = None
        self._front_camera_ros_compressed_image: Optional[
            RosCompressedImage
        ] = None
        self._front_camera_ros_compressed_image_callback: Optional[
            callable[[RosCompressedImage], Awaitable[None]]
        ] = None
        self._command_state: Optional[Tuple[CommandState, Command]] = None
        self._command_state_callback: Optional[
            callable[[CommandState, Command], Awaitable[None]]
        ] = None
        self._last_command_result: Optional[Tuple[Result, Command]] = None
        self._last_command_result_callback: Optional[
            callable[[Result, Command], Awaitable[None]]
        ] = None
        self._shelves: Optional[list[Shelf]] = []
        self._shelves_callback: Optional[
            callable[[list[Shelf]], Awaitable[None]]
        ] = None
        self._locations: Optional[list[Location]] = None
        self._locations_callback: Optional[
            callable[[list[Location]], Awaitable[None]]
        ] = None
        self._default_location_id: Optional[str] = None
        self._default_location_id_callback: Optional[
            callable[[str], Awaitable[None]]
        ] = None
        self._histories: Optional[list[History]] = None
        self._histories_callback: Optional[
            callable[[list[History]], Awaitable[None]]
        ] = None
        self._auto_homing_enabled: Optional[bool] = None
        self._auto_homing_enabled_callback: Optional[
            callable[[bool], Awaitable[None]]
        ] = None
        self._manual_control_enabled: Optional[bool] = None
        self._manual_control_enabled_callback: Optional[
            callable[[bool], Awaitable[None]]
        ] = None

    @classmethod
    async def create(
        cls, target: str = "100.94.1.1:26400"
    ) -> "KachakaApiClient":
        self = KachakaApiClient(target)
        return self

    def shutdown(self) -> None:
        self._running = False

    async def _run_get_robot_serial_number(self) -> None:
        while self._running and self._robot_serial_number_callback is not None:
            request = build_get_request(self.get_robot_serial_number_cursor)
            response = await self.stub.GetRobotSerialNumber(request)
            self.get_robot_serial_number_cursor = response.metadata.cursor

            self._robot_serial_number = response.robot_serial_number
            assert self._robot_serial_number is not None

            if self._robot_serial_number_callback:
                await self._robot_serial_number_callback(
                    self._robot_serial_number
                )

    async def _run_get_robot_version(self) -> None:
        while self._running and self._robot_version_callback is not None:
            request = build_get_request(self.get_robot_version_cursor)
            response = await self.stub.GetRobotVersion(request)
            self.get_robot_version_cursor = response.metadata.cursor

            self._robot_version = response.robot_version
            assert self._robot_version is not None

            if self._robot_version_callback:
                await self._robot_version_callback(self._robot_version)

    async def _run_get_robot_pose(self) -> None:
        while self._running and self._robot_pose_callback is not None:
            request = build_get_request(self.get_robot_pose_cursor)
            response = await self.stub.GetRobotPose(request)
            self.get_robot_pose_cursor = response.metadata.cursor

            self._robot_pose = response.robot_pose

            if self._robot_pose_callback:
                await self._robot_pose_callback(self._robot_pose)

    async def _run_get_png_map(self) -> None:
        while self._running and self._png_map_callback is not None:
            request = build_get_request(self.get_png_map_cursor)
            response = await self.stub.GetPngMap(request)
            self.get_png_map_cursor = response.metadata.cursor

            self._png_map = response.png_map

            if self._png_map_callback:
                await self._png_map_callback(self._png_map)

    async def _run_get_object_detection(self) -> None:
        while self._running and self._object_detection_callback is not None:
            request = build_get_request(self.get_object_detection_cursor)
            response = await self.stub.GetObjectDetection(request)
            self.get_object_detection_cursor = response.metadata.cursor

            self._object_detection = (
                response.header,
                response.objects,
            )

            if self._object_detection_callback:
                await self._object_detection_callback(
                    self._object_detection[0], self._object_detection[1]
                )

    async def _run_get_ros_imu(self) -> None:
        while self._running and self._ros_imu_callback is not None:
            request = build_get_request(self.get_ros_imu_cursor)
            response = await self.stub.GetRosImu(request)
            self.get_ros_imu_cursor = response.metadata.cursor

            self._ros_imu = response.ros_imu

            if self._ros_imu_callback:
                await self._ros_imu_callback(self._ros_imu)

    async def _run_get_ros_laser_scan(self) -> None:
        while self._running and self._ros_laser_scan_callback is not None:
            request = build_get_request(self.get_ros_laser_scan_cursor)
            response = await self.stub.GetRosLaserScan(request)
            self.get_ros_laser_scan_cursor = response.metadata.cursor

            self._ros_laser_scan = response.ros_laser_scan

            if self._ros_laser_scan_callback:
                await self._ros_laser_scan_callback(self._ros_laser_scan)

    async def _run_get_front_camera_ros_camera_info(self) -> None:
        while (
            self._running
            and self._front_camera_ros_camera_info_callback is not None
        ):
            request = build_get_request(
                self.get_front_camera_ros_camera_info_cursor
            )
            response = await self.stub.GetFrontCameraRosCameraInfo(request)
            self.get_front_camera_ros_camera_info_cursor = (
                response.metadata.cursor
            )

            self._front_camera_ros_camera_info = (
                response.front_camera_ros_camera_info
            )

            if self._front_camera_ros_camera_info_callback:
                await self._front_camera_ros_camera_info_callback(
                    self._front_camera_ros_camera_info
                )

    async def _run_get_front_camera_ros_image(self) -> None:
        while (
            self._running and self._front_camera_ros_image_callback is not None
        ):
            request = build_get_request(self.get_front_camera_ros_image_cursor)
            response = await self.stub.GetFrontCameraRosImage(request)
            self.get_front_camera_ros_image_cursor = response.metadata.cursor

            self._front_camera_ros_image = response.front_camera_ros_image

            if self._front_camera_ros_image_callback:
                await self._front_camera_ros_image_callback(
                    self._front_camera_ros_image
                )

    async def _run_get_front_camera_ros_compressed_image(self) -> None:
        while (
            self._running
            and self._front_camera_ros_compressed_image_callback is not None
        ):
            request = build_get_request(
                self.get_front_camera_ros_compressed_image_cursor
            )
            response = await self.stub.GetFrontCameraRosCompressedImage(request)
            self.get_front_camera_ros_compressed_image_cursor = (
                response.metadata.cursor
            )

            self._front_camera_ros_compressed_image = (
                response.front_camera_ros_compressed_image
            )

            if self._front_camera_ros_compressed_image_callback:
                await self._front_camera_ros_compressed_image_callback(
                    self._front_camera_ros_compressed_image
                )

    async def _run_get_command_state(self) -> None:
        while self._running and self._command_state_callback is not None:
            request = build_get_request(self.get_command_state_cursor)
            response = await self.stub.GetCommandState(request)
            self.get_command_state_cursor = response.metadata.cursor

            self._command_state = (response.command_state, response.command)

            if self._command_state_callback:
                await self._command_state_callback(*self._command_state)

    async def _run_get_last_command_result(self) -> None:
        while self._running and self._last_command_result_callback is not None:
            request = build_get_request(self.get_last_command_result_cursor)
            response = await self.stub.GetLastCommandResult(request)
            self.get_last_command_result_cursor = response.metadata.cursor

            self._last_command_result = (response.result, response.command)

            if self._last_command_result_callback:
                await self._last_command_result_callback(
                    *self._last_command_result
                )

    async def _run_get_shelves(self) -> None:
        while self._running and self._shelves_callback is not None:
            request = build_get_request(self.get_shelves_cursor)
            response = await self.stub.GetShelves(request)
            self.get_shelves_cursor = response.metadata.cursor

            self._shelves = response.shelves

            if self._shelves_callback:
                await self._shelves_callback(self._shelves)

    async def _run_get_locations(self) -> None:
        while self._running and self._locations_callback is not None:
            request = build_get_request(self.get_locations_cursor)
            response = await self.stub.GetLocations(request)
            self.get_locations_cursor = response.metadata.cursor

            self._locations = response.locations
            self._default_location_id = response.default_location_id
            assert self._default_location_id is not None

            callback_calls = []
            if self._locations_callback is not None:
                callback_calls.append(self._locations_callback(self._locations))

            if self._default_location_id_callback is not None:
                callback_calls.append(
                    self._default_location_id_callback(
                        self._default_location_id
                    )
                )

            await asyncio.gather(*callback_calls)

    async def _run_get_histories(self) -> None:
        while self._running and self._histories_callback is not None:
            request = build_get_request(self.get_history_list_cursor)
            response = await self.stub.GetHistoryList(request)
            self.get_history_list_cursor = response.metadata.cursor

            self._histories = response.histories

            if self._histories_callback:
                await self._histories_callback(self._histories)

    async def _run_get_auto_homing_enabled(self) -> None:
        while self._running and self._auto_homing_enabled_callback is not None:
            request = build_get_request(self.get_auto_homing_enabled_cursor)
            response = await self.stub.GetAutoHomingEnabled(request)
            self.get_auto_homing_enabled_cursor = response.metadata.cursor

            self._auto_homing_enabled = response.auto_homing_enabled
            assert self._auto_homing_enabled is not None

            if self._auto_homing_enabled_callback:
                await self._auto_homing_enabled_callback(
                    self._auto_homing_enabled
                )

    async def _run_get_manual_control_enabled(self) -> None:
        while (
            self._running and self._manual_control_enabled_callback is not None
        ):
            request = build_get_request(self.get_manual_control_enabled_cursor)
            response = await self.stub.GetManualControlEnabled(request)
            self.get_manual_control_enabled_cursor = response.metadata.cursor

            self._manual_control_enabled = response.manual_control_enabled
            assert self._manual_control_enabled is not None

            if self._manual_control_enabled_callback:
                await self._manual_control_enabled_callback(
                    self._manual_control_enabled
                )

    def set_robot_serial_number_callback(
        self, callback: Optional[callable[[str], Awaitable[None]]]
    ) -> None:
        self._robot_serial_number_callback = callback
        if callback is not None:
            asyncio.create_task(self._run_get_robot_serial_number())

    def set_robot_version_callback(
        self, callback: Optional[callable[[str], Awaitable[None]]]
    ) -> None:
        self._robot_version_callback = callback
        if callback is not None:
            asyncio.create_task(self._run_get_robot_version())

    def set_robot_pose_callback(
        self, callback: Optional[callable[[Pose], Awaitable[None]]]
    ) -> None:
        self._robot_pose_callback = callback
        if callback is not None:
            asyncio.create_task(self._run_get_robot_pose())

    def set_png_map_callback(
        self, callback: Optional[callable[[Map], Awaitable[None]]]
    ) -> None:
        self._png_map_callback = callback
        if callback is not None:
            asyncio.create_task(self._run_get_png_map())

    def set_object_detection_callback(
        self,
        callback: Optional[
            callable[[RosHeader, list[ObjectDetection]], Awaitable[None]]
        ],
    ) -> None:
        self._object_detection_callback = callback
        if callback is not None:
            asyncio.create_task(self._run_get_object_detection())

    def set_ros_imu_callback(
        self, callback: Optional[callable[[RosImu], Awaitable[None]]]
    ) -> None:
        self._ros_imu_callback = callback
        if callback is not None:
            asyncio.create_task(self._run_get_ros_imu())

    def set_ros_laser_scan_callback(
        self, callback: Optional[callable[[RosLaserScan], Awaitable[None]]]
    ) -> None:
        self._ros_laser_scan_callback = callback
        if callback is not None:
            asyncio.create_task(self._run_get_ros_laser_scan())

    def set_front_camera_ros_camera_info_callback(
        self, callback: Optional[callable[[RosCameraInfo], Awaitable[None]]]
    ) -> None:
        self._front_camera_ros_camera_info_callback = callback
        if callback is not None:
            asyncio.create_task(self._run_get_front_camera_ros_camera_info())

    def set_front_camera_ros_image_callback(
        self, callback: Optional[callable[[RosImage], Awaitable[None]]]
    ) -> None:
        self._front_camera_ros_image_callback = callback
        if callback is not None:
            asyncio.create_task(self._run_get_front_camera_ros_image())

    def set_front_camera_ros_compressed_image_callback(
        self,
        callback: Optional[callable[[RosCompressedImage], Awaitable[None]]],
    ) -> None:
        self._front_camera_ros_compressed_image_callback = callback
        if callback is not None:
            asyncio.create_task(
                self._run_get_front_camera_ros_compressed_image()
            )

    def set_command_state_callback(
        self,
        callback: Optional[callable[[CommandState, Command], Awaitable[None]]],
    ) -> None:
        self._command_state_callback = callback
        if callback is not None:
            asyncio.create_task(self._run_get_command_state())

    def set_last_command_result_callback(
        self,
        callback: Optional[callable[[Result, Command], Awaitable[None]]],
    ) -> None:
        self._last_command_result_callback = callback
        if callback is not None:
            asyncio.create_task(self._run_get_last_command_result())

    def set_shelves_callback(
        self, callback: Optional[callable[[list[Shelf]], Awaitable[None]]]
    ) -> None:
        self._shelves_callback = callback
        if callback is not None:
            asyncio.create_task(self._run_get_shelves())

    def set_locations_callback(
        self, callback: Optional[callable[[list[Location]], Awaitable[None]]]
    ) -> None:
        self._locations_callback = callback
        self._start_locations_if_necessary()

    def set_default_location_id_callback(
        self, callback: Optional[callable[[str], Awaitable[None]]]
    ) -> None:
        self._default_location_id_callback = callback
        self._start_locations_if_necessary()

    def set_history_list_callback(
        self, callback: Optional[callable[[list[History]], Awaitable[None]]]
    ) -> None:
        self._histories_callback = callback
        if callback is not None:
            asyncio.create_task(self._run_get_histories())

    def set_auto_homing_enabled_callback(
        self, callback: Optional[callable[[bool], Awaitable[None]]]
    ) -> None:
        self._auto_homing_enabled_callback = callback
        if callback is not None:
            asyncio.create_task(self._run_get_auto_homing_enabled())

    def set_manual_control_enabled_callback(
        self, callback: Optional[callable[[bool], Awaitable[None]]]
    ) -> None:
        self._manual_control_enabled_callback = callback
        if callback is not None:
            asyncio.create_task(self._run_get_manual_control_enabled())

    def _start_locations_if_necessary(self) -> None:
        if (
            self._locations_callback is not None
            or self._default_location_id_callback is not None
        ):
            asyncio.create_task(self._run_get_locations())
