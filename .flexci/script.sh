#!/bin/bash

set -eux

declare -A duration
declare -A timings

# shellcheck disable=SC1091
source ./.flexci/env.sh

sed -i "s/StartLimitBurst=.\+/StartLimitBurst=20/g" /lib/systemd/system/docker.service
systemctl daemon-reload

CACHE_DIR="/tmp/cache"
CACHE_DOCKER_DIR="${CACHE_DIR}/docker"

readonly project="$1"

start_timer() {
    { set +x; } 2> /dev/null
    timings[$1]=$(date +%s.%N)
    set -x
}

record_timer() {
    { set +x; } 2> /dev/null
    local t0=${timings[$1]}
    local t1
    t1=$(date +%s.%N)
    duration[$1]=$(awk "BEGIN {print ${t1} - ${t0}}")
    set -x
}

function prepare_local_ssd_if_exists {
    local DEV_PATH=/dev/nvme0n1

    if [[ ! -e "${DEV_PATH}" ]]; then
        echo "No Local SSD."
        return
    fi
    echo "Use Local SSD."
    mkfs.ext4 -m 0 -O ^has_journal -E discard -F "${DEV_PATH}"

    # Mount local SSD as CACHE_DIR
    mkdir -p "${CACHE_DIR}"
    mount -o defaults,nodiscard,nobarrier,noatime "${DEV_PATH}" "${CACHE_DIR}"
    chmod a+w "${CACHE_DIR}"
}

function setup_docker_cache_dir {
    mkdir -p "${CACHE_DOCKER_DIR}"
    systemctl stop docker
    umount /var/lib/docker
    mount -o bind "${CACHE_DOCKER_DIR}" /var/lib/docker
    systemctl start docker
}

function print_versions {
    cat "/etc/os-release"
    uname -a
    docker version
    git version
}

function wait_for_github_connection {
    MAX_RETRY=30
    for ((i=0; i<MAX_RETRY; i++)); do
        if [[ "${i}" -ne 0 ]]; then
            echo "Waiting for github.com..."
            sleep 1
        fi
        if ping -c 1 -W 1 github.com; then
            return 0
        fi
    done
    echo "Failed to ping github.com."
    return 1
}

function install_crane {
    readonly ARCHIVE=/tmp/crane.tar.gz
    curl -sSL -o "${ARCHIVE}" https://github.com/google/go-containerregistry/releases/download/v0.8.0/go-containerregistry_Linux_x86_64.tar.gz
    tar -xf "${ARCHIVE}" -C /bin crane
}

function install_zstd {
    apt-get update
    apt-get install -y zstd
}

start_timer "total"

prepare_local_ssd_if_exists

setup_docker_cache_dir

# TODO(nakaoka): Reenable this after checking github.com responds to ping
#wait_for_github_connection

ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

print_versions

install_crane
install_zstd

# Enable BuiltKit
export DOCKER_BUILDKIT=1

# Repository
start_timer "submodule-update"
git submodule update --init --recursive
record_timer "submodule-update"

# Docker
gcloud auth configure-docker asia-northeast1-docker.pkg.dev

# For scheduled jobs, use main branch
if [[ ${FLEXCI_BRANCH} == "" ]]; then
    FLEXCI_BRANCH=refs/heads/main
fi

function get_branch_or_tag_name {
    { set +x; } 2> /dev/null
    local branch="${1:-_}"
    if [[ ${branch} =~ ^refs/heads/ ]]; then
        out="${branch#refs/heads/}"
    elif [[ ${branch} =~ ^refs/tags/ ]]; then
        out="${branch#refs/tags/}"
    else
        out="${branch}"
    fi
    out="$(echo -n "${out}" | sed 's/[^a-zA-Z0-9_.-]/_/g')"
    set -x
    echo "${out}"
}

function gen_docker_image_tag_name {
    { set +x; } 2> /dev/null
    local branch="${1:-_}"
    out="$(get_branch_or_tag_name "${branch}")"
    if [[ ${branch} =~ ^refs/tags/ ]]; then
        out="KEEP-${out}"
    fi
    set -x
    echo "${out}"
}

