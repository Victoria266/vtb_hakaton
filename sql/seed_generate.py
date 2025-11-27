#!/usr/bin/env python3
# Simple CSV generator for demo data
import csv
from datetime import datetime, timedelta
import random

NUM_CUSTOMERS = 10000
NUM_ORDERS = 200000

with open('sql/customers.csv', 'w', newline='') as f:
    w = csv.writer(f)
    w.writerow(['id','name','email','created_at'])
    for i in range(1, NUM_CUSTOMERS+1):
        w.writerow([i, f'User{i}', f'user{i}@example.com', datetime.utcnow().isoformat()])

with open('sql/orders.csv', 'w', newline='') as f:
    w = csv.writer(f)
    w.writerow(['id','customer_id','amount','status','created_at'])
    for i in range(1, NUM_ORDERS+1):
        cust = random.randint(1, NUM_CUSTOMERS)
        amount = round(random.random()*1000,2)
        status = random.choice([0,1,2])
        ts = (datetime.utcnow() - timedelta(seconds=random.randint(0, 86400*30))).isoformat()
        w.writerow([i, cust, amount, status, ts])

print('Generated customers.csv and orders.csv')