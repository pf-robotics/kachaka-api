#!/bin/bash

set -eu

docker run --rm \
    -v "$(pwd)":"$(pwd)" \
    --workdir="$(pwd)" \
    asia-northeast1-docker.pkg.dev/pfr-flexci/tmp/kachaka-api.lint:KEEP-20230804 \
    bash ./tools/lint/local_run.sh
