-- Create students table

CREATE TABLE students (
    student_id INT,
    student_name VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO students VALUES
(1, 'Alice Johnson', 'alice@email.com'),
(2, 'Bob Smith', 'bob@email.com'),
(3, 'Charlie Brown', 'charlie@email.com'),
(4, 'Diana Prince', 'diana@email.com'),
(5, 'Ethan Hunt', 'ethan@email.com');


-- Create instructors table

CREATE TABLE instructors (
    instructor_id INT,
    instructor_name VARCHAR(100)
);

INSERT INTO instructors VALUES
(1, 'John Miller'),
(2, 'Sarah Lee'),
(3, 'David Wilson'),
(4, 'Emma Thomas');


-- Create courses table

CREATE TABLE courses (
    course_id INT,
    course_name VARCHAR(100),
    instructor_id INT
);

INSERT INTO courses VALUES
(101, 'SQL Basics', 1),
(102, 'Python Fundamentals', 2),
(103, 'Data Analytics', NULL),
(104, 'Cloud Computing', 3),
(105, 'Machine Learning', NULL);


-- Create enrollments table

CREATE TABLE enrollments (
    enrollment_id INT,
    student_id INT,
    course_id INT
);

INSERT INTO enrollments VALUES
(1, 1, 101),
(2, 1, 102),
(3, 2, 101),
(4, 3, 104),
(5, 4, 102);
