-- Step 5: Run the enhanced report with the new metric (Average Delivery Time)
-- File: 05_final_report.sql

USE SupplyChainDB;
GO

SELECT
    s.SupplierName,
    COUNT(o.OrderID) AS TotalOrders,
    -- Use DATEDIFF for calculating the difference in days
    AVG(DATEDIFF(day, o.OrderDate, o.ActualDeliveryDate)) AS AverageDeliveryDays
FROM
    Orders AS o
JOIN
    Suppliers AS s ON o.SupplierID = s.SupplierID
GROUP BY
    s.SupplierName
ORDER BY
    AverageDeliveryDays;