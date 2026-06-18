SELECT COUNT(*) AS churned_customers
FROM customers
WHERE `Churn Label` = 'Yes';

-- Churn Distribution
SELECT `Churn Label`,
       COUNT(*) AS customers
FROM customers
GROUP BY `Churn Label`;

-- Overall Churn Rate
SELECT ROUND(
       100.0 *
       SUM(CASE WHEN `Churn Label` = 'Yes' THEN 1 ELSE 0 END)
       / COUNT(*),
       2
       ) AS churn_rate
FROM customers;