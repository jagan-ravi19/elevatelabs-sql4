use ecommercedb;

-- Total number of products
SELECT COUNT(*) AS TotalProducts
FROM Product;

-- Total sales amount from all orders
SELECT SUM(TotalAmount) AS TotalSales
FROM `Order`;

-- Average product price
SELECT AVG(Price) AS AveragePrice
FROM Product;

-- Maximum and minimum product price
SELECT MAX(Price) AS HighestPrice,
       MIN(Price) AS LowestPrice
FROM Product;

-- Total stock of all products
SELECT SUM(Stock) AS TotalStock
FROM Product;

-- Total number of products per category
SELECT c.Name AS CategoryName, COUNT(p.ProductID) AS ProductCount
FROM Product p
JOIN Category c ON p.CategoryID = c.CategoryID
GROUP BY c.Name;

-- Total stock per category
SELECT c.Name AS CategoryName, SUM(p.Stock) AS TotalStock
FROM Product p
JOIN Category c ON p.CategoryID = c.CategoryID
GROUP BY c.Name;

-- Total order amount per customer
SELECT cu.Name AS CustomerName, SUM(o.TotalAmount) AS TotalSpent
FROM `Order` o
JOIN Customer cu ON o.CustomerID = cu.CustomerID
GROUP BY cu.Name;

-- Total quantity sold per product
SELECT p.Name AS ProductName, SUM(oi.Quantity) AS TotalSold
FROM OrderItem oi
JOIN Product p ON oi.ProductID = p.ProductID
GROUP BY p.Name;

-- Categories with more than 1 product
SELECT c.Name AS CategoryName, COUNT(p.ProductID) AS ProductCount
FROM Product p
JOIN Category c ON p.CategoryID = c.CategoryID
GROUP BY c.Name
HAVING COUNT(p.ProductID) > 1;

-- Customers who spent more than 20,000 in total
SELECT cu.Name AS CustomerName, SUM(o.TotalAmount) AS TotalSpent
FROM `Order` o
JOIN Customer cu ON o.CustomerID = cu.CustomerID
GROUP BY cu.Name
HAVING SUM(o.TotalAmount) > 20000;

-- Products that sold more than 1 unit
SELECT p.Name AS ProductName, SUM(oi.Quantity) AS TotalSold
FROM OrderItem oi
JOIN Product p ON oi.ProductID = p.ProductID
GROUP BY p.Name
HAVING SUM(oi.Quantity) > 1;
