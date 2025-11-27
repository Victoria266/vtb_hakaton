#!/usr/bin/env bash
# Simple metric snapshots: pg_stat_activity, top 10 queries, pg_stat_database
DB_NAME=testdb
OUTDIR=metrics
mkdir -p $OUTDIR
psql -d $DB_NAME -c "SELECT now(), count(*) AS active FROM pg_stat_activity WHERE state='active';" > $OUTDIR/activity.txt
psql -d $DB_NAME -c "SELECT query, calls, total_time, mean_time FROM pg_stat_statements ORDER BY total_time DESC LIMIT 20;" > $OUTDIR/top_queries.txt
psql -d $DB_NAME -c "SELECT datname, xact_commit, xact_rollback, blks_read, blks_hit FROM pg_stat_database;" > $OUTDIR/db_stats.txt


echo "Metrics collected to $OUTDIR"