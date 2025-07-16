-- Step 3: Run the initial performance report to identify issues
-- File: 03_initial_report.sql

USE SupplyChainDB;
GO

SELECT
    s.SupplierName,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(CASE WHEN o.ActualDeliveryDate <= o.ExpectedDeliveryDate THEN 1 ELSE 0 END) AS OnTimeDeliveries,
    SUM(CASE WHEN o.ActualDeliveryDate > o.ExpectedDeliveryDate THEN 1 ELSE 0 END) AS LateDeliveries
FROM
    Orders AS o
JOIN
    Suppliers AS s ON o.SupplierID = s.SupplierID
GROUP BY
    s.SupplierName
ORDER BY
    s.SupplierName;