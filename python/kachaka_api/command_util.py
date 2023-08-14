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

from .generated import kachaka_api_pb2
from .layout_util import ShelfLocationResolver


class CommandTextFormatter:
    def __init__(
        self,
        resolver: ShelfLocationResolver,
    ) -> None:
        self._resolver = resolver

    def gen_command_text(self, command: kachaka_api_pb2.Command) -> str:
        if command.HasField("move_shelf_command"):
            shelf_name = self._resolver.get_shelf_name_by_id(
                command.move_shelf_command.target_shelf_id
            )
            location_name = self._resolver.get_location_name_by_id(
                command.move_shelf_command.destination_location_id
            )
            return f"{shelf_name}を{location_name}に移動"
        elif command.HasField("return_shelf_command"):
            if command.return_shelf_command.target_shelf_id != "":
                shelf_name = self._resolver.get_shelf_name_by_id(
                    command.return_shelf_command.target_shelf_id
                )
                return f"{shelf_name}を片付ける"
            return "家具を片付ける"
        elif command.HasField("move_to_location_command"):
            location_name = self._resolver.get_location_name_by_id(
                command.move_to_location_command.target_location_id
            )
            return f"{location_name}に移動"
        elif command.HasField("return_home_command"):
            return "充電ドックに戻る"
        return ""
