#!/bin/bash

set -eux

if [ $# != 1 ]; then
    echo "usage: ./tools/update_docker_images.sh <TAG>"
    exit 1
fi

DATE="$(date +"%Y%m%d")"
TAG="$1"

function get_internal_image() {
    local PLATFORM=$1
    local digest
    digest=$( \
        docker manifest inspect asia-northeast1-docker.pkg.dev/pfr-flexci/tmp/kachaka-grpc-ros2-bridge:"${TAG}-${PLATFORM}" \
            | jq -r ".manifests[] | select(.platform.os == \"linux\" and .platform.architecture == \"${PLATFORM}\") | .digest" \
    )
    echo "asia-northeast1-docker.pkg.dev/pfr-flexci/tmp/kachaka-grpc-ros2-bridge@${digest}"
}

arm64_image=$(get_internal_image arm64)
amd64_image=$(get_internal_image amd64)

docker manifest create asia-northeast1-docker.pkg.dev/kachaka-api/docker/kachaka-grpc-ros2-bridge:"${DATE}" \
    "${arm64_image}" \
    "${amd64_image}"
docker manifest push asia-northeast1-docker.pkg.dev/kachaka-api/docker/kachaka-grpc-ros2-bridge:"${DATE}"
