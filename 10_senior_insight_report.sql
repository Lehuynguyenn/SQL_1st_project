-- Step 10: Combined Insight Report (Financial Impact of Failures)
-- File: 10_senior_insight_report.sql

USE SupplyChainDB;
GO

SELECT
    s.SupplierName,
    SUM(o.Quantity * p.UnitCost) AS TotalCostOfFailedGoods
FROM QualityChecks AS qc
JOIN Orders AS o ON qc.OrderID = o.OrderID
JOIN Suppliers AS s ON o.SupplierID = s.SupplierID
JOIN Products AS p ON o.ProductID = p.ProductID
WHERE
    qc.Status = 'Fail'
GROUP BY
    s.SupplierName
ORDER BY
    TotalCostOfFailedGoods DESC;