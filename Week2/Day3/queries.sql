** WEEK 2- DAY 3 SQL PRACTICE**


-- Question 1

create table salary_audit(
    emp_id int,
    emp_name varchar(50),
    salary decimal(10,2),
    tax_percent decimal(5,2),
    last_revision date
);

insert into salary_audit values
(1,'karthik',75000.75,10.5,'2022-01-15'),
(2,'veena',65000.40,18.0,'2023-06-01'),
(3,'ravi',85000.90,25.0,'2020-11-20');

select

lower(emp_name) as employee_name,

round(
salary - (salary * tax_percent/100)
) as net_salary,

year(last_revision) as revision_year,

timestampdiff(month,last_revision,curdate()) as months_since_revision,

case
    when tax_percent > 20
    and timestampdiff(month,last_revision,curdate()) > 24
    then 'Tax Shock'

    when tax_percent between 15 and 20
    then 'Review Needed'

    else 'Stable'
end as audit_status

from salary_audit;



-- Question 2

create table bonus_monitor(
    emp_code int,
    emp_name varchar(50),
    base_salary decimal(10,2),
    bonus decimal(10,2),
    bonus_date date
);

insert into bonus_monitor values
(101,'Anil',70000.10,30000.00,'2025-01-10'),
(102,'Suresh',60000.55,3000.30,'2024-03-15'),
(103,'Ravi',85000.90,15000.75,'2023-12-01');

select

concat(
upper(left(emp_name,1)),
lower(substring(emp_name,2))
) as employee_name,

round((bonus/base_salary)*100,2) as bonus_percentage,

dayname(bonus_date) as bonus_day,

abs(base_salary - bonus) as salary_bonus_difference,

case
    when ((bonus/base_salary)*100) > 30
    and dayname(bonus_date) in ('Saturday','Sunday')
    then 'Suspicious'

    when ((bonus/base_salary)*100) <= 20
    then 'Normal'

    else 'Audit'
end as bonus_status

from bonus_monitor;



-- Question 3

create table employee_experience(
    emp_id int,
    emp_name varchar(50),
    joining_date date,
    declared_experience int,
    salary decimal(10,2)
);

insert into employee_experience values
(1,'Veena','2018-07-01',4,65000.40),
(2,'Ravi','2014-01-10',12,85000.90),
(3,'Anil','2020-09-01',3,70000.10);

select

upper(emp_name) as employee_name,

timestampdiff(year,joining_date,curdate()) as actual_experience,

abs(
declared_experience -
timestampdiff(year,joining_date,curdate())
) as experience_difference,

floor(salary) as floor_salary,

case
    when declared_experience >
    timestampdiff(year,joining_date,curdate())
    then 'Overstated'

    when declared_experience <
    timestampdiff(year,joining_date,curdate())
    then 'Understated'

    else 'Matched'
end as experience_status

from employee_experience;



-- Question 4

create table salary_integrity(
    emp_id int,
    emp_name varchar(50),
    salary decimal(10,2),
    record_date date
);

insert into salary_integrity values
(1,'Anil',-70000.10,'2025-01-10'),
(2,'Veena',65000.40,'2025-01-10'),
(3,'Ravi',0.00,'2025-01-10');

select

upper(emp_name) as employee_name,

year(record_date) as record_year,

sign(salary) as salary_sign,

abs(salary) as absolute_salary,

case
    when salary < 0 then 'Negative Error'
    when salary = 0 then 'Zero Salary'
    else 'Valid'
end as salary_status

from salary_integrity;



-- Question 5

create table salary_credit_audit(
    emp_id int,
    emp_name varchar(50),
    salary decimal(10,2),
    credit_date date,
    bank_code varchar(10)
);

insert into salary_credit_audit values
(1,'Karthik',75000.75,'2025-01-04','HDFC01'),
(2,'Veena',65000.40,'2025-01-06','ICIC02'),
(3,'Ravi',85000.90,'2025-01-05','SBIN03'),
(4,'Anil',70000.10,'2025-01-07','AXIS04'),
(5,'Suresh',60000.55,'2025-01-11','HDFC01');

select

substring(bank_code,1,4) as bank_prefix,

dayname(credit_date) as credit_day,

round(salary) as rounded_salary,

mod(round(salary),5) as salary_mod,

case
    when dayname(credit_date) in ('Saturday','Sunday')
    and mod(round(salary),5)=0
    then 'Weekend Fraud'

    when substring(bank_code,1,4)='HDFC'
    then 'Bank Review'

    else 'Normal'
end as audit_result

from salary_credit_audit;
