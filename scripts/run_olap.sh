#!/usr/bin/env bash
set -e

DB_NAME=testdb
DB_USER=testuser
DB_PASS=testpass
PG_HOST=pg

export PGPASSWORD=$DB_PASS

TIME=60
END=$((SECONDS+TIME))

echo "Running OLAP load..."
while [ $SECONDS -lt $END ]; do
  psql -h $PG_HOST -U $DB_USER -d $DB_NAME -f sql/olap_queries.sql
done
