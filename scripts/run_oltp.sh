#!/usr/bin/env bash
set -e

DB_NAME=testdb
DB_USER=testuser
DB_PASS=testpass
PG_HOST=pg

export PGPASSWORD=$DB_PASS

CLIENTS=50
TIME=60

echo "Running OLTP load..."
pgbench -h $PG_HOST -U $DB_USER -c $CLIENTS -T $TIME -f pgbench/oltp_script.lua $DB_NAME
