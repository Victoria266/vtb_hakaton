-- OLAP workload: heavy aggregations
-- Top customers by total amount
SELECT customer_id, sum(amount) as total, count(*)
FROM demo.orders
GROUP BY customer_id
ORDER BY total DESC
LIMIT 100;


-- Time series aggregation
SELECT date_trunc('hour', created_at) as hr, sum(amount) as total
FROM demo.orders
GROUP BY hr
ORDER BY hr DESC
LIMIT 100;


-- Join with sales wide table
SELECT s.category, count(*) as cnt, sum(s.amount) as total
FROM demo.sales s
JOIN demo.customers c ON s.customer_id = c.id
GROUP BY s.category
ORDER BY total DESC;