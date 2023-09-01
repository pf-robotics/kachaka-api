#!/usr/bin/env bash

set -eu

FORMAT=0
while [[ "$#" -gt 0 ]]; do
    case "$1" in
    -i)
        FORMAT=1
        ;;
    -*)
        echo "Usage:"
        echo "  - Perform lint:"
        echo "      tools/lint/run.sh [-i]"
        exit 1
        ;;
    esac
    shift
done

TMP_DIR="$(mktemp -d /tmp/kachaka_api_lint_XXXXXX)"
trap 'rm -rf "${TMP_DIR}"; exit 1' 1 2 3 15

mapfile -t ipynb_files < <(git ls-files | grep ipynb)
if [[ "$FORMAT" -eq 1 ]]; then
    ./tools/update_kachaka_api_base.py
    pysen run format lint
    mypy
    # TODO(nozaki) Use pysen plugins
    nbqa black "${ipynb_files[@]}"
    nbqa isort "${ipynb_files[@]}"
else
    ./tools/update_kachaka_api_base.py "${TMP_DIR}"/base.py
    black -l 80 "${TMP_DIR}"/base.py
    isort "${TMP_DIR}"/base.py
    diff -u python/kachaka_api/base.py "${TMP_DIR}"/base.py || {
        echo
        echo Failed to check kachaka_api/base.py
        echo Please run tools/update_kachaka_api_base.py
        exit 1
    }
    pysen run lint
    mypy
    # TODO(nozaki) Use pysen plugins
    nbqa black "${ipynb_files[@]}" --diff --check
    nbqa isort "${ipynb_files[@]}" --diff --check-only
fi
