-- Schema for OLTP + OLAP testbed
CREATE SCHEMA IF NOT EXISTS demo;


-- Customers (OLTP)
CREATE TABLE demo.customers (
id SERIAL PRIMARY KEY,
name TEXT,
email TEXT UNIQUE,
created_at TIMESTAMP DEFAULT now()
);


-- Orders (OLTP heavy writes + reads)
CREATE TABLE demo.orders (
id BIGSERIAL PRIMARY KEY,
customer_id INT NOT NULL REFERENCES demo.customers(id),
amount NUMERIC(12,2) NOT NULL,
status SMALLINT DEFAULT 0,
created_at TIMESTAMP DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_orders_customer ON demo.orders(customer_id);
CREATE INDEX IF NOT EXISTS idx_orders_created_at ON demo.orders(created_at);


-- Events (IoT / ingest)
CREATE TABLE demo.events (
id BIGSERIAL PRIMARY KEY,
device_id INT,
payload JSONB,
created_at TIMESTAMP DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_events_device ON demo.events(device_id);


-- Wide table for OLAP (denormalized)
CREATE TABLE demo.sales (
id BIGSERIAL PRIMARY KEY,
customer_id INT,
product_id INT,
category TEXT,
amount NUMERIC(12,2),
created_at TIMESTAMP
);