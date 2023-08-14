# スマートスピーカー連携サンプル

## はじめに
* このサンプルは、カチャカ、Google Home、IFTTT、Beebotteのサービス連携を行います。
* Google Nest Miniなどのデバイス、およびIFTTT、Beebotteサービスへの登録が必要になります。

## Beebotteの設定

* Beebotteのサイトにログインします: https://beebotte.com/
* 新しいチャンネル/リソースを作ります
  * 左メニューのChannelsを選択
    * My Channels右の「Create New」ボタンを押します
    * Channel Name: test
    * Resource name: sample
    * 「Create Channel」ボタンを押します
* 以下の場所にあるトークンを保存しておきます
  * 左メニューのChannelsを選択
  * My Channelsからtestを選択
  * Channel Token: token_xxxxxxx

## IFTTTの設定

* IFTTTのサイトにログインします: https://ifttt.com/
* 「create」ボタンを押します
* 「If This」を押して、以下の設定にします
  * Choose a serviceからGoogle Assistant V2を選択します
  * 「activate sentence」を押します
     * 「シェルフを持ってきて」など、サービスを呼び出す時にGoogle Homeに呼びかける言葉を設定します
  * 「Create Trigger」を押します
* 「Then That」を押して、以下の設定にします
  * Choose a serviceからWebhooksを選択します
  * 「Make a web request」を押して、以下のように設定します
    * URL: https://api.beebotte.com/v1/data/publish/test/sample?token=<Beebottteのトークン文字列>
    * Method: POST
    * Content Type: application/json
  * 「Create action」を押します

## Google Homeの設定

* 以下を参考に設定します
  * https://support.google.com/googlenest/answer/7194656?hl=en&co=GENIE.Platform%3DAndroid
* TIPS
  * 標準的なIFTTTの使用法の場合「OKグーグル、シェルフを持ってきてを有効にして」のように発話しないと実行できません。
  * Google Assistantアプリのルーティン設定で「OKグーグル、シェルフを持ってきて」の発話で実行できるように変更出来ます。
    * 「オートメーション」を選択
    * 「＋」で新しいルーティンを追加します
    * 「開始条件を追加」→「Googleアシスタントに話しかけたとき」→「シェルフを持ってきて」を設定し、「条件を追加」を押します
    * 「アクションを追加」→「カスタムアクションの追加」→「シェルフを持ってきてを有効にして」を設定し、「完了」を押します

## ビルド

```
cd ~
git clone https://github.com/pf-robotics/kachaka-api.git
pip install paho-mqtt

mkdir -p ~/ros2_ws/src
cd ~/ros2_ws/src

ln -s ~/kachaka-api/ros2/kachaka_interfaces/ kachaka_interfaces
ln -s ~/kachaka-api/ros2/demos/kachaka_smart_speaker/ kachaka_smart_speaker

cd ~/ros2_ws
colcon build
```

## 実行


* ros2_bridgeを起動した上で、以下のコマンドを実行します
```
cd ~/ros2_ws
source install/setup.bash

export TOKEN=<BeeBotteのトークン>
wget https://beebotte.com/certs/mqtt.beebotte.com.pem

ros2 run kachaka_smart_speaker smart_speaker
```
