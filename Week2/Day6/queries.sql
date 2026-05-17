
**WEEK 2- DAY 6 SQL PRACTICE**


-- Question 1

create table salary_symmetry(
    emp_id int,
    emp_name varchar(50),
    salary decimal(10,2),
    processed_date date
);

insert into salary_symmetry values
(1,'Karthik',75557.75,'2025-01-15'),
(2,'Veena',64446.40,'2025-01-16'),
(3,'Ravi',85858.90,'2025-01-17'),
(4,'Anil',70007.10,'2025-01-18'),
(5,'Suresh',60000.55,'2025-01-19');

select

concat(
upper(left(emp_name,1)),
lower(substring(emp_name,2))
) as employee_name,

replace(salary,'.','') as salary_digits,

reverse(replace(salary,'.','')) as reversed_salary,

dayname(processed_date) as processed_day,

case
    when replace(salary,'.','') =
         reverse(replace(salary,'.',''))
    then 'Symmetric Pay'

    else 'Asymmetric'
end as symmetry_status

from salary_symmetry;



-- Question 2

create table leap_salary(
    emp_id int,
    emp_name varchar(50),
    salary decimal(10,2),
    credit_date date
);

insert into leap_salary values
(1,'Karthik',75000.75,'2024-02-29'),
(2,'Veena',65000.40,'2025-02-28'),
(3,'Ravi',85000.90,'2020-02-29'),
(4,'Anil',70000.10,'2023-02-28'),
(5,'Suresh',60000.55,'2024-02-28');

select

year(credit_date) as credit_year,

ceil(salary) as rounded_salary,

dayofyear(credit_date) as day_number,

case
    when (
        (year(credit_date)%4=0 and year(credit_date)%100!=0)
        or year(credit_date)%400=0
    )

    then 'Leap Credit'

    else 'Non-Leap Credit'
end as leap_status

from leap_salary;



-- Question 3

create table fiscal_salary(
    emp_id int,
    emp_name varchar(50),
    salary decimal(10,2),
    credit_date date
);

insert into fiscal_salary values
(1,'Karthik',75000.75,'2025-03-31'),
(2,'Veena',65000.40,'2025-04-01'),
(3,'Ravi',85000.90,'2024-03-30'),
(4,'Anil',70000.10,'2024-04-02'),
(5,'Suresh',60000.55,'2025-03-29');

select

lower(emp_name) as employee_name,

monthname(credit_date) as credit_month,

format(salary,2) as formatted_salary,

case
    when month(credit_date)=3 then 'Year End Credit'
    when month(credit_date)=4 then 'Year Start Credit'
    else 'Mid Year'
end as fiscal_status

from fiscal_salary;



-- Question 4

create table salary_sampling(
    emp_id int,
    emp_name varchar(50),
    salary decimal(10,2),
    record_date date
);

insert into salary_sampling values
(1,'Karthik',75000.75,'2025-01-01'),
(2,'Veena',65000.40,'2025-01-02'),
(3,'Ravi',85000.90,'2025-01-03'),
(4,'Anil',70000.10,'2025-01-04'),
(5,'Suresh',60000.55,'2025-01-05');

select

rand() as random_value,

round(salary) as rounded_salary,

dayname(record_date) as record_day,

left(emp_name,1) as first_character,

case
    when rand() > 0.7 then 'Sampled'
    else 'Skipped'
end as sample_status

from salary_sampling;



-- Question 5

create table salary_ascii(
    emp_id int,
    emp_name varchar(50),
    salary decimal(10,2),
    join_date date
);

insert into salary_ascii values
(1,'Karthik',75000.75,'2019-03-15'),
(2,'Veena',65000.40,'2021-06-20'),
(3,'Ravi',85000.90,'2016-01-10');

select

ascii(left(emp_name,1)) as ascii_value,

timestampdiff(year,join_date,curdate()) as years_of_service,

floor(salary) as floor_salary,

case
    when ascii(left(emp_name,1)) >
         timestampdiff(year,join_date,curdate())

    then 'Name Dominates'

    else 'Experience Dominates'
end as comparison_status

from salary_ascii;



-- Question 6

create table salary_calendar(
    emp_id int,
    emp_name varchar(50),
    salary decimal(10,2),
    credit_date date
);

insert into salary_calendar values
(1,'Karthik',75000.75,'2025-01-15'),
(2,'Veena',65000.40,'2025-02-14'),
(3,'Ravi',85000.90,'2025-03-31'),
(4,'Anil',70000.10,'2025-04-04'),
(5,'Suresh',60000.55,'2025-05-05');

select

upper(emp_name) as employee_name,

day(credit_date) as credit_day,

month(credit_date) as credit_month,

right(salary,2) as salary_digits,

abs(day(credit_date)-month(credit_date)) as difference_value,

case
    when day(credit_date)=month(credit_date)
         or right(salary,2)=month(credit_date)

    then 'Calendar Match'

    else 'Calendar Drift'
end as calendar_status

from salary_calendar;
