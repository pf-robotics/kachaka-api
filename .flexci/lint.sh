#!/bin/bash

set -eu

docker run --rm \
    -v "$(pwd)":"$(pwd)" \
    --workdir="$(pwd)" \
    asia-northeast1-docker.pkg.dev/pfr-flexci/tmp/kachaka-api.lint:KEEP-20230828 \
    bash << EOF
        python3 -m venv /tmp/env
        source /tmp/env/bin/activate
        pip3 install -r tools/lint/requirements.txt
        pip3 install -e .
        ./tools/lint/local_run.sh
EOF
