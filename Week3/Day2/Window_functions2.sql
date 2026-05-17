
**REMAINING WINDOW FUNCTION QUESTIONS Week3 Day2**



-- RANK() QUESTIONS


-- Q11
-- Rank employees within department based on lowest salary

select
emp_name,
department,
salary,

rank() over(
partition by department
order by salary
) as low_salary_rank

from employees;



-- Q12
-- Rank employees based on joining date

select
emp_name,
join_date,

rank() over(
order by join_date
) as join_rank

from employees;



-- Q13
-- Rank employees based on highest salary again

select
emp_name,
salary,

rank() over(
order by salary desc
) as salary_rank

from employees;



-- Q14
-- Rank employees alphabetically within department

select
emp_name,
department,

rank() over(
partition by department
order by emp_name
) as department_name_rank

from employees;




-- DENSE_RANK() QUESTIONS


-- Q15
-- Dense rank employees based on highest salary

select
emp_name,
salary,

dense_rank() over(
order by salary desc
) as dense_salary_rank

from employees;



-- Q16
-- Dense rank employees within department by salary

select
emp_name,
department,
salary,

dense_rank() over(
partition by department
order by salary desc
) as department_dense_rank

from employees;



-- Q17
-- Dense rank employees based on joining date

select
emp_name,
join_date,

dense_rank() over(
order by join_date desc
) as join_dense_rank

from employees;



-- Q18
-- Dense rank employees within department by joining date

select
emp_name,
department,
join_date,

dense_rank() over(
partition by department
order by join_date
) as department_join_rank

from employees;



-- Q19
-- Dense rank employees based on lowest salary

select
emp_name,
salary,

dense_rank() over(
order by salary
) as low_salary_dense_rank

from employees;



-- Q20
-- Dense rank employees alphabetically

select
emp_name,

dense_rank() over(
order by emp_name
) as alphabet_dense_rank

from employees;
