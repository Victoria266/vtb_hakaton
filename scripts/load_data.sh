#!/usr/bin/env bash
set -e

DB_NAME=testdb
DB_USER=testuser
DB_PASS=testpass
PG_HOST=pg

export PGPASSWORD=$DB_PASS

# Генерация CSV
python3 sql/seed_generate.py

# Загрузка данных
psql -h $PG_HOST -U $DB_USER -d $DB_NAME -c "\copy demo.customers(id,name,email,created_at) FROM 'sql/customers.csv' CSV HEADER;"
psql -h $PG_HOST -U $DB_USER -d $DB_NAME -c "\copy demo.orders(id,customer_id,amount,status,created_at) FROM 'sql/orders.csv' CSV HEADER;"

echo "Data loaded successfully."
