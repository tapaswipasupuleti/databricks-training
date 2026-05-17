
**WEEK 2 DAY 7 - REGEX PRACTICE**


create table regex_practice(
    id int,
    full_text varchar(200),
    email varchar(100),
    phone varchar(30),
    mixed_value varchar(100)
);

insert into regex_practice values
(1,'EMP001_IN_91','karthik@gmail.com','+91-9876543210','abc123xyz'),
(2,'EMP002_US_01','rahul@yahoo.com','+1-7654321098','test45done'),
(3,'EMP003_UK_44','john@outlook.com','+44-9988776655','run9fast'),
(4,'EMP004_AU_61','steve@gmail.com','+61-8899776655','go88home'),
(5,'EMP005_IN_91','arjun@company.in','+91-7788996655','data77lake');



-- Q1
-- Extract numeric characters from beginning of mixed_value

select
mixed_value,
regexp_substr(mixed_value,'^[0-9]+') as starting_numbers
from regex_practice;



-- Q2
-- Extract numeric characters from end of mixed_value

select
mixed_value,
regexp_substr(mixed_value,'[0-9]+$') as ending_numbers
from regex_practice;



-- Q3
-- Extract first single character from mixed_value

select
mixed_value,
regexp_substr(mixed_value,'^.') as first_character
from regex_practice;



-- Q4
-- Extract last single character from mixed_value

select
mixed_value,
regexp_substr(mixed_value,'.$') as last_character
from regex_practice;



-- Q5
-- Extract exactly two consecutive digits

select
mixed_value,
regexp_substr(mixed_value,'[0-9]{2}') as two_digits
from regex_practice;



-- Q6
-- Extract exactly one numeric character

select
mixed_value,
regexp_substr(mixed_value,'[0-9]') as single_digit
from regex_practice;



-- Q7
-- Extract country code from phone number

select
phone,
regexp_substr(phone,'[0-9]+') as country_code
from regex_practice;



-- Q8
-- Extract numeric portion between alphabets

select
mixed_value,
regexp_substr(mixed_value,'[0-9]+') as middle_numbers
from regex_practice;



-- Q9
-- Extract text before @ symbol

select
email,
regexp_substr(email,'^[^@]+') as username
from regex_practice;



-- Q10
-- Extract text after @ symbol

select
email,
regexp_substr(email,'@(.+)') as domain_text
from regex_practice;



-- Q11
-- Extract domain name only

select
email,
regexp_substr(email,'[^@]+$') as domain_name
from regex_practice;



-- Q12
-- Extract extension after last dot

select
email,
regexp_substr(email,'[^.]+$') as extension_name
from regex_practice;



-- Q13
-- Extract alphabetic sequence from mixed_value

select
mixed_value,
regexp_substr(mixed_value,'[A-Za-z]+') as alphabet_text
from regex_practice;



-- Q14
-- Extract numeric sequence from mixed_value

select
mixed_value,
regexp_substr(mixed_value,'[0-9]+') as number_text
from regex_practice;



-- Q15
-- Extract first three characters from full_text

select
full_text,
regexp_substr(full_text,'^...') as first_three_characters
from regex_practice;



-- Q16
-- Extract last two characters from full_text

select
full_text,
regexp_substr(full_text,'..$') as last_two_characters
from regex_practice;



-- Q17
-- Extract employee number between text and underscore

select
full_text,
regexp_substr(full_text,'[0-9]+') as employee_number
from regex_practice;



-- Q18
-- Extract country code from end of full_text

select
full_text,
regexp_substr(full_text,'[0-9]+$') as country_code
from regex_practice;



-- Q19
-- Extract alphabetic text between underscores

select
full_text,
regexp_substr(full_text,'_[A-Za-z]+_') as middle_text
from regex_practice;



-- Q20
-- Extract country code after plus symbol in phone number

select
phone,
regexp_substr(phone,'(?<=\\+)[0-9]+') as plus_country_code
from regex_practice;
