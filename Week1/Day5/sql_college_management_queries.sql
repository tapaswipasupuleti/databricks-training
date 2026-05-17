-- 1. List all students along with their department names.

SELECT s.student_name,
       d.department_name
FROM students s
LEFT JOIN departments d
ON s.department_id = d.department_id;


-- 2. Display all staff members and their department names.

SELECT st.staff_name,
       d.department_name
FROM staff st
LEFT JOIN departments d
ON st.department_id = d.department_id;


-- 3. Find all departments that currently have no students assigned.

SELECT d.department_name
FROM departments d
LEFT JOIN students s
ON d.department_id = s.department_id
WHERE s.student_id IS NULL;


-- 4. Show students who do not have any marks recorded.

SELECT s.student_name
FROM students s
LEFT JOIN marks m
ON s.student_id = m.student_id
WHERE m.student_id IS NULL;


-- 5. Display subjects that are not assigned to any staff member.

SELECT subject_name
FROM subjects
WHERE staff_id IS NULL;


-- 6. Find the average CGPA department-wise.

SELECT d.department_name,
       AVG(s.cgpa) AS avg_cgpa
FROM students s
JOIN departments d
ON s.department_id = d.department_id
GROUP BY d.department_name;


-- 7. Display departments where the average CGPA is greater than 8.0.

SELECT d.department_name,
       AVG(s.cgpa) AS avg_cgpa
FROM students s
JOIN departments d
ON s.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG(s.cgpa) > 8.0;


-- 8. Find the total number of students in each department.

SELECT d.department_name,
       COUNT(s.student_id) AS total_students
FROM departments d
LEFT JOIN students s
ON d.department_id = s.department_id
GROUP BY d.department_name;


-- 9. Display the highest and lowest marks scored in each subject.

SELECT sub.subject_name,
       MAX(m.marks) AS highest_marks,
       MIN(m.marks) AS lowest_marks
FROM subjects sub
LEFT JOIN marks m
ON sub.subject_id = m.subject_id
GROUP BY sub.subject_name;


-- 10. Find students who scored more than 90 in any exam.

SELECT DISTINCT s.student_name,
       m.marks
FROM students s
JOIN marks m
ON s.student_id = m.student_id
WHERE m.marks > 90;


-- 11. Display the names of students who belong to the Computer Science department.

SELECT s.student_name
FROM students s
JOIN departments d
ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Science';


-- 12. Find the number of subjects handled by each staff member.

SELECT st.staff_name,
       COUNT(sub.subject_id) AS subject_count
FROM staff st
LEFT JOIN subjects sub
ON st.staff_id = sub.staff_id
GROUP BY st.staff_name;


-- 13. Display students along with the total marks they obtained across all subjects.

SELECT s.student_name,
       SUM(m.marks) AS total_marks
FROM students s
LEFT JOIN marks m
ON s.student_id = m.student_id
GROUP BY s.student_name;


-- 14. Find departments with more than 2 staff members.

SELECT d.department_name,
       COUNT(st.staff_id) AS staff_count
FROM departments d
JOIN staff st
ON d.department_id = st.department_id
GROUP BY d.department_name
HAVING COUNT(st.staff_id) > 2;


-- 15. Display students whose CGPA is above the average CGPA.

SELECT student_name,
       cgpa
FROM students
WHERE cgpa >
(
    SELECT AVG(cgpa)
    FROM students
);


-- 16. Find staff members earning more than the average salary of their department.

SELECT staff_name,
       salary
FROM staff s1
WHERE salary >
(
    SELECT AVG(s2.salary)
    FROM staff s2
    WHERE s1.department_id = s2.department_id
);


-- 17. Display the second highest salary among staff members.

SELECT DISTINCT salary
FROM staff
ORDER BY salary DESC
LIMIT 1 OFFSET 1;


-- 18. Find students who scored the highest marks in each subject.

SELECT s.student_name,
       sub.subject_name,
       m.marks
FROM marks m
JOIN students s
ON m.student_id = s.student_id
JOIN subjects sub
ON m.subject_id = sub.subject_id
WHERE m.marks =
(
    SELECT MAX(m2.marks)
    FROM marks m2
    WHERE m.subject_id = m2.subject_id
);


-- 19. Display all students and their marks, including students without marks.

SELECT s.student_name,
       m.marks
FROM students s
LEFT JOIN marks m
ON s.student_id = m.student_id;


-- 20. Find subjects where the average marks are below 70.

SELECT sub.subject_name,
       AVG(m.marks) AS avg_marks
FROM subjects sub
JOIN marks m
ON sub.subject_id = m.subject_id
GROUP BY sub.subject_name
HAVING AVG(m.marks) < 70;


-- 21. Display students ordered by CGPA in descending order.

SELECT *
FROM students
ORDER BY cgpa DESC;


-- 22. Find the total salary expenditure department-wise.

SELECT d.department_name,
       SUM(st.salary) AS total_salary
FROM departments d
LEFT JOIN staff st
ON d.department_id = st.department_id
GROUP BY d.department_name;


-- 23. Display departments where the total salary exceeds 200000.

SELECT d.department_name,
       SUM(st.salary) AS total_salary
FROM departments d
JOIN staff st
ON d.department_id = st.department_id
GROUP BY d.department_name
HAVING SUM(st.salary) > 200000;


-- 24. Find students admitted after 2021 and having CGPA above 7.5.

SELECT *
FROM students
WHERE admission_year > 2021
AND cgpa > 7.5;


-- 25. Display the number of students admitted each year.

SELECT admission_year,
       COUNT(student_id) AS total_students
FROM students
GROUP BY admission_year;


