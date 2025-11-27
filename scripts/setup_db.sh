#!/usr/bin/env bash
set -e


# Настройки
DB_NAME=testdb
DB_USER=testuser
DB_PASS=testpass
PG_HOST=localhost


echo "Creating DB and user..."
psql -v ON_ERROR_STOP=1 <<-EOSQL
CREATE ROLE $DB_USER WITH LOGIN PASSWORD '$DB_PASS';
CREATE DATABASE $DB_NAME OWNER $DB_USER;
EOSQL


echo "Applying schema..."
psql -d $DB_NAME -f sql/schema.sql


echo "Done setup."