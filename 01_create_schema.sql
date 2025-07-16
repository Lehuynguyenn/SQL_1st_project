-- Step 1: Create the database and tables
-- File: 01_create_schema.sql

-- Create a new database for our project
-- Professional Way: Check if the database exists first

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'SupplyChainDB')
BEGIN
    CREATE DATABASE SupplyChainDB;
END
GO

-- The rest of your script stays the same
USE SupplyChainDB;
GO

-- Create the Suppliers table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName NVARCHAR(100) NOT NULL,
    Country NVARCHAR(50) NOT NULL
);
GO

-- Create the Orders table with a link to the Suppliers table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ProductID NVARCHAR(50) NOT NULL,
    SupplierID INT,
    OrderDate DATE,
    ExpectedDeliveryDate DATE,
    ActualDeliveryDate DATE,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
GO