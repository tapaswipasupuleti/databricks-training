
**WEEK 2 - DAY 5 SQL PRACTICE**


-- Question 1

create table employee_login(
    emp_id int,
    emp_name varchar(50),
    login_time datetime,
    logout_time datetime
);

insert into employee_login values
(1,'Karthik','2025-01-15 09:05:00','2025-01-15 18:10:00'),
(2,'Veena','2025-01-14 10:30:00','2025-01-14 16:00:00'),
(3,'Ravi','2025-01-13 09:00:00','2025-01-13 20:00:00'),
(4,'Anil','2025-01-12 11:00:00','2025-01-12 14:00:00'),
(5,'Suresh','2025-01-11 09:15:00','2025-01-11 17:00:00');

select

concat(
upper(left(emp_name,1)),
lower(substring(emp_name,2))
) as employee_name,

dayname(login_time) as login_day,

round(
timestampdiff(minute,login_time,logout_time)/60,
2
) as working_hours,

case
    when dayname(login_time) not in ('Saturday','Sunday')
    and (timestampdiff(minute,login_time,logout_time)/60) >= 8
    then 'Good Performer'

    when dayname(login_time) not in ('Saturday','Sunday')
    and (timestampdiff(minute,login_time,logout_time)/60) < 6
    then 'Bad Performer'

    else 'Weekend Login'
end as performance_status

from employee_login;



-- Question 2

create table weekend_monitor(
    emp_id int,
    emp_name varchar(50),
    work_date date,
    login_time time,
    logout_time time
);

insert into weekend_monitor values
(1,'Ravi','2025-01-11','09:00:00','21:00:00'),
(2,'Veena','2025-01-12','10:00:00','13:00:00'),
(3,'Karthik','2025-01-10','09:00:00','18:00:00'),
(4,'Anil','2025-01-09','11:00:00','14:00:00');

select

lower(emp_name) as employee_name,

dayname(work_date) as work_day,

ceil(
time_to_sec(
timediff(logout_time,login_time)
)/3600
) as working_hours,

case
    when dayname(work_date) in ('Saturday','Sunday')
    and (
        time_to_sec(
        timediff(logout_time,login_time)
        )/3600
    ) >= 8

    then 'Weekend Overtime'

    when dayname(work_date) in ('Saturday','Sunday')
    and (
        time_to_sec(
        timediff(logout_time,login_time)
        )/3600
    ) < 4

    then 'Suspicious Login'

    else 'Normal Working Day'
end as work_status

from weekend_monitor;
