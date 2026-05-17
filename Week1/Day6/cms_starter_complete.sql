-- Create Departments Table

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

INSERT INTO departments VALUES
(1, 'Computer Science'),
(2, 'Electronics'),
(3, 'Mechanical'),
(4, 'Civil'),
(5, 'Mathematics');


-- Create Students Table

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    department_id INT,
    city VARCHAR(100),
    admission_year INT,
    cgpa DECIMAL(3,2)
);

INSERT INTO students VALUES
(101, 'Rahul', 1, 'Hyderabad', 2022, 8.90),
(102, 'Sneha', 2, 'Chennai', 2021, 7.80),
(103, 'Arjun', 1, 'Bangalore', 2023, 9.10),
(104, 'Meena', 3, 'Pune', 2020, 6.90),
(105, 'Kiran', 1, 'Hyderabad', 2022, 8.40),
(106, 'Divya', 4, 'Mumbai', 2021, 7.10),
(107, 'Tarun', 2, 'Chennai', 2020, 5.80),
(108, 'Pooja', NULL, 'Delhi', 2023, 8.00);


-- Create Staff Table

CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(100),
    department_id INT,
    salary INT,
    hire_date DATE
);

INSERT INTO staff VALUES
(1, 'Dr. Sharma', 1, 90000, '2017-06-12'),
(2, 'Prof. Rao', 1, 85000, '2019-03-20'),
(3, 'Dr. Mehta', 2, 78000, '2016-11-10'),
(4, 'Prof. Iyer', 3, 72000, '2018-07-15'),
(5, 'Dr. Khan', 4, NULL, '2020-01-25'),
(6, 'Prof. Das', NULL, 65000, '2021-09-10');


-- Create Subjects Table

CREATE TABLE subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100),
    staff_id INT
);

INSERT INTO subjects VALUES
(201, 'Database Systems', 1),
(202, 'Operating Systems', 2),
(203, 'Digital Electronics', 3),
(204, 'Thermodynamics', 4),
(205, 'Linear Algebra', NULL);


-- Create Marks Table

CREATE TABLE marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    exam_type VARCHAR(50),
    marks INT,
    exam_date DATE
);

INSERT INTO marks VALUES
(1, 101, 201, 'Mid', 95, '2024-01-10'),
(2, 101, 202, 'Final', 88, '2024-02-15'),
(3, 102, 203, 'Mid', 76, '2024-01-12'),
(4, 103, 201, 'Final', 99, '2024-02-20'),
(5, 104, 204, 'Mid', 45, '2024-01-25'),
(6, 105, 201, 'Final', 82, '2024-02-28'),
(7, 106, 205, 'Mid', 68, '2024-01-30'),
(8, 107, 203, 'Final', 39, '2024-02-05');
