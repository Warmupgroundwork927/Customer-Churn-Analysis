-- Average Tenure
SELECT ROUND(AVG(`Tenure Months`),2) AS avg_tenure
FROM customers;

-- Average Tenure by Churn Status
SELECT `Churn Label`,
       ROUND(AVG(`Tenure Months`),2) AS avg_tenure
FROM customers
GROUP BY `Churn Label`;

-- Customers with Tenure Less Than 12 Months
SELECT COUNT(*) AS new_customers
FROM customers
WHERE `Tenure Months` < 12;

-- Churn Rate Among New Customers
SELECT ROUND(
       100.0 *
       SUM(CASE WHEN `Churn Label`='Yes' THEN 1 ELSE 0 END)
       / COUNT(*),
       2
       ) AS churn_rate
FROM customers
WHERE `Tenure Months` < 12;

-- Long-Term Loyal Customers
SELECT CustomerID,
       `Tenure Months`,
       `Monthly Charges`
FROM customers
WHERE `Tenure Months` > 60
AND `Churn Label`='No'
LIMIT 20;