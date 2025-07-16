-- Step 9: Quality Failure Rate Report
-- File: 09_quality_analysis_report.sql

USE SupplyChainDB;
GO

SELECT
    s.SupplierName,
    COUNT(qc.CheckID) AS TotalOrdersChecked,
    SUM(CASE WHEN qc.Status = 'Fail' THEN 1 ELSE 0 END) AS FailedChecks,
    -- We must CAST to FLOAT to get a decimal percentage
    CAST(SUM(CASE WHEN qc.Status = 'Fail' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(qc.CheckID) * 100.0 AS FailureRate_Percent
FROM QualityChecks AS qc
JOIN Orders AS o ON qc.OrderID = o.OrderID
JOIN Suppliers AS s ON o.SupplierID = s.SupplierID
GROUP BY
    s.SupplierName
ORDER BY
    FailureRate_Percent DESC;