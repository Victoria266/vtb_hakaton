#!/usr/bin/env bash
set -e
DB_NAME=testdb
TIME=60


# Run heavy aggregation repeatedly
end=$((SECONDS+TIME))
while [ $SECONDS -lt $end ]; do
psql -d $DB_NAME -c "\i sql/olap_queries.sql"
done