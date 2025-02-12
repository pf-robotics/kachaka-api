#!/usr/bin/env python3
from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument
from launch.substitutions import (
    Command,
    EnvironmentVariable,
    FindExecutable,
    LaunchConfiguration,
    PathJoinSubstitution,
)
from launch_ros.actions import Node
from launch_ros.substitutions import FindPackageShare


def generate_launch_description():
    namespace_arg = DeclareLaunchArgument(
        "namespace",
        default_value="kachaka",
        description="Namespace for the robot state publisher",
    )

    frame_prefix_arg = DeclareLaunchArgument(
        "frame_prefix",
        default_value=EnvironmentVariable("FRAME_PREFIX"),
        description="Frame prefix for the robot state publisher",
    )

    namespace = LaunchConfiguration("namespace")
    frame_prefix = LaunchConfiguration("frame_prefix")

    robot_description_content = Command(
        [
            PathJoinSubstitution([FindExecutable(name="xacro")]),
            " ",
            PathJoinSubstitution(
                [
                    FindPackageShare("kachaka_description"),
                    "robot",
                    "kachaka.urdf.xacro",
                ]
            ),
        ]
    )

    robot_state_publisher_node = Node(
        package="robot_state_publisher",
        executable="robot_state_publisher",
        name="robot_state_publisher",
        namespace=namespace,
        output="screen",
        parameters=[
            {
                "robot_description": robot_description_content,
                "frame_prefix": frame_prefix,
            }
        ],
    )

    return LaunchDescription(
        [namespace_arg, frame_prefix_arg, robot_state_publisher_node]
    )
