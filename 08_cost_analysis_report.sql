-- Step 8: Cost Analysis Report
-- File: 08_cost_analysis_report.sql

USE SupplyChainDB;
GO

SELECT
    s.SupplierName,
    s.Country,
    SUM(o.Quantity * p.UnitCost) AS TotalOrderValue
FROM Orders AS o
JOIN Suppliers AS s ON o.SupplierID = s.SupplierID
JOIN Products AS p ON o.ProductID = p.ProductID
GROUP BY
    s.SupplierName,
    s.Country
ORDER BY
    TotalOrderValue DESC;