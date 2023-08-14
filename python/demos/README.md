# PythonでgRPC APIを実行するサンプル

## 準備
```
git clone https://github.com/pf-robotics/kachaka-api.git # 本リポジトリ
python3 -m venv venv
source venv/bin/activate
cd kachaka-api/python/demos
pip install -r requirements.txt

python -m grpc_tools.protoc -I../../protos --python_out=. --pyi_out=. --grpc_python_out=. ../../protos/kachaka-api.proto
```

## 実行
```
python <サンプルコード>.py <カチャカのIPアドレス>:26400
```
