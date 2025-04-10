#!/bin/bash

set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_TOP_DIR="${SCRIPT_DIR}/.."

cd "${REPO_TOP_DIR}" || exit 1

# build docker image specifying the target stage
docker build \
    --target kachaka-api-gen-proto-python \
    -t kachaka-api-gen-proto-python \
    .

# run docker image
docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v "${REPO_TOP_DIR}/protos:/protos" \
    -v "${REPO_TOP_DIR}/python/kachaka_api/generated:/generated" \
    kachaka-api-gen-proto-python
