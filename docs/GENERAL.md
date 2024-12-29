- [カチャカAPIとは](#カチャカapiとは)
- [前提条件](#前提条件)
- [カチャカAPI仕様](#カチャカapi仕様)
- [利用開始の手順](#利用開始の手順)


## カチャカAPIとは

* カチャカはgRPCに準拠したAPIを備えており、ローカルネットワーク内、およびカチャカ本体のPlayground内から利用することが出来ます。
* サンプルとして提供されるカチャカAPIライブラリを使用する事により、gRPCを意識せずに簡単に使うことも可能です。
* また、ros2_bridgeを使用することにより、ROS 2からgRPCで提供されるサービスの一部を実行することが出来ます。

![kachaka-api](docs/images/kachka-api.png)


## 対応環境・言語

* カチャカ本体内で動作するJupyterLabを利用することで、OSを問わずWebブラウザのみ用意すれば開発を行うことができます。
  * 対応ブラウザについては、[JupyterLab公式ドキュメント](https://jupyterlab.readthedocs.io/en/stable/getting_started/installation.html#supported-browsers)をご確認ください。
* カチャカ外部のPCからAPIを利用することも可能で、本ドキュメントの内容は以下の環境にて確認していますが、多くはmacOSやWindowsなど他の環境でも可能です。
    * 動作確認済みのOS
        * Ubuntu 22.04 LTS
    * 開発言語
        * Python3.10
    * ROS 2（使用する場合）
        * ROS 2 Humble


## カチャカAPI仕様

* APIの詳細
    * [protos/kachaka-api.proto](protos/kachaka-api.proto)を参照してください。
* エラーコード
    * [docs/KachakaErrorCode.json](docs/KachakaErrorCode.json)
* カチャカを移動させるコマンドは、アプリの安全設定などに従い、障害物を検出して止まる事があります。
* ソフトウェアアップデート中はAPIを実行しないでください。


## 利用開始の手順

* スマートフォンアプリを以下の手順に従って操作し、カチャカAPIを有効にしてください。
    * 設定タブ → ロボットを選択 → 「カチャカAPI 」→ 「カチャカAPIを有効化する」をONにします。

![enable-api](docs/images/enable-api.png)

* 以下のダイアログが表示されるので、「利用規約」を確認の上、「カチャカAPI利用規約に同意する」をチェックして「設定する」を押して下さい。

![api-enable-dialog](docs/images/api-enable-dialog.png)

## サンプルコードをJupyterLabで実行する

* JupyterLabを使用してサンプルコードを実行する方法を説明します。


### 準備

* IPアドレスを確認します。
    * スマートフォンアプリの「設定」→「アプリ情報」→「IPアドレス」にカチャカのIPアドレスが記載されています。
* PCのブラウザを起動します。
* ブラウザで以下のURLにアクセスします。
    * http://&lt;カチャカのIPアドレス>:26501/
        * &lt;カチャカのIPアドレス>には、アプリで確認したIPアドレスが入ります。
* ログイン画面が表示されるので、以下のパスワードを入力してください。
    * パスワード：kachaka

![jupyter-login](docs/images/jupyter-login.png)

### パスワードの変更方法

* パスワードを変更する場合は、まずLauncherから「Terminal」を選択します。

![jupyter-terminal](docs/images/jupyter-terminal.png)

* Terminalで、以下のコマンドを入力します。

```
jupyter lab password
Enter password: <新しいパスワード>
Verify password: <新しいパスワード>
```

* カチャカ本体を再起動すると、新しいパスワードが反映されます。

### サンプルコードのダウンロード

* 左側のファイル一覧から README.ipynb をダブルクリックしてください。
* 上部メニューの「▶▶」をクリックしてください。

![jupyter-readme](docs/images/jupyter-readme.png)

* 以下のダイアログが表示された場合は「Restart」ボタンを押してください。

![jupyter-restart-dialog](docs/images/jupyter-restart-dialog.png)

* サンプルコードのダウンロードが完了すると、以下のようなメッセージが表示され、左側のファイル一覧に kachaka-apiフォルダが作成されます。

![jupyter-clone-sample](docs/images/jupyter-clone-sample.png)

### 依存ライブラリのインストール

ダウンロード後初回の一回だけ、下記の手順を実行する必要があります。

* 左側のファイル一覧からkachaka-api → python → demosフォルダを選択します。
* install_libraries.ipynbをダブルクリックすると、右側にソースコードが表示されます。
* 上部メニューの「▶▶」ボタンを押して実行します。

### サンプルコードの実行方法

* 左側のファイル一覧からkachaka-api → python → demosフォルダを選択します。
* speak.ipynbをダブルクリックすると、右側にソースコードが表示されます。
* 上部メニューの「▶▶」ボタンを押して実行します。

![jupyter-sample-speak](docs/images/jupyter-sample-speak.png)

実行結果

「カチャカです、よろしくね」とカチャカが発話します。

