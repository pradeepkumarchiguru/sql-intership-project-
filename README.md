# sql-intership-project-
sql intership project 
Project Retail Database

Retail Database Project
A structured relational database project for managing retail operations, built using SQL. This repository includes scripts for creating tables, importing CSV data, and running useful reporting queries.

Features
Structured schema: Customers, products, orders, order items, and payments tables with relationships.

CSV data import: Use LOAD DATA INFILE for fast bulk-loading from CSVs.

Sample queries: Useful SQL queries demonstrating data analysis and reporting with JOINs.

Referential integrity: Foreign key constraints to ensure data consistency.

Getting Started
Prerequisites
MySQL installed on your machine (other RDBMS may require syntax adjustments)

MySQL user with FILE privilege and local_infile enabled

CSV files:

customers.csv

products.csv

orders.csv

order_items.csv

payments.csv

Setup Instructions
Clone this repository to your local system.

Copy or prepare your CSV files in your preferred location (update file paths in the SQL if needed).

Open your MySQL client (such as MySQL Workbench, DBeaver, or CLI).

Run the provided SQL script to:

Create the project database and all necessary tables

Load data into each table from the CSV files

Execute sample queries from the script to explore the data and reports.

Table Structure
customer: Stores information about customers

product: Product catalog and stock availability

orders: Orders placed by customers

order_item: Items per order, referencing products

payments: Payment records for each order

All tables include appropriate primary keys, foreign keys, and constraints for data validation and integrity.

Example SQL Queries
All orders with customer info

sql
SELECT o.order_id, o.order_date, o.total_amount, o.order_status,
       c.first_name, c.last_name, c.email, c.phone
  FROM orders o
  JOIN customer c ON o.customer_id = c.customer_id;
Payments with order and customer details

sql
SELECT pay.payment_id, pay.payment_date, pay.amount, pay.payment_method, pay.payment_status,
       o.order_id, o.order_date, o.total_amount AS order_total_amount,
       c.first_name, c.last_name, c.email
  FROM payments pay
  JOIN orders o ON pay.order_id = o.order_id
  JOIN customer c ON o.customer_id = c.customer_id
 ORDER BY pay.payment_date DESC;
All customers and their orders (including customers with no orders)

sql
SELECT c.customer_id, c.first_name, c.last_name, c.email,
       o.order_id, o.order_date, o.total_amount, o.order_status
  FROM customer c
  LEFT JOIN orders o ON c.customer_id = o.customer_id
 ORDER BY c.customer_id, o.order_date;
All products and ordered quantities

sql
SELECT p.product_id, p.price, p.stock_quantity,
       oi.order_item_id, oi.order_id, oi.quantity AS ordered_quantity
  FROM order_item oi
  RIGHT JOIN product p ON oi.product_id = p.product_id
 ORDER BY p.product_id;
Notes
If you use a different OS or location for CSVs, update the LOAD DATA INFILE paths accordingly in the scripts.

Queries assume table and column names as defined in the schema; adapt if you modify the schema.

To load local files, make sure your MySQL server’s local_infile system variable is enabled.

License
