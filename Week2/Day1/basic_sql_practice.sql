

-- Question 1

create table employee_payments(
    emp_id int primary key,
    emp_name varchar(50),
    department varchar(30),
    base_salary decimal(10,2),
    bonus decimal(10,2),
    joining_date date
);

insert into employee_payments values
(1,'karthik','Data',75000.75,5000.50,'2019-03-15'),
(2,'veena','HR',65000.40,4000.25,'2021-06-20'),
(3,'ravi','Data',85000.90,6000.75,'2016-01-10'),
(4,'anil','Finance',70000.10,null,'2020-09-01'),
(5,'suresh','HR',60000.55,3000.30,'2022-11-25');

select
emp_name,
upper(emp_name) as upper_name,
lower(emp_name) as lower_name,
round(base_salary + ifnull(bonus,0)) as total_income,
year(joining_date) as joining_year,

case
    when timestampdiff(year,joining_date,curdate()) > 7 then 'Senior'
    when timestampdiff(year,joining_date,curdate()) between 4 and 7 then 'Mid'
    else 'Junior'
end as employee_level

from employee_payments;



-- Question 2

create table orders_delivery(
    order_id int,
    customer_name varchar(50),
    order_date date,
    delivery_date date,
    order_amount decimal(10,2)
);

insert into orders_delivery values
(101,'rajesh','2025-01-01','2025-01-05',12500.75),
(102,'meena','2025-01-10','2025-01-10',8400.40),
(103,'arun','2025-01-15','2025-01-20',15600.90),
(104,'pooja','2025-01-18',null,9200.10);

select
upper(customer_name) as customer_name,

datediff(
    ifnull(delivery_date,curdate()),
    order_date
) as delivery_days,

truncate(order_amount,1) as order_amount,

case
    when delivery_date is null then 'Pending'
    when datediff(delivery_date,order_date)=0 then 'Same Day'
    when datediff(delivery_date,order_date)>3 then 'Delayed'
    else 'Normal'
end as delivery_status

from orders_delivery;



-- Question 3

create table customer_spending(
    cust_id int,
    cust_name varchar(50),
    city varchar(30),
    purchase_amount decimal(10,2),
    purchase_date date
);

insert into customer_spending values
(1,'amit','mumbai',12000.75,'2024-12-01'),
(2,'neha','delhi',8500.40,'2024-12-15'),
(3,'rohit','mumbai',15500.90,'2024-11-20'),
(4,'kavya','chennai',6000.10,'2024-10-05');

select

concat(
upper(left(cust_name,1)),
lower(substring(cust_name,2))
) as customer_name,

monthname(purchase_date) as purchase_month,

round(purchase_amount) as rounded_amount,

abs(purchase_amount) as absolute_amount,

case
    when purchase_amount > 15000 then 'High Spender'
    when purchase_amount between 8000 and 15000 then 'Medium Spender'
    else 'Low Spender'
end as spending_type

from customer_spending;



-- Question 4

create table subscriptions(
    user_id int,
    user_email varchar(100),
    start_date date,
    end_date date,
    subscription_fee decimal(10,2)
);

insert into subscriptions values
(1,'karthik@gmail.com','2024-01-01','2025-01-01',12000.50),
(2,'veena@yahoo.com','2024-06-15','2024-12-15',8500.75),
(3,'ravi@hotmail.com','2023-03-01','2024-03-01',15000.90);

select

substring_index(user_email,'@',-1) as email_domain,

timestampdiff(month,start_date,end_date) as duration_months,

format(subscription_fee,2) as fee,

datediff(end_date,curdate()) as remaining_days,

case
    when end_date > curdate() then 'Active'
    when datediff(end_date,curdate()) <= 30 then 'Expiring Soon'
    else 'Expired'
end as subscription_status

from subscriptions;



-- Question 5

create table attendance(
    emp_id int,
    emp_name varchar(50),
    total_days int,
    present_days int,
    record_date date
);

insert into attendance values
(1,'karthik',30,28,'2025-01-31'),
(2,'veena',30,22,'2025-01-31'),
(3,'ravi',30,18,'2025-01-31');

select

lower(emp_name) as employee_name,

round((present_days/total_days)*100) as attendance_percentage,

monthname(record_date) as month_name,

(total_days-present_days) as absent_days,

case
    when ((present_days/total_days)*100) >= 90 then 'Excellent'
    when ((present_days/total_days)*100) between 75 and 89 then 'Average'
    else 'Poor'
end as attendance_status

from attendance;
