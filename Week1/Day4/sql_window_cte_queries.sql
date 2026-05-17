-- 1. ROW_NUMBER ordered by salary descending

SELECT employee_name,
       salary,
       ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees;


-- 2. RANK employees by salary

SELECT employee_name,
       salary,
       RANK() OVER(ORDER BY salary DESC) AS rank_num
FROM employees;


-- 3. DENSE_RANK employees by salary

SELECT employee_name,
       salary,
       DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank_num
FROM employees;


-- 4. Top 3 highest-paid employees

SELECT *
FROM (
    SELECT employee_name,
           salary,
           ROW_NUMBER() OVER(ORDER BY salary DESC) AS rn
    FROM employees
) t
WHERE rn <= 3;


-- 5. Rank employees within each department

SELECT employee_name,
       department,
       salary,
       RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;


-- 6. Highest salary in each department

SELECT employee_name,
       department,
       salary,
       MAX(salary) OVER(PARTITION BY department) AS highest_salary
FROM employees;


-- 7. Running total of order amounts

SELECT order_id,
       order_date,
       total_amount,
       SUM(total_amount)
       OVER(ORDER BY order_date) AS running_total
FROM orders;


-- 8. Cumulative sales amount for each employee

SELECT employee_id,
       total_amount,
       SUM(total_amount)
       OVER(PARTITION BY employee_id ORDER BY order_date) AS cumulative_sales
FROM orders;


-- 9. Previous order amount using LAG()

SELECT customer_id,
       order_date,
       total_amount,
       LAG(total_amount)
       OVER(PARTITION BY customer_id ORDER BY order_date) AS previous_order
FROM orders;


-- 10. Next order amount using LEAD()

SELECT customer_id,
       order_date,
       total_amount,
       LEAD(total_amount)
       OVER(PARTITION BY customer_id ORDER BY order_date) AS next_order
FROM orders;


-- 11. Difference between current and previous order

SELECT customer_id,
       total_amount,
       total_amount -
       LAG(total_amount)
       OVER(PARTITION BY customer_id ORDER BY order_date) AS difference_amount
FROM orders;


-- 12. Moving average of last 3 orders

SELECT order_id,
       total_amount,
       AVG(total_amount)
       OVER(
           ORDER BY order_date
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_average
FROM orders;


-- 13. NTILE(4) salary quartiles

SELECT employee_name,
       salary,
       NTILE(4)
       OVER(ORDER BY salary DESC) AS quartile
FROM employees;


-- 14. First order placed by each customer

SELECT *
FROM (
    SELECT customer_id,
           order_id,
           order_date,
           ROW_NUMBER()
           OVER(PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM orders
) t
WHERE rn = 1;


-- 15. Latest order placed by each customer

SELECT *
FROM (
    SELECT customer_id,
           order_id,
           order_date,
           ROW_NUMBER()
           OVER(PARTITION BY customer_id ORDER BY order_date DESC) AS rn
    FROM orders
) t
WHERE rn = 1;


-- 16. Employee salaries with department average

SELECT employee_name,
       department,
       salary,
       AVG(salary)
       OVER(PARTITION BY department) AS dept_avg_salary
FROM employees;


-- 17. Employees earning above department average

SELECT *
FROM (
    SELECT employee_name,
           department,
           salary,
           AVG(salary)
           OVER(PARTITION BY department) AS dept_avg
    FROM employees
) t
WHERE salary > dept_avg;


-- 18. Department payroll using SUM OVER

SELECT employee_name,
       department,
       salary,
       SUM(salary)
       OVER(PARTITION BY department) AS department_payroll
FROM employees;


-- 19. Percentage contribution of employee salary

SELECT employee_name,
       department,
       salary,
       ROUND(
           salary * 100.0 /
           SUM(salary) OVER(PARTITION BY department),
           2
       ) AS contribution_percent
FROM employees;


-- 20. Total number of employees with each row

SELECT employee_name,
       department,
       COUNT(*) OVER() AS total_employees
FROM employees;


-- 21. CTE for total sales per employee

WITH employee_sales AS (
    SELECT employee_id,
           SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
)

SELECT * FROM employee_sales;


-- 22. Employees whose sales exceed company average

WITH employee_sales AS (
    SELECT employee_id,
           SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
)

SELECT *
FROM employee_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM employee_sales
);


-- 23. Multiple CTEs for customer spending rankings

WITH customer_totals AS (
    SELECT customer_id,
           SUM(total_amount) AS total_spending
    FROM orders
    GROUP BY customer_id
),

customer_ranks AS (
    SELECT customer_id,
           total_spending,
           RANK() OVER(ORDER BY total_spending DESC) AS ranking
    FROM customer_totals
)

SELECT * FROM customer_ranks;


-- 24. Recursive CTE numbers 1 to 10

WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 10
)

SELECT * FROM numbers;


-- 25. Recursive employee hierarchy example

WITH RECURSIVE hierarchy AS (
    SELECT employee_id,
           employee_name,
           department
    FROM employees

    UNION ALL

    SELECT e.employee_id,
           e.employee_name,
           e.department
    FROM employees e
    INNER JOIN hierarchy h
    ON e.employee_id = h.employee_id
)

SELECT * FROM hierarchy;
