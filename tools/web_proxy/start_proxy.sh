#!/bin/bash

set -eu

usage() {
    echo "Usage: $0 KACHAKA_IP_ADRESS [Option]"
    echo "  -d    daemonize"
    exit 1
}

if [[ $# -lt 1 ]]; then
    usage
fi

KACHAKA_IP_ADDRESS="$1"
GRPC_WEB_PROXY_PORT=50000


DOCKER_COMPOSE_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "${DOCKER_COMPOSE_DIR}"

# render envoy.yaml from template
sed "s/KACHAKA_IP_ADDRESS/${KACHAKA_IP_ADDRESS}/" ./envoy.yaml.in \
  | sed "s/GRPC_WEB_PROXY_PORT/${GRPC_WEB_PROXY_PORT}/" \
  > envoy.yaml

export GRPC_WEB_PROXY_PORT

if command -v docker-compose; then
    docker-compose up "${@:2}" grpc_web_proxy
else
    docker compose up "${@:2}" grpc_web_proxy
fi
