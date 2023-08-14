#!/bin/bash

set -eu

DOCKER_COMPOSE_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "${DOCKER_COMPOSE_DIR}"

usage() {
    echo "Usage: $0 KACHAKA_IP_ADRESS [Option]"
    echo "  -d    daemonize"
    exit 1
}

if [[ $# -lt 1 ]]; then
    usage
fi

USER_ID="$(id -u)"
GROUP_ID="$(id -g)"
GRPC_PORT=26400

export USER_ID
export GROUP_ID

KACHAKA_IP=$1

if command -v docker-compose; then
    API_GRPC_BRIDGE_SERVER_URI="${KACHAKA_IP}:${GRPC_PORT}" docker-compose up "${@:2}" ros2_bridge 
else
    API_GRPC_BRIDGE_SERVER_URI="${KACHAKA_IP}:${GRPC_PORT}" docker compose up "${@:2}" ros2_bridge
fi
