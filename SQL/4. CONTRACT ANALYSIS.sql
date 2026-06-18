-- Customers by Contract Type
SELECT Contract,
       COUNT(*) AS customers
FROM customers
GROUP BY Contract;

-- Churn by Contract Type
SELECT Contract,
       COUNT(*) AS customers,
       SUM(CASE WHEN `Churn Label`='Yes' THEN 1 ELSE 0 END) AS churned
FROM customers
GROUP BY Contract;

-- Churn Rate by Contract Type
SELECT Contract,
       ROUND(
       100.0 *
       SUM(CASE WHEN `Churn Label`='Yes' THEN 1 ELSE 0 END)
       / COUNT(*),
       2
       ) AS churn_rate
FROM customers
GROUP BY Contract
ORDER BY churn_rate DESC;