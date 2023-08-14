#!/usr/bin/env bash

set -euo pipefail

project="$1"
timeout="${2:-1d}"
no_output_timeout_sec="${3:-300}"
gs_log_file="pfr-flexci-tmp2/baku/log/${project}/${FLEXCI_JOB_ID}-${FLEXCI_RUN_ID}.txt"
gs_stats_file="pfr-flexci-tmp2/baku/log/${project}/${FLEXCI_JOB_ID}-${FLEXCI_RUN_ID}-stats.tar.gz"

LOG_FILE=/tmp/log.txt
STATS_DIR=/tmp/stats
STOP_FILE=/tmp/stop-launcher

on_exit() {
    readonly STATS_ARCHIVE=/tmp/stats.tar.gz
    if [[ -e "${LOG_FILE}" ]]; then
        gsutil -q cp "${LOG_FILE}" "gs://${gs_log_file}"
    fi
    tar -zcf "${STATS_ARCHIVE}" "${STATS_DIR}"
    gsutil -q cp "${STATS_ARCHIVE}" "gs://${gs_stats_file}"
}
trap on_exit EXIT

init_kill_process_group() {
    set -m # Enable monitor mode to create process group for each job.
}

kill_process_group() {
    local pid="$1"
    # See https://stackoverflow.com/a/15139734
    kill -- "-$(ps -o pgid= "${pid}" | tr -d ' ')" || :
}

detect_no_output() {
    while true; do
        if [[ -e "${STOP_FILE}" ]]; then
            return
        fi
        if [[ -e "${LOG_FILE}" ]]; then
            stamp="$(stat -c %Y ${LOG_FILE})"
            now="$(date +%s)"
            if [[ $((now - stamp)) -gt "${no_output_timeout_sec}" ]]; then
                echo "No output for ${no_output_timeout_sec} sec!"
                return 1
            fi
        fi
        sleep 1s
    done
}

gather_stats() {
    mkdir -p "${STATS_DIR}"

    vmstat 1 -n -t > "${STATS_DIR}/vmstat.log" &
    vmstat_pid=$!
    trap 'kill "${vmstat_pid}"' EXIT

    while true; do
        if [[ -e "${STOP_FILE}" ]]; then
            return
        fi
        top -b -n1 >> "${STATS_DIR}/top-$(date +%s).log"
        sleep 1s
    done
}

init_kill_process_group

echo
echo "Full log is available here:"
echo "https://storage.cloud.google.com/${gs_log_file}"
echo "Stats are available here:"
echo "https://storage.cloud.google.com/${gs_stats_file}"
echo

( .flexci/script.sh "${project}" 2>&1 | ts | tee "${LOG_FILE}" ) &
( sleep "${timeout}" && echo timeout! && exit 1 ) &
( detect_no_output ) &
( gather_stats ) &

ret=0
wait -n || ret=$?

touch "${STOP_FILE}"
for pid in $(jobs -p); do
    kill_process_group "${pid}"
done

exit "${ret}"
