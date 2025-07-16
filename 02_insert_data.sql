-- Step 2: Insert data into the tables
-- File: 02_insert_data.sql

USE SupplyChainDB;
GO

-- Insert data into the Suppliers table (with the deliberate error)
INSERT INTO Suppliers (SupplierID, SupplierName, Country) VALUES
(101, 'ACME Corp', 'Germany'),
(102, 'Global Components', 'USA'),
(103, 'Nippon Tech', 'Japan'),
(104, 'Acme Corporation', 'Germany');
GO

-- Insert data into the Orders table
INSERT INTO Orders (OrderID, ProductID, SupplierID, OrderDate, ExpectedDeliveryDate, ActualDeliveryDate) VALUES
(1, 'A-001', 101, '2023-10-01', '2023-10-15', '2023-10-14'),
(2, 'B-002', 102, '2023-10-03', '2023-10-20', '2023-10-23'),
(3, 'C-003', 103, '2023-10-05', '2023-10-18', '2023-10-18'),
(4, 'A-001', 104, '2023-11-01', '2023-11-15', '2023-11-17'),
(5, 'D-004', 102, '2023-11-05', '2023-11-25', '2023-11-24'),
(6, 'C-003', 103, '2023-11-10', '2023-11-22', '2023-11-23');
GO