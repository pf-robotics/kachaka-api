#!/bin/bash

set -eu

export UV_CACHE_DIR=/tmp/.cache/uv
export UV_PYTHON_INSTALL_DIR=/tmp/.local/share/uv

pushd /app
uv sync

uv run python -m grpc_tools.protoc \
    -I/protos \
    --python_out="/generated" \
    --pyi_out="/generated" \
    --grpc_python_out="/generated" \
    /protos/kachaka-api.proto

sed "/generated"/kachaka_api_pb2_grpc.py -i \
    -e "s/import kachaka_api_pb2/from . import kachaka_api_pb2/" \
    -e "s/self, channel/self, channel: grpc.Channel/"
