#!/usr/bin/env python3

# Usage:
#  get_map_list.py XX.XX.XX.XX:26400

import sys

import grpc
import kachaka_api_pb2
from kachaka_api_pb2_grpc import KachakaApiStub

stub = KachakaApiStub(grpc.insecure_channel(sys.argv[1]))
response = stub.GetMapList(kachaka_api_pb2.GetRequest())
print(response)
