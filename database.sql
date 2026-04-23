CREATE DATABASE withdrawals_system;
USE withdrawals_system;

CREATE TABLE branches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO branches VALUES
(1,'الدقي'),(2,'الجولف'),(3,'شيراتون');

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username_en VARCHAR(50),
    username_ar VARCHAR(50),
    password VARCHAR(255),
    role ENUM('admin','user'),
    branch_id INT
);

INSERT INTO users VALUES
(1,'admin','ادمن','123456','admin',1);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    card_number VARCHAR(50),
    name VARCHAR(100),
    credit_limit DECIMAL(10,2),
    used_amount DECIMAL(10,2) DEFAULT 0
);

CREATE TABLE withdrawals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    branch_id INT,
    user_id INT,
    amount DECIMAL(10,2),
    permission_number VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE settings (
    id INT PRIMARY KEY,
    company_name VARCHAR(255),
    phone VARCHAR(50)
);

INSERT INTO settings VALUES
(1,'المدينة المنورة','01020770073');
