-- Total Customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Unique Customers
SELECT COUNT(DISTINCT CustomerID) AS unique_customers
FROM customers;

-- Preview Dataset
SELECT *
FROM customers
LIMIT 10;