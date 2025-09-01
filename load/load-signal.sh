#!/usr/bin/env bash
set -euo pipefail
[ -z "${DEBUG:-}" ] || set -xv

readonly ALARM_MINUTE="00"
readonly SIGNAL_LOAD='/signal/load'
readonly LOAD_TIME=1200 # 20 MINUTES
readonly CYCLE=15

while true; do
    NOW_MINUTE=$(date +%M)
    if [ "${NOW_MINUTE}" == "${ALARM_MINUTE}" ]; then
        touch "${SIGNAL_LOAD}"
        sleep $LOAD_TIME
        rm "${SIGNAL_LOAD}"
    fi
  sleep $CYCLE
done
