-- heavy sql for pgbench: run an aggregation
SELECT customer_id, sum(amount) FROM demo.orders GROUP BY customer_id ORDER BY sum DESC LIMIT 100;