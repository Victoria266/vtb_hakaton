-- init script for pgbench: create simple table
\setrandom customer_id 1 10000
CREATE TABLE IF NOT EXISTS pgbench_accounts (
id bigint PRIMARY KEY,
balance bigint
);