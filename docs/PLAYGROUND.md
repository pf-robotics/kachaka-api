# Playground

* カチャカ本体の資源の一部（Playground）を開発者が使用する事が出来ます。
* 以下にログイン方法や、便利な使い方の説明をします。
* カチャカ本体内で動くコンテナ環境。ユーザが自由にログインして自作のソフトウェアを実行できる。


## 目次
- [IPアドレスとポート番号](#ipアドレスとポート番号)
- [Playgroundにsshでログインする](#playgroundにsshでログインする)
- [Playgroundでサンプルプログラムを実行する](#playgroundでサンプルプログラムを実行する)
- [自作ソフトの自動起動](#自作ソフトの自動起動)
- [サンプルを自動起動する例](#サンプルを自動起動する例)
- [Playgroundのリソース制限](#playgroundのリソース制限)

## IPアドレスとポート番号

* IPアドレス
    * カチャカのIPアドレス
        * スマートフォンアプリの「設定」→「アプリ情報」→「IPアドレス」に表示されます
    * Playground内部からgRPCを利用する場合のIPアドレス
        * 100.94.1.1
* ポート番号

<table>
  <tr>
   <td>ポート番号
   </td>
   <td>用途
   </td>
  </tr>
  <tr>
   <td>26400
   </td>
   <td>gRPC
   </td>
  </tr>
  <tr>
   <td>26500
   </td>
   <td>ssh
   </td>
  </tr>
  <tr>
   <td>26501
   </td>
   <td>JupyterLab
   </td>
  </tr>
  <tr>
   <td>26502~26509
   </td>
   <td>割り当てなし（自由利用可能）
   </td>
  </tr>
</table>

> **Note**
> IPアドレスが変わってしまい不便な場合は、ルータ等でカチャカのMACアドレスに対して固定IPアドレスを付与すると便利です。




## Playgroundにsshでログインする

* jupyterlabのterminalもしくは下記のnotebookいずれかを用いて公開鍵の設定を行います
    * utils/set_authorized_keys.ipynb
    * utils/set_authorized_keys_from_github.ipynb
        * githubに登録している鍵をカチャカでも利用したい場合、こちらのスクリプトが便利です
* utils/set_authorized_keys.ipynbを使用した設定方法
    * 画面左上のFile Browserを選択します。
    * 画面左のファイル一覧からutils → set_authorized_keys.ipynbをダブルクリックします。
    * 画面中央のpublic_keysに公開鍵のテキストを貼り付けます。
    * 上部メニューの「▶▶」ボタンを押します。

![set-authorized-keys](docs/images/set_authorized_kyes.png)

* utils/set_authorized_keys_from_github.ipynbを使用した設定方法
    * 画面左上のFile Browserを選択します。
    * 画面左のファイル一覧からutils → set_authorized_keys_from_github.ipynbをダブルクリックします。
    * 画面中央のuserにgithubのユーザ名を入力します。
    * 上部メニューの「▶▶」ボタンを押します

![set-authorized-keys-from-github](docs/images/set_authorized_keys_from_github.png)

以下のコマンドを実行してPlaygroundにログインします

```
ssh -p 26500 -i <登録した公開鍵に対応する秘密鍵> kachaka@<kachakaのIPアドレス>
```

## Playgroundでサンプルプログラムを実行する

* カチャカにsshでログインします。
* 以下のコマンドを実行すると、カチャカが時報を1分間隔で発話します。

```
cd ~
git clone https://github.com/pf-robotics/kachaka-api.git
pip install -r /home/kachaka/kachaka-api/python/demos/requirements.txt
python3 /home/kachaka/kachaka-api/python/demos/time_signal.py 100.94.1.1:26400
```

## 自作ソフトの自動起動

* /home/kachaka/kachaka_startup.sh に自動起動したい処理を記述してください。
* カチャカ起動時に自動的に実行されます
* ログが /tmp/kachaka_startup.log に記録されます
    * python3 を自動起動する際は `-u` オプションを付けると良いです。そうでないと標準出力がバッファリングされてしまい、ログが確認できないことがあります。

## サンプルを自動起動する例

* /home/kachaka/kachaka_startup.sh を以下のように編集します。
```
#!/bin/bash

jupyter-lab --port=26501 --ip='0.0.0.0' &

# 以下の行を追加します
python3 -u /home/kachaka/kachaka-api/python/demos/time_signal.py 100.94.1.1:26400 &
```

* 保存後、カチャカを再起動します。再起動後、暫くすると、1分間隔で現在時刻を発話します。


## Playgroundのリソース制限

* ストレージ総計(/home, tmp) 3GB
* メモリー 512MB
