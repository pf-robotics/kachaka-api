# PythonでgRPC APIを実行するサンプル

## 準備
```
git clone https://github.com/pf-robotics/kachaka-api.git # 本リポジトリ
python3 -m venv venv
source venv/bin/activate
cd kachaka-api/python/demos
pip install -r requirements.txt
cd grpc_samples
python -m grpc_tools.protoc -I../../../protos --python_out=. --pyi_out=. --grpc_python_out=. ../../../protos/kachaka-api.proto
```

## 実行
```
python <サンプルコード>.py <カチャカのIPアドレス>:26400
```


### 地図のインポート・エクスポートの例

マップの一覧を取得
```
% ./get_map_list.py XX.XX.XX.XX:26400
metadata {
  cursor: 42676578825899
}
map_list_entries {
  id: "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
  name: "Map 1"
}
map_list_entries {
  id: "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
  name: "Map 2"
}
```

エクスポート
```
./export_map_api_client.py -s XX.XX.XX.XX:26400 -m XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX -o my-map1.kmap
```

インポート
```
./import_map_api_client.py -s XX.XX.XX.XX:26400 -i my-map1.kmap
```
