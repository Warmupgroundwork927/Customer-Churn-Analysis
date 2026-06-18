-- Revenue at Risk Due to Churn
SELECT ROUND(SUM(`Monthly Charges`),2) AS revenue_at_risk
FROM customers
WHERE `Churn Label`='Yes';

-- Top 5 Highest Churn Segments
SELECT Contract,
       `Internet Service`,
       ROUND(
       100.0 *
       SUM(CASE WHEN `Churn Label`='Yes' THEN 1 ELSE 0 END)
       / COUNT(*),
       2
       ) AS churn_rate
FROM customers
GROUP BY Contract, `Internet Service`
ORDER BY churn_rate DESC
LIMIT 5;

-- Most Common Churn Reasons
SELECT `Churn Reason`,
       COUNT(*) AS customers
FROM customers
WHERE `Churn Reason` IS NOT NULL
GROUP BY `Churn Reason`
ORDER BY customers DESC;

-- Top 10 Cities with Highest Churn
SELECT City,
       COUNT(*) AS churned_customers
FROM customers
WHERE `Churn Label`='Yes'
GROUP BY City
ORDER BY churned_customers DESC
LIMIT 10;

-- High Value Customers Who Churned
SELECT CustomerID,
       CLTV,
       `Monthly Charges`
FROM customers
WHERE `Churn Label`='Yes'
ORDER BY CLTV DESC
LIMIT 20;

-- Customers Paying Above Average Charges
SELECT CustomerID,
       `Monthly Charges`
FROM customers
WHERE `Monthly Charges` >
(
SELECT AVG(`Monthly Charges`)
FROM customers
);

-- Top 10 Customers by Monthly Charges
SELECT CustomerID,
       `Monthly Charges`
FROM customers
ORDER BY `Monthly Charges` DESC
LIMIT 10;