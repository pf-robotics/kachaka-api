# Follow Example

# Overview

* This is an example that uses LIDAR to move towards the nearest object. It includes instructions on how to use `cmd_vel` and `LaserScan`.

# Building

*Copy the necessary folders to workspace and build the project.

```
mkidr -p ~/ros2_ws/src
cd ~/ros2_ws/src
cp -r ~/kachaka-api/ros2/kachaka_interfaces .
cp -r ~/kachaka-api/ros2/demos/kachaka_follow .

cd ~/ros2_ws
colcon build
```

# Execution

* Open another terminal and start the ROS2 bridge.

```
cd ~/kachaka-api/ros2_bridge
./start_bridge.sh <Kachaka's IP>

```

* Next, run the following command.

```
cd ~/ros2_ws
source install/setup.bash
ros2 run kachaka_follow follow
```

