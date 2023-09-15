import sys

import grpc
import kachaka_api_pb2
from kachaka_api_pb2_grpc import KachakaApiStub

stub = KachakaApiStub(grpc.insecure_channel(sys.argv[1]))

response = stub.GetRobotVersion(kachaka_api_pb2.GetRequest())
print("---------- robot version ----------")
print(response)

response = stub.GetRobotSerialNumber(kachaka_api_pb2.GetRequest())
print("---------- serial number ----------")
print(response)
