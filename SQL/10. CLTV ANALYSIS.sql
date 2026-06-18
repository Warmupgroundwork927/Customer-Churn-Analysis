-- Average CLTV
SELECT ROUND(AVG(CLTV),2) AS avg_cltv
FROM customers;

-- CLTV by Churn Status
SELECT `Churn Label`,
       ROUND(AVG(CLTV),2) AS avg_cltv
FROM customers
GROUP BY `Churn Label`;

-- Top 10 High Value Customers
SELECT CustomerID,
       CLTV,
       `Monthly Charges`
FROM customers
ORDER BY CLTV DESC
LIMIT 10;
