# 📘 SQL Joins & Relationships Practical Work

## 📖 Overview
This project demonstrates the use of **INNER JOIN**, **LEFT JOIN**, **RIGHT JOIN**, and a simulated **FULL OUTER JOIN** in MySQL.  
It uses sample data from `employees`, `offices`, `products`, `productlines`, `customers`, and `orders` tables.

The queries illustrate how to:
- 🔗 Combine data across multiple tables.
- 📊 Retrieve meaningful results using different JOIN types.
- 📝 Practice relationships in relational databases.

---

## 📂 Files
- **sql_joins_assignment.sql** → Contains everything:
  - Schema creation (tables)
  - Sample data inserts
  - SQL JOIN queries with comments

---

## 🛠️ Requirements
- MySQL Database (Workbench or CLI)
- Internet connection & SQL editor

---

## ▶️ How to Run
1. Open **MySQL Workbench** or your preferred SQL editor.
2. Import and run the `sql_joins_assignment.sql` file.
3. This will:
   - Drop old tables (if they exist)
   - Recreate schema
   - Insert sample data
   - Run JOIN queries

---

## 📊 Assignment Queries

### Q1 🧑‍💼 INNER JOIN (Employees + Offices)
```sql
SELECT e.firstName, e.lastName, e.email, o.officeCode
FROM employees AS e
INNER JOIN offices AS o
    ON e.officeCode = o.officeCode;
```

### Q2 🛍️ LEFT JOIN (Products + Product Lines)
```sql
SELECT p.productName, p.productVendor, pl.productLine
FROM products AS p
LEFT JOIN productlines AS pl
    ON p.productLine = pl.productLine;
```

### Q3 📦 RIGHT JOIN (Customers + Orders)
```sql
SELECT o.orderDate, o.shippedDate, o.status, o.customerNumber
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customerNumber = o.customerNumber
LIMIT 10;
```

### Q4 🔄 FULL OUTER JOIN (Simulated with UNION)
```sql
SELECT c.customerNumber, c.customerName, o.orderNumber, o.status
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customerNumber = o.customerNumber
UNION
SELECT c.customerNumber, c.customerName, o.orderNumber, o.status
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customerNumber = o.customerNumber;
```

---

## 🎯 Learning Objectives
- Understand different JOIN types: **INNER**, **LEFT**, **RIGHT**, and **FULL OUTER JOIN** (simulated).
- Apply JOINs to retrieve and organize relational data.
- Practice SQL queries with real-world style datasets.

---
