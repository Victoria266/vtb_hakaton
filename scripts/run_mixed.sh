#!/usr/bin/env bash
set -e

./scripts/run_oltp.sh &
OLTP_PID=$!
sleep 2
./scripts/run_olap.sh &
OLAP_PID=$!

wait $OLTP_PID $OLAP_PID
