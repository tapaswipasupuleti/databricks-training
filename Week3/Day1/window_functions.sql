
**WEEK3 DAY 1 - WINDOW FUNCTIONS PRACTICE**


create table employees(
    emp_id int,
    emp_name varchar(50),
    department varchar(50),
    salary int,
    join_date date
);

insert into employees values
(1,'Amit','Chennai',2000,'2023-01-01'),
(2,'Ravi','Hyderabad',1500,'2023-01-02'),
(3,'Sneha','Chennai',3000,'2023-01-03'),
(4,'Kiran','Bangalore',2500,'2023-01-04'),
(5,'Priya','Chennai',2000,'2023-01-05');



-- ROW_NUMBER() QUESTIONS


-- Q1
-- Assign row number based on highest salary

select
emp_name,
salary,
row_number() over(order by salary desc) as row_num
from employees;



-- Q2
-- Assign row number within department based on salary

select
emp_name,
department,
salary,

row_number() over(
partition by department
order by salary desc
) as row_num

from employees;



-- Q3
-- Assign row number based on latest joining date

select
emp_name,
join_date,

row_number() over(
order by join_date desc
) as row_num

from employees;



-- Q4
-- Assign row number within department based on earliest joining date

select
emp_name,
department,
join_date,

row_number() over(
partition by department
order by join_date
) as row_num

from employees;



-- Q5
-- Assign row number based on lowest salary

select
emp_name,
salary,

row_number() over(
order by salary
) as row_num

from employees;



-- Q6
-- Assign row number alphabetically within department

select
emp_name,
department,

row_number() over(
partition by department
order by emp_name
) as row_num

from employees;




-- RANK() QUESTIONS


-- Q7
-- Rank employees based on highest salary

select
emp_name,
salary,

rank() over(
order by salary desc
) as employee_rank

from employees;



-- Q8
-- Rank employees within department based on salary

select
emp_name,
department,
salary,

rank() over(
partition by department
order by salary desc
) as employee_rank

from employees;



-- Q9
-- Rank employees based on latest joining date

select
emp_name,
join_date,

rank() over(
order by join_date desc
) as joining_rank

from employees;



-- Q10
-- Rank employees based on alphabetical order

select
emp_name,

rank() over(
order by emp_name
) as name_rank

from employees;




-- DENSE_RANK() QUESTIONS


-- Q11
-- Dense rank employees based on highest salary

select
emp_name,
salary,

dense_rank() over(
order by salary desc
) as dense_salary_rank

from employees;



-- Q12
-- Dense rank within department based on salary

select
emp_name,
department,
salary,

dense_rank() over(
partition by department
order by salary desc
) as dense_department_rank

from employees;



-- Q13
-- Dense rank based on joining date

select
emp_name,
join_date,

dense_rank() over(
order by join_date desc
) as dense_join_rank

from employees;



-- Q14
-- Dense rank based on lowest salary

select
emp_name,
salary,

dense_rank() over(
order by salary
) as low_salary_rank

from employees;
