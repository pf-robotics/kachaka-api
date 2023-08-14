from launch import LaunchDescription
from launch.substitutions import PathJoinSubstitution
from launch_ros.actions import Node
from launch_ros.substitutions import FindPackageShare


def generate_launch_description():
    model_path = PathJoinSubstitution(
        [
            FindPackageShare("kachaka_vision"),
            "config",
            "pose_iter_102000.caffemodel",
        ]
    )
    model_config_path = PathJoinSubstitution(
        [FindPackageShare("kachaka_vision"), "config", "pose_deploy.prototxt"]
    )
    return LaunchDescription(
        [
            Node(
                package="kachaka_vision",
                executable="hand_recognition_node",
                name="hand_recognition_node",
                namespace="hand_recognition_node",
                remappings=[
                    ("image", "/kachaka/front_camera/image_raw/compressed")
                ],
                parameters=[
                    {
                        "model_path": model_path,
                        "model_config_path": model_config_path,
                        "confidence_threshold": 0.1,
                    }
                ],
            )
        ]
    )
