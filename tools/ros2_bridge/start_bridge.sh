#!/bin/bash

set -eu

USER_ID="$(id -u)"
GROUP_ID="$(id -g)"
GRPC_PORT=26400

export USER_ID
export GROUP_ID

if [[ $# != 1 ]]; then
    echo "usage: $0 kachaka_ip"
    exit 1
fi

KACHAKA_IP=$1

if command -v docker-compose; then
    API_GRPC_BRIDGE_SERVER_URI="${KACHAKA_IP}:${GRPC_PORT}" docker-compose up ros2_bridge
else
    API_GRPC_BRIDGE_SERVER_URI="${KACHAKA_IP}:${GRPC_PORT}" docker compose up ros2_bridge
fi
