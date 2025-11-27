#!/usr/bin/env bash
set -e
DB_NAME=testdb
CLIENTS=50
TIME=60


# Run pgbench with custom script (if available)
pgbench -c $CLIENTS -T $TIME -f pgbench/oltp_script.lua -U testuser $DB_NAME


# Alternatively run many short psql transactions
# for i in $(seq 1 1000); do psql -d $DB_NAME -c "INSERT INTO demo.orders (customer_id, amount) VALUES (floor(random()*10000)+1, 10)" & done