function gen_gar_image_name {
    { set +x; } 2> /dev/null
    local image="$1"
    local branch="${2:-_}"
    local tag
    tag="$(gen_docker_image_tag_name "${branch}")"
    set -x
    echo -n "asia-northeast1-docker.pkg.dev/pfr-flexci/tmp/${image}:${tag}"
}

function get_branch_gs_cache_url {
    local project_name="$1"
    local branch="$2"
    echo "gs://pfr-flexci-tmp2/baku/docker-cache-v3/${branch}/${project_name}.tar.zstd"
}

function clear_buildx_cache_if_permanent_docker_cache_error_is_detected {
    # This file is output from launcher.sh
    local LOG_FILE=/tmp/log.txt
    local TMP_LOG_FILE=/tmp/check-permanent-docker-cache-error-log.txt
    sleep 1 # wait for flush
    tail -n 20 "${LOG_FILE}" > "${TMP_LOG_FILE}"
    if grep -Fq "ERROR: failed to solve: failed to get edge: inconsistent graph state" "${TMP_LOG_FILE}"; then
        echo "Inconsistent graph state is detected! Clear buildx cache."
        docker buildx prune -f
    fi
}

function run_buildkit_cache_gc {
    local project_name="$1"
    size_mb=13312  # 13GB

    # First, remove chache of local files and network files
    docker exec "buildx_buildkit_${BUILDKIT_VERSION}0" buildctl prune \
        --keep-duration 172800s \
        --keep-storage 512 \
        --filter type==source.local \
        --filter type==exec.cachemount \
        --filter type==source.git.checkout
    # Remove all cache after 1 week
    docker exec "buildx_buildkit_${BUILDKIT_VERSION}0" buildctl prune \
        --keep-duration 604800s \
        | grep Total
    # Remove cache older than 3 days, if the total size is above the limit.
    docker exec "buildx_buildkit_${BUILDKIT_VERSION}0" buildctl prune \
        --keep-duration 259200s \
        --keep-storage "${size_mb}" \
        | grep Total
    # Remove cache older than 1 day, if the total size is above the limit.
    docker exec "buildx_buildkit_${BUILDKIT_VERSION}0" buildctl prune \
        --keep-duration 86400s \
        --keep-storage "${size_mb}" \
        | grep Total
    # Remove cache older than 2 hours, if the total size is above the limit.
    docker exec "buildx_buildkit_${BUILDKIT_VERSION}0" buildctl prune \
        --keep-duration 7200s \
        --keep-storage "${size_mb}" \
        | grep Total
    # Remove cache older than 1 hours, if the total size is above the limit.
    docker exec "buildx_buildkit_${BUILDKIT_VERSION}0" buildctl prune \
        --keep-duration 3600s \
        --keep-storage "${size_mb}" \
        | grep Total
    # Remove cache older than 30 minutes, if the total size is above the limit.
    docker exec "buildx_buildkit_${BUILDKIT_VERSION}0" buildctl prune \
        --keep-duration 1800s \
        --keep-storage "${size_mb}" \
        | grep Total
    # Remove regular cache, if the total size is above the limit.
    docker exec "buildx_buildkit_${BUILDKIT_VERSION}0" buildctl prune \
        --keep-storage "${size_mb}" \
        | grep Total
    # Remove any cache, if the total size is above the limit.
    docker exec "buildx_buildkit_${BUILDKIT_VERSION}0" buildctl prune \
        --keep-storage "${size_mb}" \
        --all \
        | grep Total
}

function upload_docker_cache {
    local project_name="$1"
    local branch
    branch="$(gen_docker_image_tag_name "$2")"
    local gs_cache_url
    gs_cache_url="$(get_branch_gs_cache_url "${project_name}" "${branch}")"
    local gs_tmp_url="${gs_cache_url}.${FLEXCI_JOB_ID}"
    local NEW_CACHE_TAR="${CACHE_DIR}/new-cache.tar.zstd"

    start_timer "upload-cache"
    docker system df -v
    run_buildkit_cache_gc "${project_name}"
    docker system df -v
    docker buildx rm --all-inactive -f
    docker system prune -a --volumes -f
    # Remove unused volumes
    docker volume ls -f dangling=true --format "{{ .Name }}" | xargs --no-run-if-empty docker volume rm
    docker system df -v
    systemctl stop docker
    du -h "${CACHE_DOCKER_DIR}" | tail
    tar -I pzstd -c -f "${NEW_CACHE_TAR}" --directory="${CACHE_DOCKER_DIR}" .
    systemctl start docker
    # Upload to tmp path and rename it to minimize the duration of cache miss.
    gcloud storage cp -q "${NEW_CACHE_TAR}" "${gs_tmp_url}"
    gsutil -mq mv "${gs_tmp_url}" "${gs_cache_url}"
    rm -f "${NEW_CACHE_TAR}"
    record_timer "upload-cache"
}

