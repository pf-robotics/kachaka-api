from math import atan2, cos, pi, sin
from typing import Tuple

import numpy as np

from .generated.kachaka_api_pb2 import Map, Pose, Quaternion


def calculate_yaw_from_quaternion(q: Quaternion) -> float:
    # カチャカの姿勢はz軸周りの回転のみ含むため、他の軸は無視して算出する
    yaw = atan2(q.z, q.w) * 2
    if abs(yaw) > pi:
        yaw -= np.sign(yaw) * 2 * pi
    return yaw


def _transform_matrix(tx: float, ty: float, theta: float = 0) -> np.ndarray:
    c, s = cos(theta), sin(theta)
    return np.array(((c, -s, tx), (s, c, ty), (0, 0, 1)))


def _scale_matrix(sx: float, sy: float) -> np.ndarray:
    return np.array(((sx, 0, 0), (0, sy, 0), (0, 0, 1)))


class MapImage2DGeometry:
    def __init__(self, png_map: Map) -> None:
        resolution = png_map.resolution
        origin = png_map.origin
        self._map_to_image_origin = (
            _transform_matrix(origin.x, origin.y, origin.theta)
            @ _scale_matrix(resolution, -resolution)
            @ _transform_matrix(0.5, -png_map.height + 0.5)
        )
        self._image_origin_to_map = np.linalg.inv(self._map_to_image_origin)

    def calculate_robot_pose_matrix_in_pixel(
        self, robot_pose: Pose
    ) -> np.ndarray:
        """ロボットの姿勢から画像上の姿勢を表す行列に変換する

        :param robot_pose: ロボット姿勢 [m, m, rad]
        :returns 3x3 行列
        """
        return self._image_origin_to_map @ _transform_matrix(
            robot_pose.x, robot_pose.y, robot_pose.theta
        )

    def calculate_robot_pose_matrix_from_pixel(
        self, pixel_xy: Tuple[float, float], angle: float = 0
    ) -> np.ndarray:
        """画像上の姿勢からロボットの姿勢を表す行列に変換する

        :param pixel_xy: 画像原点からの位置 [px, px]
        :param angle: 半時計周りを正とする角度 [radian]
        :returns 3x3 行列
        """
        return self._map_to_image_origin @ _transform_matrix(*pixel_xy, angle)
