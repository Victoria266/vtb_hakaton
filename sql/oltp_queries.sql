-- OLTP workload: many short transactions
BEGIN;
INSERT INTO demo.orders (customer_id, amount, status) VALUES (floor(random()*10000)+1, round(random()*100,2), 0);
COMMIT;


-- Simple read (single customer's recent orders)
SELECT id, amount, created_at FROM demo.orders WHERE customer_id = floor(random()*10000)+1 ORDER BY created_at DESC LIMIT 10;


-- Update status for an order
UPDATE demo.orders SET status = 1 WHERE id = floor(random()*200000)+1;