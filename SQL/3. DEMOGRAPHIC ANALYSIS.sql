-- Gender Distribution
SELECT Gender,
       COUNT(*) AS customers
FROM customers
GROUP BY Gender;

-- Churn by Gender
SELECT Gender,
       COUNT(*) AS customers,
       SUM(CASE WHEN `Churn Label`='Yes' THEN 1 ELSE 0 END) AS churned
FROM customers
GROUP BY Gender;

-- Senior Citizen Distribution
SELECT `Senior Citizen`,
       COUNT(*) AS customers
FROM customers
GROUP BY `Senior Citizen`;

-- Churn by Senior Citizen
SELECT `Senior Citizen`,
       COUNT(*) AS customers,
       SUM(CASE WHEN `Churn Label`='Yes' THEN 1 ELSE 0 END) AS churned
FROM customers
GROUP BY `Senior Citizen`;