cmake_minimum_required(VERSION 3.8)
project(kachaka_vision)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(cv_bridge REQUIRED)
find_package(rclcpp REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(OpenCV REQUIRED)

add_executable(hand_recognition_node src/hand_recognition_node.cpp)
ament_target_dependencies(
  hand_recognition_node
  cv_bridge
  OpenCV
  rclcpp
  sensor_msgs)

install(TARGETS hand_recognition_node DESTINATION lib/${PROJECT_NAME})

ament_package()

install(DIRECTORY launch config DESTINATION share/${PROJECT_NAME}/)
