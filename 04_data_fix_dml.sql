-- Step 4: Fix the data quality issue using a DML statement
-- File: 04_data_fix_dml.sql

USE SupplyChainDB;
GO

UPDATE Suppliers
SET SupplierName = 'ACME Corporation'
WHERE SupplierName = 'ACME Corp';
GO

-- After running this, re-run the query from step 3 to show the customer the corrected results.