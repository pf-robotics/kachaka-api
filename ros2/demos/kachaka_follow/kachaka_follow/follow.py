import math

import angles
import rclpy
from geometry_msgs.msg import Twist
from kachaka_interfaces.msg import ObjectDetection, ObjectDetectionListStamped
from rclpy.node import Node
from sensor_msgs.msg import LaserScan

MAX_RANGE_FOR_FOLLOW = 1.0
ANGULAR_TOLERANCE = 0.8


class Follower(Node):
    def __init__(self) -> None:
        super().__init__("follow")
        self._publisher = self.create_publisher(
            Twist, "/kachaka/manual_control/cmd_vel", 10
        )
        self._lidar_subscriber = self.create_subscription(
            LaserScan, "/kachaka/lidar/scan", self._laser_scan_callback, 10
        )
        self._object_detection_subscriber = self.create_subscription(
            ObjectDetectionListStamped,
            "/kachaka/object_detection/result",
            self._object_detection_callback,
            10,
        )
        self._timer = self.create_timer(0.1, self._publish_cmd_vel)
        self._cmd_vel = Twist()
        self._closest_distance = float("inf")
        self._closest_angle = 0.0
        self._person_in_detection = False

    def _publish_cmd_vel(self) -> None:
        if not self._person_in_detection:
            self.get_logger().info("no person")
            self._cmd_vel.linear.x = 0.0
            self._cmd_vel.angular.z = 0.0
            self._publisher.publish(self._cmd_vel)
            return
        self.get_logger().info("publish")
        self.get_logger().info(f"{self._closest_angle=}")
        self._cmd_vel.linear.x = 0.0
        self._cmd_vel.angular.z = 0.0
        if 0.3 < self._closest_angle < ANGULAR_TOLERANCE:
            self.get_logger().info("turn ringht")
            self._cmd_vel.angular.z = 1.0
        elif -0.3 > self._closest_angle > -ANGULAR_TOLERANCE:
            self.get_logger().info("turn left")
            self._cmd_vel.angular.z = -1.0
        else:
            if self._closest_distance < MAX_RANGE_FOR_FOLLOW:
                self.get_logger().info("go foward")
            self._cmd_vel.linear.x = 0.3
        self._publisher.publish(self._cmd_vel)

    def _laser_scan_callback(self, msg: LaserScan) -> None:
        ranges = msg.ranges
        valid_ranges = [r for r in ranges if r > 0]
        if valid_ranges:
            min_range = min(valid_ranges)
            min_index = ranges.index(min_range)
            angle_increment = msg.angle_increment
            self._closest_distance = min_range
            self._closest_angle = angles.normalize_angle(
                msg.angle_min + (min_index * angle_increment) + (math.pi / 2)
            )

    def _object_detection_callback(
        self, detections: ObjectDetectionListStamped
    ) -> None:
        self._person_in_detection = any(
            obj.label == ObjectDetection.PERSON for obj in detections.detection
        )
        self.get_logger().info(f"{self._person_in_detection=}")


def main(args=None):
    rclpy.init(args=args)
    follower = Follower()
    rclpy.spin(follower)
    follower.destroy_node()
    rclpy.shutdown()


if __name__ == "__main__":
    main()
