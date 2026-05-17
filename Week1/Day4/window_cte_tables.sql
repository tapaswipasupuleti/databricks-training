-- Create Employees Table

CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);

INSERT INTO employees VALUES
(1, 'Alice Johnson', 'Sales', 70000, '2020-01-15'),
(2, 'Bob Smith', 'Sales', 65000, '2021-03-20'),
(3, 'Charlie Brown', 'IT', 90000, '2019-07-01'),
(4, 'Diana Prince', 'IT', 95000, '2018-11-11');


-- Create Orders Table

CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    employee_id INT,
    order_date DATE,
    total_amount INT
);

INSERT INTO orders VALUES
(101, 1, 1, '2024-01-10', 500),
(102, 2, 2, '2024-01-11', 700),
(103, 1, 1, '2024-01-15', 1200),
(104, 3, 3, '2024-01-18', 300);
