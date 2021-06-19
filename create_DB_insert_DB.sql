CREATE TABLE student (
	-- student_id INT PRIMARY KEY,
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    -- major VARCHAR(20) UNIQUE
    major VARCHAR(20) DEFAULT 'undecided'
    -- other constains such as DEFAULT (eg. DEFAULT 'undecided')
    -- will set the non-filled as undecided
    -- you can also use PIMARY KEY(student_id)
);
-- --------------------------------------
-- to show data types of each variables
DESCRIBE student;
-- --------------------------------------
-- to delete the student dataset
DROP TABLE student;
-- --------------------------------------
-- to add one more column gpa with 3 digits and 2 digits after the decimal
ALTER TABLE student ADD gpa DECIMAL(3, 2);
-- --------------------------------------
-- to delete the gpa column
ALTER TABLE student DROP COLUMN gpa;
-- --------------------------------------
-- to display the dataset
SELECT * FROM student;
-- --------------------------------------
-- here, manually specify the primary key
INSERT INTO student VALUES(1, 'Jack', 'Biology');
INSERT INTO student VALUES(2, 'Kate', 'Sociology');
INSERT INTO student(student_id, name) VALUES(3, 'Claire');
INSERT INTO student VALUES(4, 'Jack', 'Biology');
INSERT INTO student VALUES(5, 'Mike', 'Comp Sci');
-- --------------------------------------
-- here we try auto increment
INSERT INTO student(name, major) VALUES('Jack', 'Biology');
INSERT INTO student(name, major) VALUES('Kate', 'Sociology');
INSERT INTO student(name, major) VALUES('Claire', 'Undecided');
INSERT INTO student(name, major) VALUES('Jack', 'Biology');
INSERT INTO student(name, major) VALUES('Mike', 'Comp Sci');
-- ---------------------------------------
-- * Change one Column vairables from all specific value to the other valus
-- if don't specify WHERE, all variables in that column will be affected
UPDATE student
SET major = 'Bio'
WHERE major = 'Biology';
-- can also set as (WHERE student_id = 1)
-- here we merge bio and chemistry major as one Biochemistry major
UPDATE student
SET major = 'Biochemistry'
WHERE major = 'Bio' OR major = 'Chemistry';
-- here, we will change the first student to Tom with undecided major
UPDATE student
SET name = 'Tom', major = 'undecided'
WHERE student_id = 1;
-- ---------------------------------------
-- here we try DELETE: to delete specific row
DELETE FROM student
WHERE student_id = 5;
-- here we specify Tom with undecided major got deleted
DELETE FROM student
WHERE name = 'Tom' AND major = 'undecided';

-- ----------------------------------------------
-- Query Basics
SELECT * FROM student;

-- here we can try to select *(all) columns from student table 
SELECT name, major FROM student;
-- since we have only one table - student, we don't need to 
-- specify which table is being called
SELECT student.name, student.major FROM student;

-- we try to order the table by using the alphabetical order from name
SELECT student.name, student.major FROM student ORDER BY name;
-- ordering the list with name as descending order
SELECT student.name, student.major FROM student ORDER BY name DESC;
SELECT * FROM student ORDER BY student_id DESC;
SELECT * FROM student ORDER BY student_id ASC;
-- order two times (first being the main order, second being the second order)
SELECT * FROM student ORDER BY major, student_id ;

-- LIMIT: only want specific thing/number in the table
-- here we only show two rows from the table
SELECT * FROM student LIMIT 2;
SELECT * FROM student ORDER BY student_id DESC LIMIT 2;

-- filtering:
-- here only show the student with major is biology
SELECT * FROM student WHERE major = 'Biology';
-- here we only keep major is biology or chemistry rows
SELECT * FROM student WHERE major = 'Biology' or major = 'Chemistry';
-- here we only keep major is biology or name is Kate rows
SELECT * FROM student WHERE major = 'Biology' or name = 'Kate';

-- Other useful operators:
-- <, >, <=, >=, =, <> this is 'not equal' sign, AND, OR

-- here we select rows where major is not equal to Biology majors
SELECT * FROM student WHERE major <> 'Biology';
-- here we select rows with student_id is smaller or equal to 3
SELECT * FROM student WHERE student_id <= 3;
SELECT * FROM student WHERE student_id <= 3 AND name <> 'Jack';

-- IN statement
-- we use IN to specify in which group, we select
-- to extract specific rows with name specified in the parenthesis () 
SELECT * FROM student
WHERE name IN ('Claire', 'Kate', 'Mike');

-- say we only interested in the rows with biology and chemistry majors
SELECT * FROM student
WHERE major IN ('Biology', 'Chemistry');
-- with one more constrain: student_id > 2 together
SELECT * FROM student
WHERE major IN ('Biology', 'Chemistry') AND student_id > 2;
