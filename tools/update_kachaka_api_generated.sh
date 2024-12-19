#!/bin/bash

set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# build docker image specifying the target stage
pushd "${SCRIPT_DIR}/gen_proto"
docker build \
    -t kachaka-api-gen-proto \
    --target kachaka-api-gen-proto \
    .
popd

# run docker image
REPO_TOP_DIR="${SCRIPT_DIR}/.."
cd "${REPO_TOP_DIR}"
docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v "${REPO_TOP_DIR}/protos:/protos" \
    -v "${REPO_TOP_DIR}/python/kachaka_api/generated:/generated" \
    -v "${REPO_TOP_DIR}/tools/gen_proto:/app" \
    kachaka-api-gen-proto
