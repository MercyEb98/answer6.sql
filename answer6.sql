-- =========================================
-- SQL Joins & Relationships Practical Work
-- =========================================

-- Drop tables if they exist (for clean re-run)
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS productlines;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS offices;

-- =========================================
-- 1️⃣ Create Tables
-- =========================================
CREATE TABLE offices (
    officeCode INT PRIMARY KEY,
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE employees (
    employeeNumber INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(100),
    officeCode INT,
    FOREIGN KEY (officeCode) REFERENCES offices(officeCode)
);

CREATE TABLE productlines (
    productLine VARCHAR(50) PRIMARY KEY,
    description TEXT
);

CREATE TABLE products (
    productCode INT PRIMARY KEY,
    productName VARCHAR(100),
    productVendor VARCHAR(100),
    productLine VARCHAR(50),
    FOREIGN KEY (productLine) REFERENCES productlines(productLine)
);

CREATE TABLE customers (
    customerNumber INT PRIMARY KEY,
    customerName VARCHAR(100),
    contactName VARCHAR(100)
);

CREATE TABLE orders (
    orderNumber INT PRIMARY KEY,
    orderDate DATE,
    shippedDate DATE,
    status VARCHAR(50),
    customerNumber INT,
    FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
);

-- =========================================
-- 2️⃣ Insert Sample Data
-- =========================================
INSERT INTO offices VALUES
(1, 'New York', 'USA'),
(2, 'London', 'UK');

INSERT INTO employees VALUES
(101, 'John', 'Doe', 'jdoe@example.com', 1),
(102, 'Jane', 'Smith', 'jsmith@example.com', 2);

INSERT INTO productlines VALUES
('Classic Cars', 'Vintage car models'),
('Motorcycles', 'Motorcycle models');

INSERT INTO products VALUES
(201, '1969 Ford Mustang', 'AutoArt', 'Classic Cars'),
(202, 'Yamaha R1', 'Yamaha', 'Motorcycles'),
(203, 'Ducati Monster', 'Ducati', NULL);

INSERT INTO customers VALUES
(301, 'Acme Corp', 'Alice'),
(302, 'Beta Ltd', 'Bob');

INSERT INTO orders VALUES
(401, '2025-09-01', '2025-09-05', 'Shipped', 301),
(402, '2025-09-02', NULL, 'In Process', 302),
(403, '2025-09-03', NULL, 'Cancelled', NULL);

-- =========================================
-- 3️⃣ Assignment Queries
-- =========================================

-- Q1: INNER JOIN (Employees + Offices)
SELECT e.firstName, e.lastName, e.email, o.officeCode
FROM employees AS e
INNER JOIN offices AS o
    ON e.officeCode = o.officeCode;

-- Q2: LEFT JOIN (Products + Product Lines)
SELECT p.productName, p.productVendor, pl.productLine
FROM products AS p
LEFT JOIN productlines AS pl
    ON p.productLine = pl.productLine;

-- Q3: RIGHT JOIN (Customers + Orders)
SELECT o.orderDate, o.shippedDate, o.status, o.customerNumber
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customerNumber = o.customerNumber
LIMIT 10;

-- Q4: FULL OUTER JOIN (Simulated with UNION in MySQL)
SELECT c.customerNumber, c.customerName, o.orderNumber, o.status
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customerNumber = o.customerNumber
UNION
SELECT c.customerNumber, c.customerName, o.orderNumber, o.status
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customerNumber = o.customerNumber;
