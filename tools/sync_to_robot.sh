#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 KACHAKA_IP_ADDRESS"
  exit 1
fi

KACHAKA_IP="$1"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
KACHAKA_API_DIR="${SCRIPT_DIR}/.."

rsync -a --rsh "ssh -p 26500" "${KACHAKA_API_DIR}"/ kachaka@"${KACHAKA_IP}":/home/kachaka/kachaka-api/
