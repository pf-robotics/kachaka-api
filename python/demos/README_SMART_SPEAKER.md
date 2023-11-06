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
  * 「activate scene」を押します
     * 「シェルフを持ってきて」など、サービスを呼び出す時にGoogle Homeに呼びかける言葉を設定します
  * 「Create Trigger」を押します
* 「Then That」を押して、以下の設定にします
  * Choose a serviceからWebhooksを選択します
  * 「Make a web request」を押して、以下のように設定します
    * URL: https://api.beebotte.com/v1/data/publish/test/sample?token=<Beebottteのトークン文字列>
    * Method: POST
    * Content Type: application/json
    * Body: {"data": {}}
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

## 準備

```
git clone https://github.com/pf-robotics/kachaka-api.git # 本リポジトリ
python3 -m venv venv
source venv/bin/activate
cd kachaka-api/python/demos
pip install -r requirements.txt

python -m grpc_tools.protoc -I../../protos --python_out=. --pyi_out=. --grpc_python_out=. ../../protos/kachaka-api.proto

wget https://beebotte.com/certs/mqtt.beebotte.com.pem
```

## 実行

```
export TOKEN=<Beebotteのトークン文字列>
python smart_speaker.py <カチャカのIDアドレス>:26400
```

Google Homeに対して、「OKグーグル、シェルフを持ってきて」と発話すると、カチャカがシェルフを運びます。

