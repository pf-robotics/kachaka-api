#!/bin/bash

set -eu

protoc -I /protos \
    --grpc_out=/generated \
    --plugin=protoc-gen-grpc=/usr/bin/grpc_cpp_plugin \
    --cpp_out=/generated \
    /protos/kachaka-api.proto

