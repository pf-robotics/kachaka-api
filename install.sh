#! /bin/bash

echo "╔══╣ Install: Kachaka-API (STARTING) ╠══╗"


# Install python dependencies for kachaka-api
python3 -m pip install \
    --extra-index-url https://pf-robotics.github.io/kachaka-python-packages/simple kachaka-api

# Download ROS packages
sudo apt-get update
sudo apt-get install -y \
   ros-$ROS_DISTRO-navigation2 \
   ros-$ROS_DISTRO-nav2-common \
   ros-$ROS_DISTRO-joint-state-publisher \
   ros-$ROS_DISTRO-joint-state-publisher-gui \
   ros-$ROS_DISTRO-robot-state-publisher \
   ros-$ROS_DISTRO-urdf \
   ros-$ROS_DISTRO-xacro \
   ros-$ROS_DISTRO-std-msgs \
   ros-$ROS_DISTRO-sensor-msgs \
   ros-$ROS_DISTRO-geometry-msgs \
   ros-$ROS_DISTRO-common-interfaces \
   ros-$ROS_DISTRO-cv-bridge


echo "╚══╣ Install: Kachaka-API (FINISHED) ╠══╝"
