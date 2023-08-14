#!/bin/bash

set -eu

output_dir=python/kachaka_api/generated

python -m grpc_tools.protoc -I./protos --python_out="$output_dir" --pyi_out="$output_dir" --grpc_python_out="$output_dir" ./protos/kachaka-api.proto
sed "$output_dir"/kachaka_api_pb2_grpc.py -i -e "s/import kachaka_api_pb2/from . import kachaka_api_pb2/"
