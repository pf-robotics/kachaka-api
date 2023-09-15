import sys

import grpc
import kachaka_api_pb2
from kachaka_api_pb2_grpc import KachakaApiStub

# gRPCの初期化
stub = KachakaApiStub(grpc.insecure_channel(sys.argv[1]))

# リクエストを準備します
req = kachaka_api_pb2.SetAutoHomingEnabledRequest(enable=False)

# SetAutoHomingEnabledを実行します
response = stub.SetAutoHomingEnabled(req)
if not response.result.success:
    print("Sending SetAutoHomingEnabled failed")

# 実行結果を表示
print(response)
