#!/usr/bin/env bash
set -e
DB_NAME=testdb
DUMP=baseline.dump


if [ ! -f $DUMP ]; then
echo "Dump $DUMP not found"
exit 1
fi


pg_restore -d $DB_NAME $DUMP