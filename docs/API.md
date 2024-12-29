# カチャカAPIでできること

* Pythonから利用できるカチャカのAPIは、[kachaka_api/aio/base.py](https://github.com/pf-robotics/kachaka-api/blob/main/python/kachaka_api/aio/base.py)のKachakaApiClientのメソッドとして定義されています。
* それぞれがどのような機能なのかは、2.1以降のセクションで説明します。

<details>
<summary>KachakaApiClientのメソッド一覧</summary>

```python
{{#include ../kachaka-api/python/kachaka_api/aio/base.py}}
```

</details>

## カチャカAPIとは？

* ちなみに、PythonライブラリはあくまでカチャカAPIをPythonから使えるようにするラッパーで、カチャカAPIは実はgRPCという通信プロトコルによって提供されています。
* そのgRPCのプロトコル定義は[protos/kachaka-api.proto](https://github.com/pf-robotics/kachaka-api/blob/main/protos/kachaka-api.proto)にあります。

<details>
<summary>kachaka-api.protoの全文</summary>

```proto
{{#include ../kachaka-api/protos/kachaka-api.proto}}
```

</details>

## カチャカAPIでできること
- [カチャカによる家具の操作](./api/shelf_handling.md)
