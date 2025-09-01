#!/usr/bin/env bash
set -euo pipefail
[ -z "${DEBUG:-}" ] || set -xv

readonly SIGNAL_LOAD='/signal/load'
readonly SERVICE='workload.default.svc.cluster.local.'
readonly CYCLE=15
readonly PORT='8080'

while true; do
  if [ -f "${SIGNAL_LOAD}" ]
  then
    IP=$(dig +short "${SERVICE}")
    SECONDS=0
    while [ $SECONDS -lt $CYCLE ]; do
      set +e; wget -q -O- "http://${IP}:${PORT}"; set -e
    done
  else
    sleep $CYCLE
  fi
done
