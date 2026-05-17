

-- 26. Find the city with the maximum number of students.

SELECT city,
       COUNT(student_id) AS total_students
FROM students
GROUP BY city
ORDER BY total_students DESC
LIMIT 1;


-- 27. Display all departments and their staff count, including empty departments.

SELECT d.department_name,
       COUNT(st.staff_id) AS staff_count
FROM departments d
LEFT JOIN staff st
ON d.department_id = st.department_id
GROUP BY d.department_name;


-- 28. Find students who have failed in at least one subject.

SELECT DISTINCT s.student_name
FROM students s
JOIN marks m
ON s.student_id = m.student_id
WHERE m.marks < 50;


-- 29. Display staff hired before 2018.

SELECT *
FROM staff
WHERE hire_date < '2018-01-01';


-- 30. Find departments where no staff salary is recorded as NULL.

SELECT d.department_name
FROM departments d
JOIN staff st
ON d.department_id = st.department_id
GROUP BY d.department_name
HAVING COUNT(CASE WHEN st.salary IS NULL THEN 1 END) = 0;


-- 31. Assign a row number to students ordered by CGPA.

SELECT student_name,
       cgpa,
       ROW_NUMBER() OVER(ORDER BY cgpa DESC) AS row_num
FROM students;


-- 32. Rank students based on their CGPA.

SELECT student_name,
       cgpa,
       RANK() OVER(ORDER BY cgpa DESC) AS rank_num
FROM students;


-- 33. Display dense rank of staff salaries.

SELECT staff_name,
       salary,
       DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank_num
FROM staff;


-- 34. Find the top 3 highest scoring students using window functions.

SELECT *
FROM
(
    SELECT s.student_name,
           m.marks,
           ROW_NUMBER() OVER(ORDER BY m.marks DESC) AS rn
    FROM students s
    JOIN marks m
    ON s.student_id = m.student_id
) t
WHERE rn <= 3;


-- 35. Display running total of marks for each student.

SELECT student_id,
       marks,
       SUM(marks)
       OVER(PARTITION BY student_id ORDER BY exam_date) AS running_total
FROM marks;


-- 36. Find the average marks for each subject using window functions.

SELECT subject_id,
       marks,
       AVG(marks)
       OVER(PARTITION BY subject_id) AS avg_marks
FROM marks;


-- 37. Display previous exam marks for each student using LAG().

SELECT student_id,
       exam_date,
       marks,
       LAG(marks)
       OVER(PARTITION BY student_id ORDER BY exam_date) AS previous_marks
FROM marks;


-- 38. Display next exam marks for each student using LEAD().

SELECT student_id,
       exam_date,
       marks,
       LEAD(marks)
       OVER(PARTITION BY student_id ORDER BY exam_date) AS next_marks
FROM marks;


-- 39. Find the highest marks within each subject using MAX() OVER().

SELECT subject_id,
       marks,
       MAX(marks)
       OVER(PARTITION BY subject_id) AS highest_marks
FROM marks;


-- 40. Display cumulative average marks ordered by exam date.

SELECT exam_date,
       marks,
       AVG(marks)
       OVER(ORDER BY exam_date) AS cumulative_average
FROM marks;


-- 41. Find the first student admitted in each department.

SELECT *
FROM
(
    SELECT student_name,
           department_id,
           admission_year,
           ROW_NUMBER()
           OVER(PARTITION BY department_id ORDER BY admission_year) AS rn
    FROM students
) t
WHERE rn = 1;


-- 42. Display the latest hired staff member in each department.

SELECT *
FROM
(
    SELECT staff_name,
           department_id,
           hire_date,
           ROW_NUMBER()
           OVER(PARTITION BY department_id ORDER BY hire_date DESC) AS rn
    FROM staff
) t
WHERE rn = 1;


-- 43. Divide students into 4 CGPA quartiles using NTILE().

SELECT student_name,
       cgpa,
       NTILE(4)
       OVER(ORDER BY cgpa DESC) AS quartile
FROM students;


-- 44. Find percentage rank of students based on CGPA.

SELECT student_name,
       cgpa,
       PERCENT_RANK()
       OVER(ORDER BY cgpa DESC) AS percent_rank
FROM students;


-- 45. Display cumulative distribution of salaries.

SELECT staff_name,
       salary,
       CUME_DIST()
       OVER(ORDER BY salary DESC) AS cumulative_distribution
FROM staff;


-- 46. Find subjects where a student's marks are above the subject average.

SELECT *
FROM
(
    SELECT s.student_name,
           sub.subject_name,
           m.marks,
           AVG(m.marks)
           OVER(PARTITION BY m.subject_id) AS avg_marks
    FROM marks m
    JOIN students s
    ON m.student_id = s.student_id
    JOIN subjects sub
    ON m.subject_id = sub.subject_id
) t
WHERE marks > avg_marks;


-- 47. Find departments whose average staff salary is higher than overall average salary.

SELECT d.department_name,
       AVG(st.salary) AS avg_salary
FROM departments d
JOIN staff st
ON d.department_id = st.department_id
GROUP BY d.department_name
HAVING AVG(st.salary) >
(
    SELECT AVG(salary)
    FROM staff
);


-- 48. Display students who scored above department average marks.

SELECT *
FROM
(
    SELECT s.student_name,
           d.department_name,
           m.marks,
           AVG(m.marks)
           OVER(PARTITION BY d.department_id) AS dept_avg
    FROM students s
    JOIN departments d
    ON s.department_id = d.department_id
    JOIN marks m
    ON s.student_id = m.student_id
) t
WHERE marks > dept_avg;


-- 49. Find the 3rd highest mark using DENSE_RANK().

SELECT *
FROM
(
    SELECT student_id,
           marks,
           DENSE_RANK()
           OVER(ORDER BY marks DESC) AS rank_num
    FROM marks
) t
WHERE rank_num = 3;


-- 50. Generate complete student performance report.

SELECT s.student_name,
       d.department_name,
       sub.subject_name,
       m.exam_type,
       m.marks,
       AVG(m.marks)
       OVER(PARTITION BY d.department_id) AS department_average,
       RANK()
       OVER(ORDER BY m.marks DESC) AS overall_rank
FROM students s
JOIN departments d
ON s.department_id = d.department_id
JOIN marks m
ON s.student_id = m.student_id
JOIN subjects sub
ON m.subject_id = sub.subject_id;
