#!/usr/bin/env bash
# Run OLTP and OLAP in parallel to create HTAP scenario
./scripts/run_oltp.sh &
OLTP_PID=$!
sleep 2
./scripts/run_olap.sh &
OLAP_PID=$!


wait $OLTP_PID $OLAP_PID