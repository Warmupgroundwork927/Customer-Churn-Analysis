-- Customers by Payment Method
SELECT `Payment Method`,
       COUNT(*) AS customers
FROM customers
GROUP BY `Payment Method`;

-- Churn Rate by Payment Method
SELECT `Payment Method`,
       ROUND(
       100.0 *
       SUM(CASE WHEN `Churn Label`='Yes' THEN 1 ELSE 0 END)
       / COUNT(*),
       2
       ) AS churn_rate
FROM customers
GROUP BY `Payment Method`
ORDER BY churn_rate DESC;