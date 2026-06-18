-- Customers by Internet Service
SELECT `Internet Service`,
       COUNT(*) AS customers
FROM customers
GROUP BY `Internet Service`;

-- Churn by Internet Service
SELECT `Internet Service`,
       COUNT(*) AS customers,
       SUM(CASE WHEN `Churn Label`='Yes' THEN 1 ELSE 0 END) AS churned
FROM customers
GROUP BY `Internet Service`;

-- Churn Rate by Internet Service
SELECT `Internet Service`,
       ROUND(
       100.0 *
       SUM(CASE WHEN `Churn Label`='Yes' THEN 1 ELSE 0 END)
       / COUNT(*),
       2
       ) AS churn_rate
FROM customers
GROUP BY `Internet Service`
ORDER BY churn_rate DESC;
