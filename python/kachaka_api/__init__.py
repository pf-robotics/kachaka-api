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

from . import aio  # noqa: F401
from .base import KachakaApiClientBase
from .generated import kachaka_api_pb2 as pb2  # noqa: F401
from .util import command as command_util  # noqa: F401
from .util import geometry as geometry_util  # noqa: F401
from .util import layout as layout_util  # noqa: F401


class KachakaApiClient(KachakaApiClientBase):
    def __init__(self, target="100.94.1.1:26400") -> None:
        super().__init__(target)
