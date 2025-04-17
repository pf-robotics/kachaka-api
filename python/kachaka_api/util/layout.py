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

from typing import Tuple

from ..generated import kachaka_api_pb2 as pb2


class ShelfLocationResolver:
    def __init__(
        self, shelves: list[pb2.Shelf] = [], locations: list[pb2.Location] = []
    ) -> None:
        self.shelves = shelves
        self.locations = locations

    def set_shelves(self, shelves: list[pb2.Shelf]) -> None:
        self.shelves = shelves

    def set_locations(self, locations: list[pb2.Location]) -> None:
        self.locations = locations

    def get_shelf_list(self) -> list[Tuple[str, str]]:
        return [(shelf.id, shelf.name) for shelf in self.shelves]

    def get_location_list(self) -> list[Tuple[str, str]]:
        return [(location.id, location.name) for location in self.locations]

    def get_shelf_name_by_id(self, shelf_id: str) -> str:
        for shelf in self.shelves:
            if shelf.id == shelf_id:
                return shelf.name
        print(f"Failed to get shelf name of {shelf_id}")
        return shelf_id

    def get_location_name_by_id(self, location_id: str) -> str:
        for location in self.locations:
            if location.id == location_id:
                return location.name
        print(f"Failed to get location name of {location_id}")
        return location_id

    def get_shelf_id_by_name(self, shelf_name: str) -> str:
        for shelf in self.shelves:
            if shelf.name == shelf_name:
                return shelf.id
        print(f"Failed to get shelf id of {shelf_name}")
        return shelf_name

    def get_location_id_by_name(self, location_name: str) -> str:
        for location in self.locations:
            if location.name == location_name:
                return location.id
        print(f"Failed to get location id of {location_name}")
        return location_name

    def resolve_location_id_or_name(
        self, location_id_or_name: str
    ) -> str | None:
        if location_id_or_name in self.locations:
            return location_id_or_name
        else:
            location_id = self.get_location_id_by_name(location_id_or_name)
            if location_id == location_id_or_name:
                return None
            else:
                return location_id

    def resolve_shelf_id_or_name(self, shelf_id_or_name: str) -> str | None:
        if shelf_id_or_name in self.shelves:
            return shelf_id_or_name
        else:
            shelf_id = self.get_shelf_id_by_name(shelf_id_or_name)
            if shelf_id == shelf_id_or_name:
                return None
            else:
                return shelf_id
