#!/bin/bash

set -eu

output_dir=python/kachaka_api/generated

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# build docker image specifying the target stage
pushd "${SCRIPT_DIR}/gen_proto" || exit 1
docker build \
    -t kachaka-api-gen-proto \
    --target kachaka-api-gen-proto \
    .
popd || exit 1

# run docker image
REPO_TOP_DIR="${SCRIPT_DIR}/.."
cd "${REPO_TOP_DIR}" || exit 1
docker run --rm \
    -v "${REPO_TOP_DIR}/protos:/protos" \
    -v "${REPO_TOP_DIR}/python/kachaka_api/generated:/generated" \
    kachaka-api-gen-proto
