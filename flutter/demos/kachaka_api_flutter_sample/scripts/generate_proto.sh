#!/bin/bash

mkdir -p lib/repositories/kachaka/generated
protoc --proto_path=../../../protos --dart_out=grpc:lib/repositories/kachaka/generated ../../../protos/kachaka-api.proto
