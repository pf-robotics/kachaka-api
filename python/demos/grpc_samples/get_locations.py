import sys

import grpc
import kachaka_api_pb2
from kachaka_api_pb2_grpc import KachakaApiStub

# gRPCの初期化
stub = KachakaApiStub(grpc.insecure_channel(sys.argv[1]))

# GetLocationsを実行します
response = stub.GetLocations(kachaka_api_pb2.GetRequest())

# 実行結果を表示
print(response)
