# SQL Practice Queries

## Schema

### Employee Table

| emp_id | name | age | salary | department_id | hire_date |
|---|---|---|---|---|---|
| 1 | John Doe | 28 | 50000 | 1 | 2020-01-15 |
| 2 | Jane Smith | 34 | 60000 | 2 | 2019-07-23 |
| 3 | Bob Brown | 45 | 80000 | 1 | 2018-02-12 |
| 4 | Alice Blue | 25 | 45000 | 3 | 2021-03-22 |
| 5 | Charlie P. | 29 | 50000 | 2 | 2019-12-01 |

### Department Table

| department_id | name |
|---|---|
| 1 | IT |
| 2 | HR |
| 3 | Finance |
| 4 | Marketing |

### Project Table

| project_id | name | department_id |
|---|---|---|
| 1 | Project Alpha | 1 |
| 2 | Project Beta | 2 |
| 3 | Project Gamma | 1 |
| 4 | Project Delta | 3 |
| 5 | Project Epsilon | 4 |

---

# Questions

## Basic Queries (5)

1. Select all columns from the Employee table.
2. Select only the `name` and `salary` columns from the Employee table.
3. Select employees who are older than 30.
4. Select the names of all departments.
5. Select employees who work in the IT department.

---

## String Matching Queries (5)

6. Select employees whose names start with 'J'.
7. Select employees whose names end with 'e'.
8. Select employees whose names contain 'a'.
9. Select employees whose names are exactly 9 characters long.
10. Select employees whose names have 'o' as the second character.

---

## Date Queries (5)

11. Select employees hired in the year 2020.
12. Select employees hired in January of any year.
13. Select employees hired before 2019.
14. Select employees hired on or after March 1, 2021.
15. Select employees hired in the last 2 years.

---

## Aggregate Queries (5)

16. Select the total salary of all employees.
17. Select the average salary of employees.
18. Select the minimum salary in the Employee table.
19. Select the number of employees in each department.
20. Select the average salary of employees in each department.

---

## Group By Queries (5)

21. Select the total salary for each department.
22. Select the average age of employees in each department.
23. Select the number of employees hired in each year.
24. Select the highest salary in each department.
25. Select the department with the highest average salary.

---

## Having Queries (5)

26. Select departments with more than 2 employees.
27. Select departments with an average salary greater than 55000.
28. Select years with more than 1 employee hired.
29. Select departments with a total salary expense less than 100000.
30. Select departments with the maximum salary above 75000.

---

## Order By Queries (5)

31. Select all employees ordered by their salary in ascending order.
32. Select all employees ordered by their age in descending order.
33. Select all employees ordered by their hire date in ascending order.
34. Select employees ordered by their department and then by their salary.
35. Select departments ordered by the total salary of their employees.

---

## Join Queries (10)

36. Select employee names along with their department names.
37. Select project names along with the department names they belong to.
38. Select employee names and their corresponding project names.
39. Select all employees and their departments, including those without a department.
40. Select all departments and their employees, including departments without employees.
41. Select employees who are not assigned to any project.
42. Select employees and the number of projects their department is working on.
43. Select the departments that have no employees.
44. Select employee names who share the same department with 'John Doe'.
45. Select the department name with the highest average salary.

---

## Nested and Correlated Queries (10)

46. Select the employee with the highest salary.
47. Select employees whose salary is above the average salary.
48. Select the second highest salary from the Employee table.
49. Select the department with the most employees.
50. Select employees who earn more than the average salary of their department.
51. Select the nth highest salary (for example, 3rd highest).
52. Select employees who are older than all employees in the HR department.
53. Select departments where the average salary is greater than 55000.
54. Select employees who work in a department with at least 2 projects.
55. Select employees who were hired on the same date as 'Jane Smith'.

---

## Combined Moderate Difficulty Queries (10)

56. Select the total salary of employees hired in the year 2020.
57. Select the average salary of employees in each department, ordered by the average salary in descending order.
58. Select departments with more than 1 employee and an average salary greater than 55000.
59. Select employees hired in the last 2 years, ordered by their hire date.
60. Select the total number of employees and the average salary for departments with more than 2 employees.
61. Select the name and salary of employees whose salary is above the average salary of their department.
62. Select the names of employees who are hired on the same date as the oldest employee in the company.
63. Select the department names along with the total number of projects they are working on, ordered by the number of projects.
64. Select the employee name with the highest salary in each department.
65. Select the names and salaries of employees who are older than the average age of employees in their department.
