-- Step 6: Evolve the database schema for new requirements
-- File: 06_evolve_schema.sql

USE SupplyChainDB;
GO

-- 1. Create a new Products table
CREATE TABLE Products (
    ProductID NVARCHAR(50) PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    ProductCategory NVARCHAR(50),
    UnitCost DECIMAL(10, 2) -- Using DECIMAL for money is best practice
);
GO

-- 2. Add a 'Quantity' column to the existing Orders table
ALTER TABLE Orders
ADD Quantity INT;
GO

-- 3. Create a new table for Quality Control checks
CREATE TABLE QualityChecks (
    CheckID INT PRIMARY KEY IDENTITY(1,1), -- Auto-incrementing primary key
    OrderID INT NOT NULL,
    CheckDate DATE,
    Status NVARCHAR(10), -- e.g., 'Pass' or 'Fail'
    ReasonForFailure NVARCHAR(255),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
GO