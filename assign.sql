-- Database Creation
CREATE DATABASE Assign;
USE Assign;

-- Table Creation
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    Quantity INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Description TEXT,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- Inserting values in Category Table
INSERT INTO Category (CategoryID, CategoryName)
VALUES
(1, 'Appliances'),
(2, 'Books'),
(3, 'Clothing');

-- Inserting values in Products Table
INSERT INTO Products(ProductID, ProductName, CategoryID, Price, Quantity, FirstName, LastName, Description)
VALUES
(1, 'Refrigerator', 1, 55000.00, 5, 'Ravi', 'Kumar', 'Double-door fridge with inverter technology'),
(2, 'Washing Machine', 1, 32000.00, 3, 'Sneha', 'Verma', 'Front-load washing machine'),
(3, 'Novel', 2, 499.00, 50, 'Amit', 'Sharma', 'Bestselling fiction novel'),
(4, 'Textbook', 2, 1200.00, 30, NULL, NULL, 'Engineering mathematics textbook'),
(5, 'T-Shirt', 3, 799.00, 100, 'Priya', 'Singh', 'Cotton round-neck t-shirt'),
(6, 'Jeans', 3, 1999.00, 60, 'Rahul', 'Mehta', 'Slim-fit denim jeans'),
(7, 'Microwave Oven', 1, 15000.00, 4, 'Neha', 'Gupta', 'Convection microwave oven');

-- Get all columns and all rows from table
SELECT * FROM Products;

-- Get desired columns and all rows from table
SELECT ProductID, ProductName, Price, Description FROM Products;

-- Get all columns from table where column name is equal to xxx
SELECT * FROM Category WHERE CategoryName = 'Appliances';

-- Get all columns from table where column name between xxx and xxx
SELECT * FROM Products WHERE Price BETWEEN 8000 AND 30000;

-- Get all columns from table where column name is aaa, bbb, xxx
SELECT * FROM Category WHERE CategoryName IN ('Appliances', 'Clothing');

-- Get all rows from table where FirstName starts with 'R'
SELECT * FROM Products WHERE FirstName LIKE 'R%';

-- Get all rows from table where FirstName ends with 'a'
SELECT * FROM Products WHERE FirstName LIKE '%a';

-- Get all rows from table where FirstName starts with 'R' or 'A'
SELECT * FROM Products WHERE FirstName LIKE 'R%' OR FirstName LIKE 'A%';

-- Get all rows from table where FirstName does not start with 'R' or 'A'
SELECT * FROM Products WHERE FirstName NOT LIKE 'R%' AND FirstName NOT LIKE 'A%';

-- Get single column with a combination of FirstName and LastName
SELECT CONCAT(FirstName, ' ', LastName) AS fullName FROM Products;

-- Get all rows where FirstName is not NULL
SELECT * FROM Products WHERE FirstName IS NOT NULL;

-- Get all rows in descending order of FirstName
SELECT * FROM Products ORDER BY FirstName DESC;

-- Get all rows in ascending order of FirstName
SELECT * FROM Products ORDER BY FirstName ASC;

-- Get unique CategoryIDs from Category table
SELECT DISTINCT(CategoryID) FROM Category;

-- Get top 5 rows from Products table (for MySQL use LIMIT)
SELECT * FROM Products LIMIT 5;

-- Get maximum price from Products table
SELECT MAX(Price) AS MAX_PRICE FROM Products;

-- Get maximum computed value (Price * 2)
SELECT MAX(Price * 2) AS MAX_COMPUTED_PRICE FROM Products;

--  Get even ProductID rows
SELECT * FROM Products WHERE ProductID % 2 = 0;

-- Get odd ProductID rows
SELECT * FROM Products WHERE ProductID % 2 != 0;

-- Count total records in Products table
SELECT COUNT(*) AS totalRecords FROM Products;

-- Get average price of products
SELECT AVG(Price) AS Average_Price FROM Products;

-- Get number of products (non-null ProductName)
SELECT COUNT(ProductName) AS totalProducts FROM Products;

-- Get maximum price of product
SELECT MAX(Price) AS maxPriceProduct FROM Products;

-- Get minimum price of product
SELECT MIN(Price) AS minPriceProduct FROM Products;

-- Get total quantity of products
SELECT SUM(Quantity) AS totalQuantity FROM Products;

-- Get all FirstNames in upper case
SELECT UPPER(FirstName) AS UpperName FROM Products;

-- Get all FirstNames in lower case
SELECT LOWER(FirstName) AS LowerName FROM Products;

-- List categories with products using INNER JOIN
SELECT Category.CategoryName, Products.ProductName, Products.Price
FROM Category
INNER JOIN Products ON Category.CategoryID = Products.CategoryID;

-- List all categories with products using LEFT JOIN
SELECT Category.CategoryID, Category.CategoryName, Products.ProductID, Products.ProductName, Products.Price
FROM Category
LEFT JOIN Products ON Category.CategoryID = Products.CategoryID;

-- List all products with categories using RIGHT JOIN
SELECT Category.CategoryName, Products.ProductID, Products.ProductName, Products.Price
FROM Category
RIGHT JOIN Products ON Category.CategoryID = Products.CategoryID;

-- List all rows from both tables using FULL OUTER JOIN (for MySQL use UNION of LEFT and RIGHT JOIN)
SELECT Category.CategoryID, Category.CategoryName,
       Products.ProductID, Products.ProductName, Products.Price
FROM Category
LEFT JOIN Products ON Category.CategoryID = Products.CategoryID
UNION
SELECT Category.CategoryID, Category.CategoryName,
       Products.ProductID, Products.ProductName, Products.Price
FROM Category
RIGHT JOIN Products ON Category.CategoryID = Products.CategoryID;