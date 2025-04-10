#!/bin/bash

set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_TOP_DIR="${SCRIPT_DIR}/.."

cd "${REPO_TOP_DIR}" || exit 1

# build docker image specifying the target stage
docker build \
    --target kachaka-api-gen-proto-ros2 \
    -t kachaka-api-gen-proto-ros2 \
    .

# run docker image
mkdir -p "${REPO_TOP_DIR}/ros2/kachaka_grpc_ros2_bridge/gen-src"
docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v "${REPO_TOP_DIR}/protos:/protos" \
    -v "${REPO_TOP_DIR}/ros2/kachaka_grpc_ros2_bridge/gen-src:/generated" \
    kachaka-api-gen-proto-ros2

