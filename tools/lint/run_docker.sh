#!/bin/bash

set -eu

OPTS=()
while [[ $# -gt 0 ]]; do
    case $1 in
    -i)
        OPTS+=(-i)
        ;;
    -*)
        echo "Usage:"
        echo "  - Perform lint:"
        echo "      $0 [-i]"
        exit 1
        ;;
    esac
    shift
done

set -eu

REPO_TOP_DIR="$(git rev-parse --show-toplevel)"
docker run --rm \
    -v "${REPO_TOP_DIR}:${REPO_TOP_DIR}" \
    --workdir="$(pwd)" \
    --user="$(id -u):$(id -g)" \
    asia-northeast1-docker.pkg.dev/pfr-flexci/tmp/kachaka-api.lint:KEEP-20230815 \
    bash ./tools/lint/local_run.sh "${OPTS[@]}"
