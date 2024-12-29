# ROS 2

* ros2_bridge
    * ros2のtopic, service, actionをカチャカとやり取りするサーバー


## 目次
- [ROS 2 Humbleのセットアップ](#ros-2-humbleのセットアップ)
- [Dockerのセットアップ](#dockerのセットアップ)
- [Dockerイメージのビルド](#dockerイメージのビルド)
- [サンプルコードのダウンロード](#サンプルコードのダウンロード)
- [kachaka\_interfaces, kachaka\_descriptionのビルド](#kachaka_interfaces-kachaka_descriptionのビルド)
- [動作確認](#動作確認)
- [サンプルコード](#サンプルコード)

## ROS 2 Humbleのセットアップ

* 以下を参考に、ROS 2 Humbleをセットアップして下さい。
    * https://docs.ros.org/en/humble/index.html

## Dockerのセットアップ

* 以下を参考に、Dockerの設定を行って下さい。
    * https://docs.docker.com/engine/install/ubuntu/

## Dockerイメージのビルド

* 初期設定では配布Dockerイメージを使って起動したDockerコンテナ上でros2_bridgeを動作させます。配布Dockerイメージを使う場合はこの手順はスキップしてください。
* Dockerイメージをカスタマイズしたい場合、以下の手順でビルドします。
    * 以下の実行例では`BASE_ARCH=x86_64`としていますが、ros2_bridgeをx86_64アーキテクチャのCPU上で実行させる場合の例です。
    * ros2_bridgeをarm64アーキテクチャのCPU上で実行させる場合は`BASE_ARCH=arm64`としてください。

```
docker buildx build -t kachaka-api --target kachaka-grpc-ros2-bridge -f Dockerfile.ros2 . --build-arg BASE_ARCH=x86_64 --load
```

* [tools/ros2_bridge/docker-compose.yaml](tools/ros2_bridge/docker-compose.yaml)に対して以下の変更を行います。
    * 変更前：`image: "asia-northeast1-docker.pkg.dev/kachaka-api/docker/kachaka-grpc-ros2-bridge:${TAG}"`
    * 変更後：`image: kachaka-api:latest`

## サンプルコードのダウンロード

```
cd ~
git clone https://github.com/pf-robotics/kachaka-api.git
```

## kachaka_interfaces, kachaka_descriptionのビルド 

* 以下の手順でビルドします。

```
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws/src
ln -s ~/kachaka-api/ros2/kachaka_interfaces/ kachaka_interfaces
ln -s ~/kachaka-api/ros2/kachaka_description/ kachaka_description

cd ~/ros2_ws
source /opt/ros/humble/setup.bash
colcon build
```

## 動作確認

* ros2_bridgeの起動
    * 別のターミナルで以下を実行してください。
    * 初回実行時に、Dockerイメージがダウンロードされます。
        * イメージの提供は予告なく停止される場合があります。

```
cd ~/kachaka-api/tools/ros2_bridge
./start_bridge.sh <カチャカのIPアドレス>
```

* ros2コマンドによる動作確認
    * 以下のコマンドを実行すると、topic一覧が表示されます

```
cd ~/ros2_ws
source install/setup.bash
ros2 topic list
```

* 目的地一覧を取得する例

```
cd ~/ros2_ws
source install/setup.bash
ros2 topic echo /kachaka/layout/locations/list
```

目的地一覧の例

```
locations:
- id: L01
  name: ダイニング
  type: 0
  pose:
    x: 1.33572
    y: 2.328592
    theta: 0.0
```


* rviz2による可視化

```
cd ~/ros2_ws
source install/setup.bash
cd src/kachaka_description/config
rviz2 -d kachaka.rviz
```

## サンプルコード

* サンプルコードは以下の場所にあります
    * [ros2/demos](ros2/demos)
* サンプルコードの実行方法
    * サンプルコードのREADME.mdの手順を実行してください