function check_gcs_object_existence {
    gsutil -q stat "$1"
    return $?
}

function gcs_cp_with_retry {
    MAX_RETRY=8
    SLEEP_BETWEEN_RETRY=15s
    local from="$1"
    local to="$2"
    local ret

    for ((i=0; i<MAX_RETRY; i++)); do
        if [[ "${i}" -ne 0 ]]; then
            echo "Retry download ${i}..."
            rm -rf "${to}"
            sleep "${SLEEP_BETWEEN_RETRY}"
        fi
        ret=0
        gcloud storage cp -q "${from}" "${to}" || ret=$?
        if [[ "${ret}" -eq 0 ]]; then
            return 0
        fi
    done
    echo "Retry limit reached."
    return "${ret}"
}

function download_docker_cache {
    local project_name="$1"
    local branch
    branch="$(gen_docker_image_tag_name "$2")"
    start_timer "download-cache"
    local cache_candidate_urls=(
        "$(get_branch_gs_cache_url "${project_name}" "${branch}")"
        "$(get_branch_gs_cache_url "${project_name}" main)"
    )
    local PREV_CACHE_TAR="${CACHE_DIR}/prev-cache.tar.zstd"
    local has_cache="false"
    for url in "${cache_candidate_urls[@]}"; do
        if check_gcs_object_existence "${url}"; then
            has_cache="true"
            echo "Use cache from ${url}"
            gcs_cp_with_retry "${url}" "${PREV_CACHE_TAR}"
            break
        fi
    done

    if [[ "${has_cache}" == "true" ]]; then
        systemctl stop docker
        tar -I pzstd -x -f "${PREV_CACHE_TAR}" --directory="${CACHE_DOCKER_DIR}"
        systemctl start docker
        rm -f "${PREV_CACHE_TAR}"
    else
        echo "no cache available"
    fi
    record_timer "download-cache"
}

function prepare_build {
    local cache_project_name="$1"
    local branch="$2"

    mkdir -p "${CACHE_DIR}"
    mkdir -p "${CACHE_DOCKER_DIR}"

    download_docker_cache "${cache_project_name}" "${branch}"

    # configure binfmt-support on the Docker host (works locally or remotely, i.e: using boot2docker)
    docker run --rm --privileged multiarch/qemu-user-static:register --reset

    # Setup buildkit
    docker buildx version
    docker buildx ls
    local buildkitd_config
    buildkitd_config="$(pwd)/.flexci/buildkitd.toml"
    if ! docker buildx ls | grep -q "^${BUILDKIT_VERSION}"; then
        docker buildx create --use \
            --driver docker-container \
            --driver-opt "image=moby/buildkit:${BUILDKIT_VERSION},network=host" \
            --config "${buildkitd_config}" \
            --name "${BUILDKIT_VERSION}"
    else
        docker buildx use "${BUILDKIT_VERSION}"
    fi
}

function docker_buildx_build_with_cache {
    local context_dir=$1
    local image=$2
    local target=$3
    shift 3

    local dir_hash
    local gar_image_name
    dir_hash=$(git log --pretty=tformat:"%H" -n1 "${context_dir}")
    gar_image_name="$(gen_gar_image_name "${image}" "${dir_hash}")"

    if ! docker pull "${gar_image_name}"; then
        # Build and push to GAR
        docker buildx build \
            --tag "${gar_image_name}" \
            --target "${target}" \
            --cache-to type=inline \
            --push \
            "$@" \
            "${context_dir}"
        # Export image to docker (completely cached)
        docker buildx build \
            --tag "${gar_image_name}" \
            --target "${target}" \
            --output type=docker \
            "$@" \
            "${context_dir}"
    fi
    docker tag "${gar_image_name}" "${image}"
}

