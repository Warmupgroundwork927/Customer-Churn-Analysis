-- Churn by Tech Support
SELECT `Tech Support`,
       COUNT(*) AS customers,
       SUM(CASE WHEN `Churn Label`='Yes' THEN 1 ELSE 0 END) AS churned
FROM customers
GROUP BY `Tech Support`;

-- Churn by Online Security
SELECT `Online Security`,
       COUNT(*) AS customers,
       SUM(CASE WHEN `Churn Label`='Yes' THEN 1 ELSE 0 END) AS churned
FROM customers
GROUP BY `Online Security`;

-- Churn by Streaming TV
SELECT `Streaming TV`,
       COUNT(*) AS customers,
       SUM(CASE WHEN `Churn Label`='Yes' THEN 1 ELSE 0 END) AS churned
FROM customers
GROUP BY `Streaming TV`;

-- Churn by Device Protection
SELECT `Device Protection`,
       COUNT(*) AS customers,
       SUM(CASE WHEN `Churn Label`='Yes' THEN 1 ELSE 0 END) AS churned
FROM customers
GROUP BY `Device Protection`;
