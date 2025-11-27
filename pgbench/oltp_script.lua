-- simple lua script for pgbench


type = "custom"


function init()
end


function transaction()
-- read and write small
pgbench.query("INSERT INTO demo.orders (customer_id, amount, status) VALUES (floor(random()*10000)+1, 100, 0)")
pgbench.query("SELECT id FROM demo.orders WHERE customer_id = floor(random()*10000)+1 LIMIT 1")
end