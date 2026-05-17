
**WEEK 2 - DAY 4 SQL PRACTICE**


-- Question 1

create table salary_time_drift(
    emp_id int,
    emp_name varchar(50),
    salary decimal(10,2),
    credit_ts datetime
);

insert into salary_time_drift values
(1,'Karthik',75000.75,'2025-01-10 23:45:00'),
(2,'Veena',65000.40,'2025-01-10 09:15:00'),
(3,'Ravi',85000.90,'2025-01-11 00:10:00'),
(4,'Anil',70000.10,'2025-01-09 18:30:00'),
(5,'Suresh',60000.55,'2025-01-10 02:50:00');

select

lower(emp_name) as employee_name,

hour(credit_ts) as credit_hour,

floor(salary) as floor_salary,

abs(floor(salary) - hour(credit_ts)) as difference_value,

case
    when hour(credit_ts) between 0 and 3 then 'Midnight Drift'
    when hour(credit_ts) > 18 then 'After Hours'
    else 'Business Hours'
end as salary_status

from salary_time_drift;



-- Question 2

create table salary_precision(
    emp_id int,
    emp_name varchar(50),
    salary decimal(10,4),
    record_date date
);

insert into salary_precision values
(1,'Karthik',75000.7567,'2025-01-01'),
(2,'Veena',65000.4044,'2025-01-02'),
(3,'Ravi',85000.9099,'2025-01-03'),
(4,'Anil',70000.1001,'2025-01-04'),
(5,'Suresh',60000.5555,'2025-01-05');

select

truncate(salary,2) as truncated_salary,

round(salary,2) - truncate(salary,2) as precision_difference,

dayname(record_date) as record_day,

length(emp_name) as name_length,

case
    when (round(salary,2) - truncate(salary,2)) > 0.01
    then 'Precision Loss'

    else 'Safe'
end as precision_status

from salary_precision;



-- Question 3

create table salary_growth(
    emp_id int,
    emp_name varchar(50),
    base_salary decimal(10,2),
    growth_rate decimal(5,2),
    last_hike date
);

insert into salary_growth values
(1,'Karthik',75000.75,1.08,'2019-01-01'),
(2,'Veena',65000.40,1.05,'2021-01-01'),
(3,'Ravi',85000.90,1.12,'2017-01-01');

select

upper(emp_name) as employee_name,

timestampdiff(year,last_hike,curdate()) as years_since_hike,

power(growth_rate,
timestampdiff(year,last_hike,curdate())) as growth_power,

round(
base_salary *
power(growth_rate,
timestampdiff(year,last_hike,curdate()))
) as projected_salary,

case
    when (
        base_salary *
        power(growth_rate,
        timestampdiff(year,last_hike,curdate()))
    ) > 150000

    then 'Explosive Growth'

    else 'Controlled'
end as growth_status

from salary_growth;
