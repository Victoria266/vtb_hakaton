#!/usr/bin/env bash
set -e

DB_NAME=testdb
DB_USER=testuser
DB_PASS=testpass
PG_HOST=pg

export PGPASSWORD=$DB_PASS
OUTDIR=metrics
mkdir -p $OUTDIR

echo "Collecting metrics..."

psql -h $PG_HOST -U $DB_USER -d $DB_NAME -c "SELECT now(), count(*) AS active FROM pg_stat_activity WHERE state='active';" > $OUTDIR/activity.txt
psql -h $PG_HOST -U $DB_USER -d $DB_NAME -c "SELECT query, calls, total_time, mean_time FROM pg_stat_statements ORDER BY total_time DESC LIMIT 20;" > $OUTDIR/top_queries.txt
psql -h $PG_HOST -U $DB_USER -d $DB_NAME -c "SELECT datname, xact_commit, xact_rollback, blks_read, blks_hit FROM pg_stat_database;" > $OUTDIR/db_stats.txt

echo "Metrics collected to $OUTDIR"