function bake_with_retry {
    if [[ "${FLEXCI_BRANCH}" == "ref/heads/main" ]]; then
        local MAX_BUILD_RETRY=10
    else
        local MAX_BUILD_RETRY=5
    fi
    local project_name="$1"
    local bake_file="$2"
    local ret

    for ((i=0; i<MAX_BUILD_RETRY; i++)); do
        ret=0
        if [[ "${i}" -ne 0 ]]; then
            clear_buildx_cache_if_permanent_docker_cache_error_is_detected
            echo "Retry build ${i}..."
        fi
        docker buildx bake -f "${bake_file}" || ret=$?
        if [[ "${ret}" -eq 0 ]]; then
            return 0
        fi
    done

    { set +x; } 2> /dev/null
    echo
    echo "               ^ Build process above this line"
    echo "               |"
    echo "######################################################################"
    echo "               |"
    echo "               V Post process"
    echo
    set -x

    echo "Retry limit reached. Uploading partial build cache..."
    upload_docker_cache "${project_name}" "${FLEXCI_BRANCH}"
    return "${ret}"
}

JAMMY_TARGET_NAMES=(
    kachaka-grpc-ros2-bridge
    kachaka-ros2-demos
)
BUILD_VERSION="$(git describe --always --dirty --all --long)-$(date '+%Y%m%d-%H%M%S')"

prepare_build "${project}" "${FLEXCI_BRANCH}"

BASE_ARCH=""
DOCKERFILE=Dockerfile.ros2
TARGET_NAMES=("${JAMMY_TARGET_NAMES[@]}")
if [[ "${project}" == kachaka-api.ros.aarch64 ]]; then
    BASE_ARCH=aarch64
elif [[ "${project}" == kachaka-api.ros.x86_64 ]]; then
    BASE_ARCH=x86_64
else
    false
fi

if [[ ${FLEXCI_BRANCH} == refs/heads/main ]]; then
    # On main, push image with hash at first, then tag it with main.
    # Otherwise an image from other CI job may be tagged with wrong hash.
    head_hash="$(git rev-parse --short HEAD)"
    tag="main-${head_hash}"
else
    tag="$(gen_docker_image_tag_name "${FLEXCI_BRANCH}")"
fi
if [[ "${project}" == kachaka-api.ros.x86_64 ]]; then
    tag="${tag}-x86_64"
fi
version="$(get_branch_or_tag_name "${FLEXCI_BRANCH}")"

# Whole build
start_timer "build"
BAKE_FILE=/tmp/bake.hcl
BASE_ARCH="${BASE_ARCH}" \
    BUILD_VERSION="${BUILD_VERSION}" \
    SOFTWARE_VERSION="${version}" \
    DOCKERFILE="${DOCKERFILE}" \
    OUTPUT_TYPE=registry \
    TAG="${tag}" \
    "$(pwd)/.flexci/generate-bake.sh" "${TARGET_NAMES[@]}" > "${BAKE_FILE}"
bake_with_retry "${project}" "${BAKE_FILE}"
record_timer "build"

upload_docker_cache "${project}" "${FLEXCI_BRANCH}"

if [[ ${FLEXCI_BRANCH} == refs/heads/main ]]; then
    # Tag `main-{git-hash}` with `main` name
    start_timer "push main-{hash}"
    for target in "${TARGET_NAMES[@]}"; do
        crane copy \
            "asia-northeast1-docker.pkg.dev/pfr-flexci/tmp/${target}:${tag}" \
            "asia-northeast1-docker.pkg.dev/pfr-flexci/tmp/${target}:main-${BASE_ARCH}"
    done
    record_timer "push main-{hash}"
fi

record_timer "total"

set +x

echo "==================== duration ===================="
for key in "${!duration[@]}"; do
    printf "%33s : %10.3f sec\n" "${key}" "${duration[$key]}"
done \
    | sort -n -t: -k 2,3
echo "=================================================="
