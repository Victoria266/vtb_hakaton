-- simple lua script for pgbench

type = "custom"

function init()
end

function transaction()
  local cust = math.floor(math.random()*10000+1)
  pgbench.query("INSERT INTO demo.orders (customer_id, amount, status) VALUES ("..cust..", 100, 0)")
  pgbench.query("SELECT id FROM demo.orders WHERE customer_id="..cust.." LIMIT 1")
end
