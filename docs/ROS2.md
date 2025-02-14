# ROS 2でカチャカAPIを利用する

* カチャカAPIをROS 2から利用するための手順を説明します。
* 公式で提供するのは、gRPCとROS 2のブリッジ機能と、URDFなどのdescriptionです。

## 目次
- [kachaka-api ROS 2 で提供するもの](#kachaka-api-ros-2-で提供するもの)
- [ROS 2 Humbleのセットアップ](#ros-2-humbleのセットアップ)
- [Dockerを使ったros2_bridgeの起動](#dockerを使ったros2_bridgeの起動)
  - [Dockerのインストール](#dockerのインストール)
  - [ブリッジの起動](#ブリッジの起動)
- [動作を確認する](#動作を確認する)
- [他のROS 2パッケージと連携する](#他のros-2パッケージと連携する)
  - [kachaka_interfaces, kachaka_descriptionのビルド](#kachaka_interfaces-kachaka_descriptionのビルド)
  - [RViz2による可視化](#rviz2による可視化)
- [サンプルコード](#サンプルコード)
- [Dockerイメージを自分でビルドする](#dockerイメージを自分でビルドする)

## kachaka-api ROS 2 で提供するもの
| パッケージ名 | 役割 |
| --- | --- |
| kachaka_grpc_ros2_bridge | カチャカAPIをROS 2から利用するためのブリッジ |
| kachaka_interfaces | kachaka_grpc_ros2_bridgeのためのI/F定義 |
| kachaka_description | カチャカのURDFモデル |

* ROS2 Humble環境向けに、これらのビルドが済んだDockerイメージを公開しています。このあとに続く説明では、このDockerイメージを利用してros2_bridgeを起動します。
* ご自身でビルドすることで、ROS 2 Humble以外のバージョンでも利用できます。

## ROS 2 Humbleのセットアップ
* 以下を参考に、ROS 2 Humbleをセットアップして下さい。
    * https://docs.ros.org/en/humble/index.html

## Dockerを使ったros2_bridgeの起動
### Dockerのインストール
* 以下を参考に、Dockerの設定を行って下さい。
    * https://docs.docker.com/engine/install/ubuntu/

### ブリッジの起動
* 以下のスクリプトを実行すると、ブリッジが実行されます。
* 初回実行時に、Dockerイメージがダウンロードされます。
    * ※ イメージの提供は予告なく停止される場合があります。

```bash
cd ~/kachaka-api/tools/ros2_bridge
./start_bridge.sh <カチャカのIPアドレス>
```

### 動作を確認する

* トピックからメッセージを取得できるかどうか確認してみましょう。
* ブリッジのコンテナが立っているので、これを使ってトピックの確認などを行うことができます。

* トピック一覧の取得
```bash
docker exec -it ros2_bridge_ros2_bridge_1 /opt/kachaka/env.sh ros2 topic list
```

* 目的地一覧の取得

```bash
docker exec -it ros2_bridge_ros2_bridge_1 /opt/kachaka/env.sh ros2 topic echo /kachaka/layout/locations/list
```

* 以下のようなレスポンスが返ってきたら成功です。

```yaml
locations:
- id: L01
  name: ダイニング
  type: 0
  pose:
    x: 1.33572
    y: 2.328592
    theta: 0.0
```


## 他のROS 2パッケージと連携する

### kachaka_interfaces, kachaka_descriptionのビルド 

* ブリッジが提供するトピックはカチャカ独自のインターフェースで提供されているため、これらのビルドが必要です。
    * kachaka_descriptionはお好みでビルドしてください。
* 以下の手順でビルドします。

```bash
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws/src
ln -s ~/kachaka-api/ros2/kachaka_interfaces/ kachaka_interfaces
ln -s ~/kachaka-api/ros2/kachaka_description/ kachaka_description

cd ~/ros2_ws
source /opt/ros/humble/setup.bash
colcon build
```

### RViz2による可視化
* RViz2でブリッジから得られる情報を可視化してみましょう。
* kachaka_descriptionにサンプルのconfigがあるので、まずはこれを使います。

```bash
cd ~/ros2_ws
source install/setup.bash
cd src/kachaka_description/config
rviz2 -d kachaka.rviz
```

## サンプルコード

* サンプルコードは以下の場所にあります
    * [ros2/demos](../ros2/demos)
* サンプルコードの実行方法
    * サンプルコードのREADME.mdの手順を実行してください


## Dockerイメージを自分でビルドする
* 初期設定では配布Dockerイメージを使って起動したDockerコンテナ上でros2_bridgeを動作させます。配布Dockerイメージを使う場合はこの手順はスキップしてください。
* Dockerイメージをカスタマイズしたい場合、以下の手順でビルドします。
    * 以下の実行例では`BASE_ARCH=x86_64`としていますが、ros2_bridgeをx86_64アーキテクチャのCPU上で実行させる場合の例です。
    * ros2_bridgeをarm64アーキテクチャのCPU上で実行させる場合は`BASE_ARCH=arm64`としてください。

```bash
docker buildx build -t kachaka-api --target kachaka-grpc-ros2-bridge -f Dockerfile.ros2 . --build-arg BASE_ARCH=x86_64 --load
```

* [tools/ros2_bridge/docker-compose.yaml](../tools/ros2_bridge/docker-compose.yaml)に対して以下の変更を行います。
    * 変更前：`image: "asia-northeast1-docker.pkg.dev/kachaka-api/docker/kachaka-grpc-ros2-bridge:${TAG}"`
    * 変更後：`image: kachaka-api:latest`
