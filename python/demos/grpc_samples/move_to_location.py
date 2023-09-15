import sys

import grpc
import kachaka_api_pb2
from kachaka_api_pb2_grpc import KachakaApiStub

# gRPCの初期化
stub = KachakaApiStub(grpc.insecure_channel(sys.argv[1]))

# 現在のカーソルを取得します
req = kachaka_api_pb2.GetRequest()
resp = stub.GetLastCommandResult(req)
last_cursor = resp.metadata.cursor

# move_to_locationのコマンドを準備します
req = kachaka_api_pb2.StartCommandRequest(
    command=kachaka_api_pb2.Command(
        move_to_location_command=kachaka_api_pb2.MoveToLocationCommand(
            target_location_id="L01"
        )
    )
)

# コマンドを実行します
resp = stub.StartCommand(req)
if not resp.result.success:
    print("Sending MoveToLocation command failed: " + resp.result.error_code)
    sys.exit(1)

print("MoveToLocation command sent")

# コマンドの実行が完了するのを待ちます
req = kachaka_api_pb2.GetRequest()
while True:
    resp = stub.GetLastCommandResult(req)
    if last_cursor != resp.metadata.cursor:
        break
    req.metadata.cursor = resp.metadata.cursor
    if not resp.result.success:
        print("MoveToLocation command failed :", resp.result.error_code)
        sys.exit(1)

print("MoveToLocation command completed")
