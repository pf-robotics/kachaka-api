#!/bin/bash -eu

TARGET_NAMES=("$@")

cat << EOF
group "default" {
    targets = [
EOF

for name in "${TARGET_NAMES[@]}"; do
    echo "        \"${name}\","
done

cat << EOF
    ]
}

target "base" {
    dockerfile = "${DOCKERFILE}"
    platforms = ["${PLATFORM}"]
EOF
if [[ -n ${OUTPUT_TYPE-} ]]; then
    echo "    output = [\"type=${OUTPUT_TYPE}\"]"
fi
cat << EOF
    args = {
        BUILD_VERSION = "${BUILD_VERSION}"
        SOFTWARE_VERSION = "${SOFTWARE_VERSION}"
        TAG = "${TAG}"
    }
}

EOF

for name in "${TARGET_NAMES[@]}"; do
    if [[ ${USE_STAGE_NAME_AS_TAG:-} == "true" ]]; then
        tags="[\"${name}\"]"
    else
        tags="[\"asia-northeast1-docker.pkg.dev/pfr-flexci/tmp/${name}:${TAG}\"]"
    fi
    cat << EOF
target "${name}" {
    inherits = ["base"]
EOF
    cat << EOF
    target = "${name}"
    tags = ${tags}
}
EOF
done
