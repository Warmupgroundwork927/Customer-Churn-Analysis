-- Total Monthly Revenue
SELECT ROUND(SUM(`Monthly Charges`),2) AS total_revenue
FROM customers;

-- Revenue by Contract Type
SELECT Contract,
       ROUND(SUM(`Monthly Charges`),2) AS revenue
FROM customers
GROUP BY Contract
ORDER BY revenue DESC;

-- Average Monthly Charges
SELECT ROUND(AVG(`Monthly Charges`),2) AS avg_monthly_charge
FROM customers;

-- Average Monthly Charges by Churn Status
SELECT `Churn Label`,
       ROUND(AVG(`Monthly Charges`),2) AS avg_monthly_charge
FROM customers
GROUP BY `Churn Label`;