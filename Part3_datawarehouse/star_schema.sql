-- Create database
CREATE DATABASE IF NOT EXISTS retail_transactions;
USE retail_transactions;

-- 🔴 FIX: Drop tables before re-creating
DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_product;
DROP TABLE IF EXISTS dim_store;
DROP TABLE IF EXISTS dim_date;

-- ===============================
-- DIMENSION TABLES
-- ===============================

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    month_name VARCHAR(20),
    quarter INT,
    year INT
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    store_city VARCHAR(100)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- ===============================
-- FACT TABLE
-- ===============================

CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_sales DECIMAL(12,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- ===============================
-- INSERT DATA
-- ===============================

INSERT INTO dim_date VALUES
(1,'2023-01-15',15,1,'January',1,2023),
(2,'2023-02-05',5,2,'February',1,2023),
(3,'2023-02-20',20,2,'February',1,2023),
(4,'2023-08-29',29,8,'August',3,2023),
(5,'2023-12-12',12,12,'December',4,2023),
(6,'2024-01-10',10,1,'January',1,2024),
(7,'2024-02-14',14,2,'February',1,2024),
(8,'2024-03-22',22,3,'March',1,2024),
(9,'2024-04-18',18,4,'April',2,2024),
(10,'2024-05-30',30,5,'May',2,2024);

INSERT INTO dim_store VALUES
(1,'Chennai Anna','Chennai'),
(2,'Delhi South','Delhi'),
(3,'Mumbai Central','Mumbai'),
(4,'Bangalore East','Bangalore'),
(5,'Hyderabad West','Hyderabad');

INSERT INTO dim_product VALUES
(1,'Laptop','Electronics'),
(2,'T-Shirt','Clothing'),
(3,'Rice Pack','Groceries'),
(4,'Headphones','Electronics'),
(5,'Jeans','Clothing'),
(6,'Wheat Flour','Groceries'),
(7,'Smartphone','Electronics'),
(8,'Jacket','Clothing'),
(9,'Cooking Oil','Groceries'),
(10,'Tablet','Electronics');

INSERT INTO fact_sales VALUES
(1,4,1,1,3,49262.78,147788.34),
(2,5,1,4,11,23226.12,255487.32),
(3,2,1,1,20,48703.39,974067.80),
(4,3,2,2,14,23226.12,325165.68),
(5,1,1,5,10,58851.01,588510.10),
(6,2,3,3,15,1200.50,18007.50),
(7,3,2,4,6,3200.00,19200.00),
(8,4,3,2,12,1500.75,18009.00),
(9,5,2,1,8,47000.00,376000.00),
(10,1,3,3,18,1150.25,20704.50);

-- Check tables
SHOW TABLES;