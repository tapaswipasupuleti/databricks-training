
**WEEK 1 - DAY 2 SQL PRACTICE**


-- Question 1

create table loan_details(
    loan_id int,
    customer_name varchar(50),
    loan_amount decimal(12,2),
    interest_rate decimal(5,2),
    loan_start date
);

insert into loan_details values
(201,'suresh',500000.75,8.5,'2022-01-10'),
(202,'mahesh',750000.40,9.2,'2021-05-20'),
(203,'anita',300000.90,7.8,'2023-07-01');

select

upper(customer_name) as customer_name,

round(
(loan_amount * power((1 + interest_rate/100),1))/12
) as emi,

timestampdiff(year,loan_start,curdate()) as years_since_loan,

case
    when interest_rate > 9 then 'High Risk'
    when interest_rate between 8 and 9 then 'Medium Risk'
    else 'Low Risk'
end as risk_category

from loan_details;



-- Question 2

create table product_sales(
    product_id int,
    product_name varchar(50),
    mrp decimal(10,2),
    selling_price decimal(10,2),
    sale_date date
);

insert into product_sales values
(1,'Laptop',75000.75,68000.50,'2025-01-10'),
(2,'Mobile',35000.40,33000.25,'2025-01-12'),
(3,'Tablet',25000.90,26000.75,'2025-01-15');

select

concat(
upper(left(product_name,1)),
lower(substring(product_name,2))
) as product_name,

abs(mrp - selling_price) as discount_amount,

round(((mrp-selling_price)/mrp)*100,2) as discount_percentage,

dayname(sale_date) as sale_day,

case
    when selling_price < mrp then 'Valid Discount'
    when selling_price > mrp then 'Overpriced'
    else 'No Discount'
end as discount_status

from product_sales;



-- Question 3

create table insurance_policies(
    policy_id int,
    holder_name varchar(50),
    premium_amount decimal(10,2),
    policy_start date,
    policy_end date
);

insert into insurance_policies values
(301,'arjun',12000.50,'2023-01-01','2026-01-01'),
(302,'megha',8500.75,'2022-06-15','2025-06-15'),
(303,'vinod',15000.90,'2021-03-01','2024-03-01');

select

upper(holder_name) as holder_name,

timestampdiff(year,policy_start,policy_end) as policy_duration,

datediff(policy_end,curdate()) as remaining_days,

round(premium_amount) as rounded_premium,

case
    when timestampdiff(year,policy_start,policy_end) >= 3 then 'Long Term'
    when timestampdiff(year,policy_start,policy_end) = 2 then 'Mid Term'
    else 'Expired'
end as policy_status

from insurance_policies;



-- Question 4

create table salary_revision(
    emp_id int,
    emp_name varchar(50),
    current_salary decimal(10,2),
    rating int,
    last_hike date
);

insert into salary_revision values
(1,'karthik',75000.75,5,'2023-01-01'),
(2,'veena',65000.40,4,'2024-01-01'),
(3,'ravi',85000.90,3,'2022-01-01');

select

lower(emp_name) as employee_name,

timestampdiff(year,last_hike,curdate()) as years_since_hike,

case
    when rating = 5 then current_salary * 0.20
    when rating = 4 then current_salary * 0.10
    else 0
end as increment_amount,

round(
current_salary +

case
    when rating = 5 then current_salary * 0.20
    when rating = 4 then current_salary * 0.10
    else 0
end
) as new_salary,

case
    when rating = 5 then 'High Increment'
    when rating = 4 then 'Moderate'
    else 'No Increment'
end as increment_status

from salary_revision;



-- Question 5

create table bank_accounts(
    account_id int,
    customer_name varchar(50),
    balance decimal(12,2),
    last_transaction date,
    branch varchar(30)
);

insert into bank_accounts values
(501,'ramesh',125000.75,'2024-12-20','hyderabad'),
(502,'sita',8500.40,'2023-06-15','delhi'),
(503,'manoj',-2500.90,'2025-01-05','mumbai');

select

customer_name,

abs(balance) as absolute_balance,

datediff(curdate(),last_transaction) as inactive_days,

concat(
upper(left(branch,1)),
lower(substring(branch,2))
) as branch_name,

sign(balance) as balance_sign,

case
    when balance < 0 then 'Overdrawn'
    when datediff(curdate(),last_transaction) > 365 then 'Dormant'
    else 'Active'
end as account_status

from bank_accounts;
