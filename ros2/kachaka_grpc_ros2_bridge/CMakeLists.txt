cmake_minimum_required(VERSION 3.5)

project(kachaka_grpc_ros2_bridge)

# workaround for conditional include for each ROS distribution
if($ENV{ROS_DISTRO} STREQUAL "jazzy")
  add_compile_definitions(ROS_DISTRO_JAZZY)
endif()

if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(ament_cmake_auto REQUIRED)
find_package(OpenCV REQUIRED)
ament_auto_find_build_dependencies()

find_package(PkgConfig REQUIRED)
pkg_check_modules(
  GRPC
  REQUIRED
  grpc++
  protobuf)

include_directories(gen-src ${GRPC_INCLUDE_DIRS} ${OpenCV_INCLUDE_DIRS})

ament_auto_add_library(
  ${PROJECT_NAME}
  SHARED
  gen-src/kachaka-api.grpc.pb.cc
  gen-src/kachaka-api.pb.cc
  src/component/auto_homing_component.cpp
  src/component/back_camera_component.cpp
  src/component/diagnostics_component.cpp
  src/component/dynamic_tf_component.cpp
  src/component/front_camera_component.cpp
  src/component/goal_pose_component.cpp
  src/component/imu_component.cpp
  src/component/kachaka_command_component.cpp
  src/component/layout_component.cpp
  src/component/lidar_component.cpp
  src/component/manual_control_component.cpp
  src/component/mapping_component.cpp
  src/component/object_detection_component.cpp
  src/component/odometry_component.cpp
  src/component/wheel_odometry_component.cpp
  src/component/robot_info_component.cpp
  src/component/static_tf_component.cpp
  src/component/tof_camera_component.cpp
  src/component/torch_component.cpp
  src/converter/kachaka_command.cpp
  src/converter/ros_header.cpp
  src/dynamic_tf_bridge.cpp
  src/stub_util.cpp)

target_link_libraries(${PROJECT_NAME} ${GRPC_LIBRARIES} ${OpenCV_LIBS})

rclcpp_components_register_node(
  ${PROJECT_NAME}
  PLUGIN
  "kachaka::grpc_ros2_bridge::AutoHomingComponent"
  EXECUTABLE
  auto_homing)

rclcpp_components_register_node(
  ${PROJECT_NAME}
  PLUGIN
  "kachaka::grpc_ros2_bridge::BackCameraComponent"
  EXECUTABLE
  back_camera)

rclcpp_components_register_node(
  ${PROJECT_NAME}
  PLUGIN
  "kachaka::grpc_ros2_bridge::DiagnosticsComponent"
  EXECUTABLE
  diagnostics)

rclcpp_components_register_node(
  ${PROJECT_NAME}
  PLUGIN
  "kachaka::grpc_ros2_bridge::KachakaCommandComponent"
  EXECUTABLE
  kachaka_command)

rclcpp_components_register_node(
  ${PROJECT_NAME}
  PLUGIN
  "kachaka::grpc_ros2_bridge::FrontCameraComponent"
  EXECUTABLE
  front_camera)

rclcpp_components_register_node(
  ${PROJECT_NAME}
  PLUGIN
  "kachaka::grpc_ros2_bridge::GoalPoseComponent"
  EXECUTABLE
  goal_pose)

rclcpp_components_register_node(
  ${PROJECT_NAME}
  PLUGIN
  "kachaka::grpc_ros2_bridge::ImuComponent"
  EXECUTABLE
  imu)

rclcpp_components_register_node(
  ${PROJECT_NAME}
  PLUGIN
  "kachaka::grpc_ros2_bridge::LayoutComponent"
  EXECUTABLE
  layout)

rclcpp_components_register_node(
  ${PROJECT_NAME}
  PLUGIN
  "kachaka::grpc_ros2_bridge::LidarComponent"
  EXECUTABLE
  lidar)

rclcpp_components_register_node(
  ${PROJECT_NAME}
  PLUGIN
  "kachaka::grpc_ros2_bridge::ManualControlComponent"
  EXECUTABLE
  manual_control)

rclcpp_components_register_node(
  ${PROJECT_NAME}
  PLUGIN
  "kachaka::grpc_ros2_bridge::MappingComponent"
  EXECUTABLE
  mapping)

rclcpp_components_register_node(
  ${PROJECT_NAME}
  PLUGIN
  "kachaka::grpc_ros2_bridge::RobotInfoComponent"
  EXECUTABLE
  robot_info)

rclcpp_components_register_node(
  ${PROJECT_NAME}
  PLUGIN
  "kachaka::grpc_ros2_bridge::ObjectDetectionComponent"
  EXECUTABLE
  object_detection)

rclcpp_components_register_node(
  ${PROJECT_NAME}
  PLUGIN
  "kachaka::grpc_ros2_bridge::OdometryComponent"
  EXECUTABLE
  odometry)

rclcpp_components_register_node(
  ${PROJECT_NAME}
  PLUGIN
  "kachaka::grpc_ros2_bridge::WheelOdometryComponent"
  EXECUTABLE
  wheel_odometry)

rclcpp_components_register_node(
  ${PROJECT_NAME}
  PLUGIN
  "kachaka::grpc_ros2_bridge::TofCameraComponent"
  EXECUTABLE
  tof_camera)

rclcpp_components_register_node(
  ${PROJECT_NAME}
  PLUGIN
  "kachaka::grpc_ros2_bridge::TorchComponent"
  EXECUTABLE
  torch)

rclcpp_components_register_node(
  ${PROJECT_NAME}
  PLUGIN
  "kachaka::grpc_ros2_bridge::StaticTfComponent"
  EXECUTABLE
  static_tf)

rclcpp_components_register_node(
  ${PROJECT_NAME}
  PLUGIN
  "kachaka::grpc_ros2_bridge::DynamicTfComponent"
  EXECUTABLE
  dynamic_tf)

install(DIRECTORY launch DESTINATION share/${PROJECT_NAME})

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  ament_lint_auto_find_test_dependencies()
endif()

ament_auto_package()
