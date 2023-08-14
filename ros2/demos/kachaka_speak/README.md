# speakサンプル

## ビルド方法

```
cd ~/
git clone https://github.com/pf-robotics/kachaka-api.git

mkidr -p ~/ros2_ws/src
cd ~/ros2_ws/src
ln -s ~/kachaka-api/ros2/kachaka_interfaces .
ln -s ~/kachaka-api/ros2/demos/kachaka_speak .

cd ~/ros2_ws
colcon build
```

## 実行方法

* ros2_bridgeを起動した状態で、以下のコマンドを実行します

```
cd ~/ros2_ws
source install/setup.bash
ros2 run kachaka_speak speak
```
