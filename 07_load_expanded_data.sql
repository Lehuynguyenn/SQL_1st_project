-- Step 7: Load new and updated data
-- File: 07_load_expanded_data.sql

USE SupplyChainDB;
GO

-- 1. Insert data into our new Products table
INSERT INTO Products (ProductID, ProductName, ProductCategory, UnitCost) VALUES
('A-001', 'Microcontroller Unit', 'Electronics', 25.50),
('B-002', 'Casing - Type B', 'Mechanical', 15.00),
('C-003', 'Power Supply 12V', 'Electronics', 40.75),
('D-004', 'Mounting Bracket', 'Mechanical', 5.25);
GO

-- 2. Update the existing Orders table to add quantities for past orders
UPDATE Orders SET Quantity = 100 WHERE OrderID = 1;
UPDATE Orders SET Quantity = 250 WHERE OrderID = 2;
UPDATE Orders SET Quantity = 50  WHERE OrderID = 3;
UPDATE Orders SET Quantity = 150 WHERE OrderID = 4;
UPDATE Orders SET Quantity = 500 WHERE OrderID = 5;
UPDATE Orders SET Quantity = 75  WHERE OrderID = 6;
GO

-- 3. Insert data into the new QualityChecks table
-- Notice that Global Components (Supplier 102) has more failures
INSERT INTO QualityChecks (OrderID, CheckDate, Status, ReasonForFailure) VALUES
(1, '2023-10-15', 'Pass', NULL),
(2, '2023-10-24', 'Fail', 'Incorrect dimensions on 15 units'),
(3, '2023-10-19', 'Pass', NULL),
(4, '2023-11-18', 'Pass', NULL),
(5, '2023-11-25', 'Fail', 'Scratches on casing for 40 units'),
(6, '2023-11-24', 'Fail', 'Voltage fluctuation on 5 units');
GO