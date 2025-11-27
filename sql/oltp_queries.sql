BEGIN;
INSERT INTO demo.orders (customer_id, amount, status)
VALUES (floor(random()*10000+1)::int, round(random()*100,2), 0);
COMMIT;

SELECT id, amount, created_at
FROM demo.orders
WHERE customer_id = floor(random()*10000+1)::int
ORDER BY created_at DESC
LIMIT 10;

UPDATE demo.orders
SET status = 1
WHERE id = floor(random()*200000+1)::int;
