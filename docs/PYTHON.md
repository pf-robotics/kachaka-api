# カチャカAPIライブラリ

* カチャカAPIライブラリは、gRPCを意識せずにPythonで開発を行うことができるライブラリです。
* 同期、非同期それぞれのライブラリがあります。

## 目次
- [インストール方法](#インストール方法)
- [使用方法](#使用方法)
- [カチャカAPIライブラリのサンプルコード](#カチャカapiライブラリのサンプルコード)


## インストール方法

以下のコマンドでインストールできます：

```bash
pip install --extra-index-url https://pf-robotics.github.io/kachaka-python-packages/simple kachaka-api
```

## uv
uvの場合は、pyproject.tomlに以下を追加してインストールすることができます。

```toml
[[tool.uv.index]]
url = "https://pf-robotics.github.io/kachaka-python-packages/simple"
```

```
uv add kachaka-api
```


## 使用方法

[docs/kachaka_api_client.ipynb](docs/kachaka_api_client.ipynb) で各APIを動作させながら試すことができます。

## カチャカAPIライブラリのサンプルコード

* [sample_llm_speak.py](python/demos/sample_llm_speak.py) ... ChatGPT を使って、コマンド終了時にお喋りをするサンプル
* その他、[python/demos/](python/demos) 以下に、JupyterLab で利用できる Notebook 形式が多数あります

## 非同期ライブラリ

gRPCの呼び出しを非同期にしたライブラリも提供しています。必要に応じてご利用ください。  
同期ライブラリの機能に加えてcallback登録をサポートしています。  
callback機能については[sample_llm_speak.py](python/demos/sample_llm_speak.py)をご参照ください。  
使用方法を非同期版に書き換えたものはこちらです。[docs/kachaka_api_client_async.ipynb](docs/kachaka_api_client_async.ipynb)
