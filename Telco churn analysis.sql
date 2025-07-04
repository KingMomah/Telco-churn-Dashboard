-- Select basic customer and billing information from the original table
SELECT customerID, MonthlyCharges, TotalCharges FROM telco;

-- Create a duplicate of the original table for analysis purposes
CREATE TABLE telco2 LIKE telco;

-- Populate the duplicated table with all the data from the original
INSERT INTO telco2
SELECT * FROM telco;

-- View contents of the newly created table
SELECT * FROM telco2;

-- Add a new column to hold calculated Total Charges based on Monthly Charges × Tenure
ALTER TABLE telco2
ADD COLUMN `OGtotalcharges` INT;

-- Verify new column was added
SELECT * FROM telco2;

-- Populate the new column with rounded values of calculated total charges
UPDATE telco2 AS t1
SET t1.OGtotalcharges = ROUND(t1.MonthlyCharges * t1.tenure, 2);

-- Confirm updated values
SELECT * FROM telco2;

-- Modify column type to store decimal values properly
ALTER TABLE telco2
MODIFY COLUMN `OGtotalcharges` DOUBLE;

-- Compare original and calculated total charges for churned customers
SELECT customerID, TotalCharges, OGtotalcharges, churn FROM telco2 WHERE Churn = "Yes";

-- Compare original and calculated total charges for retained customers
SELECT customerID, TotalCharges, OGtotalcharges, churn FROM telco2 WHERE Churn = "No";

-- Calculate percentage of churned customers who appear to be overcharged
SELECT (
    SELECT COUNT(*) 
    FROM telco2 
    WHERE churn = "Yes" AND TotalCharges > OGtotalcharges
) / COUNT(*) 
FROM telco2
WHERE churn = "Yes";

-- Total number of churned customers
SELECT COUNT(*) FROM telco2 WHERE churn = "Yes";

-- Churned customers who were overcharged
SELECT COUNT(*) 
FROM telco2 
WHERE churn = "Yes" AND TotalCharges > OGtotalcharges;

-- Churned customers who are senior citizens
SELECT COUNT(*) 
FROM telco2 
WHERE churn = "Yes" AND SeniorCitizen = 1;

-- Churned customers who are both overcharged and senior citizens
SELECT COUNT(*) 
FROM telco2 
WHERE churn = "Yes" AND TotalCharges > OGtotalcharges AND SeniorCitizen = 1;

-- Churned customers who are not senior citizens
SELECT COUNT(*) 
FROM telco2 
WHERE churn = "Yes" AND SeniorCitizen = 0;

-- Churned customers who are not senior citizens but overcharged
SELECT COUNT(*) 
FROM telco2 
WHERE churn = "Yes" AND TotalCharges > OGtotalcharges AND SeniorCitizen = 0;

-- Churned customers who do not use phone services and were overcharged
SELECT COUNT(*) 
FROM telco2 
WHERE churn = "Yes" AND PhoneService = "No" AND TotalCharges > OGtotalcharges;

-- Churn count by contract type
SELECT Contract, COUNT(*) 
FROM telco2 
WHERE churn = "Yes" 
GROUP BY Contract;

-- Churn count by payment method
SELECT PaymentMethod, COUNT(*) 
FROM telco2 
WHERE churn = "Yes" 
GROUP BY PaymentMethod;

-- Churn count by paperless billing
SELECT PaperlessBilling, COUNT(*) 
FROM telco2 
WHERE churn = "Yes" 
GROUP BY PaperlessBilling;

-- Paperless billing churners who were undercharged
SELECT PaperlessBilling, COUNT(*) 
FROM telco2 
WHERE churn = "Yes" AND TotalCharges < OGtotalcharges 
GROUP BY PaperlessBilling;

-- Paperless billing churners (non-seniors) who were overcharged
SELECT PaperlessBilling, COUNT(*) 
FROM telco2 
WHERE churn = "Yes" AND TotalCharges > OGtotalcharges AND SeniorCitizen = 0 
GROUP BY PaperlessBilling;

-- Churn count grouped by both paperless billing and contract type
SELECT PaperlessBilling, Contract, COUNT(*) 
FROM telco2 
WHERE churn = "Yes" 
GROUP BY PaperlessBilling, Contract;

-- Overcharged churners grouped by paperless billing and contract type
SELECT PaperlessBilling, Contract, COUNT(*) 
FROM telco2 
WHERE churn = "Yes" AND TotalCharges > OGtotalcharges 
GROUP BY PaperlessBilling, Contract;

-- Senior citizens with dependents who churned
SELECT COUNT(*) 
FROM telco2 
WHERE churn = "Yes" AND Dependents = "Yes" AND SeniorCitizen = 1;

-- Non-senior citizens with dependents who churned
SELECT COUNT(*) 
FROM telco2 
WHERE churn = "Yes" AND Dependents = "Yes" AND SeniorCitizen = 0;

-- Churn count grouped by tenure buckets
SELECT 
    CASE
        WHEN tenure <= 12 THEN "0 - 12"
        WHEN tenure > 12 AND tenure <= 24 THEN "13 - 24"
        WHEN tenure > 24 AND tenure <= 36 THEN "25 - 36"
        WHEN tenure > 36 AND tenure <= 48 THEN "37 - 48"
        WHEN tenure > 48 AND tenure <= 72 THEN "49 - 72"
    END AS tenure_group, 
    COUNT(*) 
FROM telco2 
WHERE churn = "Yes" 
GROUP BY tenure_group;

-- Churn count grouped by internet service type
SELECT InternetService, COUNT(*) 
FROM telco2 
WHERE churn = "Yes" 
GROUP BY InternetService;
