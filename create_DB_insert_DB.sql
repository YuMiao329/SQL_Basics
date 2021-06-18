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
