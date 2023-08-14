cmake_minimum_required(VERSION 3.5)

project(kachaka_interfaces)

if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(ament_cmake_auto REQUIRED)
ament_auto_find_build_dependencies()

rosidl_generate_interfaces(
  ${PROJECT_NAME}
  "action/ExecKachakaCommand.action"
  "msg/KachakaCommand.msg"
  "msg/Location.msg"
  "msg/LocationList.msg"
  "msg/ObjectDetection.msg"
  "msg/ObjectDetectionListStamped.msg"
  "msg/Shelf.msg"
  "msg/ShelfList.msg"
  "msg/ShelfSize.msg"
  DEPENDENCIES
  geometry_msgs
  sensor_msgs
  std_msgs)

ament_auto_generate_code()

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  ament_lint_auto_find_test_dependencies()
endif()

ament_auto_package()
