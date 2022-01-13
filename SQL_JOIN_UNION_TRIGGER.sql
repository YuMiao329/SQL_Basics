###############################################
CREATE TABLE student (
	student_id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) UNIQUE
);

DESCRIBE student;
DROP TABLE student;
ALTER TABLE student ADD gpa DECIMAL(3, 2);
ALTER TABLE student DROP COLUMN gpa;

###############################################
CREATE TABLE student (
	student_id INT PRIMARY KEY,
    name VARCHAR(20),
    major VARCHAR(20) DEFAULT "Undecided"
);

SELECT * FROM student;
INSERT INTO student VALUES(1, "Jack", "Biology");
INSERT INTO student VALUES(2, "Kate", "Sociology");
INSERT INTO student(student_id, name) VALUES(3, "James");
INSERT INTO student VALUES(4, NULL, "Chemistry");
INSERT INTO student(student_id, name) VALUES(4, "Claire");
INSERT INTO student VALUES(5, "Jack", "Biology");
INSERT INTO student VALUES(6, "Sixth", "Computer Science");

###############################################
CREATE TABLE student (
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    major VARCHAR(20) DEFAULT "Undecided"
);

DROP TABLE student;
SELECT * FROM student;
INSERT INTO student(name) VALUES("James");
INSERT INTO student(name, major) VALUES("Jack", "Biology");
INSERT INTO student(name, major) VALUES("Kate", "Sociology");

###############################################
CREATE TABLE student (
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    major VARCHAR(20) DEFAULT "Undecided"
);

DROP TABLE student;
SELECT * FROM student;
INSERT INTO student VALUES(1, "Jack", "Biology");
INSERT INTO student VALUES(2, "Kate", "Sociology");
INSERT INTO student(student_id, name) VALUES(3, "James");
INSERT INTO student(student_id, name) VALUES(4, "Claire");
INSERT INTO student VALUES(5, "Jack", "Biology");
INSERT INTO student VALUES(6, "Sixth", "Computer Science");

UPDATE student
SET major = "BIO"
WHERE major = "Biology";

UPDATE student
SET major = "Comp Sci"
WHERE major = "Computer Science";

UPDATE student
SET major = "Biochemistry"
WHERE major = "BIO" OR major = "Chemistry";

UPDATE student
SET name = "Tom", major = "undecided"
WHERE student_id = 1;

UPDATE student
SET major = "undecided";

DELETE FROM student;

DELETE FROM student
WHERE student_id = 5;

###############################################
CREATE TABLE student (
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    major VARCHAR(20) DEFAULT "Undecided"
);

DROP TABLE student;
SELECT * FROM student;
INSERT INTO student VALUES(1, "Jack", "Biology");
INSERT INTO student VALUES(2, "Kate", "Sociology");
INSERT INTO student VALUES(3, "Claire", "Chemistry");
INSERT INTO student VALUES(4, "Jack", "Biology");
INSERT INTO student VALUES(5, "Sixth", "Computer Science");

SELECT name, major
FROM student
ORDER BY name;

SELECT name, major
FROM student
ORDER BY name DESC;

SELECT *
FROM student
ORDER BY student_id;

SELECT *
FROM student
ORDER BY major, student_id DESC;

SELECT *
FROM student
ORDER BY major DESC, student_id DESC;

SELECT *
FROM student
ORDER BY student_id DESC
LIMIT 2;

SELECT *
FROM student
WHERE major = "Biology";

SELECT name, major
FROM student
WHERE major = "Biology" OR major = "Chemistry" OR name = "Kate";

SELECT name, major
FROM student
WHERE major <> "Chemistry";

SELECT student_id, name, major
FROM student
WHERE student_id <= 3 AND name <> "Jack";

SELECT *
FROM student
WHERE name IN ("Claire", "Kate", "Sixth");

SELECT *
FROM student
WHERE major IN ("Biology", "Chemistry") AND student_id > 2;

###############################################
DROP TABLE student;

CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_date DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);

CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);
 
CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

INSERT INTO employee VALUES(100, "David", "Wallace", "1967-11-17", "M", 250000, NULL, NULL);
INSERT INTO branch VALUES(1, "Corporate", 100, "2006-02-09");
UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;
INSERT INTO employee VALUES(101, "Jan", "Levinson", "1961-05-11", "F", 110000, 100, 1);

INSERT INTO employee VALUES(102, "Michael", "Scott", "1964-03-15", "M", 75000, 100, NULL);
INSERT INTO branch VALUES(2, "Scranton", 102, "1992-04-06");
UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;
INSERT INTO employee VALUES(103, "Angela", "Martin", "1971-06-25", "F", 63000, 102, 2);
INSERT INTO employee VALUES(104, "Kelly", "Kapoor", "1980-02-05", "F", 55000, 102, 2);
INSERT INTO employee VALUES(105, "Stanley", "Hudson", "1958-02-19", "F", 69000, 102, 2);

INSERT INTO employee VALUES(106, "Josh", "Porter", "1969-09-05", "M", 78000, 100, NULL);
INSERT INTO branch VALUES(3, "Stamford", 106, "1998-02-13");
UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;
INSERT INTO employee VALUES(107, "Andy", "Bernard", "1973-07-22", "M", 65000, 100, 3);
INSERT INTO employee VALUES(108, "Jim", "Halpert", "1978-10-01", "M", 71000, 100, 3);

INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

SELECT * FROM employee;
##############################################
-- QUERIES --
-- Find all employees --
SELECT *
FROM employee;
-- Find all clients --
SELECT *
FROM client;
-- Find all employees ordered by salary --
SELECT *
FROM employee
ORDER BY salary DESC;
-- Find all employees ordered by sex then name --
SELECT *
FROM employee
ORDER BY sex, first_name, last_name;
-- Find first 5 employees in the table --
SELECT *
FROM employee
LIMIT 5;
-- Find the first and the last names of all employees --
SELECT first_name, last_name
FROM employee;
-- Find the forename and the surnames of all employees --
SELECT first_name AS forename, last_name AS surname
FROM employee;
-- Find out all the different genders --
SELECT DISTINCT sex
FROM employee;

##############################################
-- FUNCTIONS --
-- Find number of employees --
SELECT COUNT(emp_id)
FROM employee;
SELECT COUNT(super_id)
FROM employee;
-- Find number of female employees born after 1970 --
SELECT COUNT(emp_id)
FROM employee
WHERE sex = "F" AND birth_date > "1970-01-01";
-- Find AVG of all employee's salaries --
SELECT AVG(salary)
FROM employee;
-- Find AVG of all employee's salaries male only--
SELECT AVG(salary)
FROM employee
WHERE sex = "M";
-- Find nubmer of all employee's sex--
SELECT COUNT(sex), sex
FROM employee
GROUP BY sex;
-- Find total sales of each salesman--
SELECT SUM(total_sales), emp_id
FROM works_with
GROUP BY emp_id;
-- Find total money of spent with each branch--
SELECT SUM(total_sales), client_id
FROM works_with
GROUP BY client_id;

##############################################
-- Wildcards --
-- Find any client's who are an LLC --
-- % = any number of char, _ = one char
SELECT *
FROM client
WHERE client_name LIKE "%LLC%";
-- Find any branch suppliers who are in the label business --
SELECT *
FROM branch_supplier
WHERE supplier_name LIKE "%Labels%";
-- Find any employee born in October --
SELECT *
FROM employee
WHERE birth_date LIKE "____-10-__";
-- Find any clients who are schools --
SELECT *
FROM client
WHERE client_name LIKE "%school%";

##############################################
-- UNION will return the single column of two-combined table --
-- # OF COLUMNS MUST BE THE SAME --
-- Find a list of employee and branch names --
SELECT first_name AS first_column
FROM employee
UNION
SELECT branch_name
FROM branch
UNION
SELECT client_name
FROM client;
-- Find a list of all clients and branch supplier's names --
SELECT client_name, client.branch_id
FROM client
UNION
SELECT supplier_name, branch_supplier.branch_id
FROM branch_supplier;

-- Find a list of all money spent or earned by the company --
SELECT salary
FROM employee
UNION
SELECT total_sales
FROM works_with;

##############################################
-- JOINS --
INSERT INTO branch VALUES(4, "Buffalo", NULL, NULL);
SELECT * FROM branch;
-- Find all branches and the names of heir managers --
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee 
JOIN branch
ON employee.emp_id = branch.mgr_id;
-- Find all branches&names of mgrs and also names w/o branches NULL --
-- i.e. all employees no matter they have branch or not --
-- LEFT JOIN will give all from FROM table, JOINED table will be NULL if not connected --
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee 
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id;
-- RIGHT JOIN vice versa --
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee 
RIGHT JOIN branch
ON employee.emp_id = branch.mgr_id;
-- FULL JOIN, combine both but not available in MySQL --

##############################################
-- Nested Query --
-- Find names of all employees who sold over 30,000 --
-- to a sinlge client --
SELECT employee.first_name, employee.last_name, works_with.emp_id, works_with.client_id
FROM employee
JOIN works_with
ON employee.emp_id = works_with.emp_id
WHERE works_with.total_sales > 30000;
-- OR using nested query --
SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
	SELECT works_with.emp_id
    FROM works_with
    WHERE works_with.total_sales > 30000
);

-- Find all clients who are handled by the branch --
-- that Miclael Scott manages --
-- Assume you know Michael's ID --
SELECT client_id, client.client_name
FROM client
JOIN branch
ON branch.branch_id = client.branch_id
WHERE branch.mgr_id = 102;
-- OR using Nested Query --
-- Assume you do not know Michael's ID --
SELECT client_id, client.client_name
FROM client
WHERE client.branch_id IN (
	SELECT branch.branch_id
    FROM branch
    WHERE branch.mgr_id IN(
		SELECT employee.emp_id
        FROM employee
        WHERE employee.first_name = "Michael" AND employee.last_name = "Scott"
	)
);

##############################################
-- ON DELETE --
-- if delete the referred key --
-- ON DELETE SET NULL --
-- the foreign associated with the referred key will be NULL --
DELETE FROM employee
WHERE emp_id = 102;

SELECT * FROM branch;

-- ON DELETE CASCADE --
-- the entire row associated with the deleted referred key--
-- will be deleted --
DELETE FROM branch
WHERE branch.branch_id = 2;

SELECT * FROM branch_supplier;

-- The reason why we dont use --
-- ON DELETE NULL for "branch" dataframe -- 
-- is that other dataframe use branch_id as primary key --
-- PRIMARY KEY CAN NOT BE SET TO NULL --

##############################################
-- TRIGGER --
CREATE TABLE trigger_test (
	message VARCHAR(100)
);

DELIMITER $$
CREATE
	TRIGGER my_trigger BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
		INSERT INTO trigger_test VALUES("Added new employee");
	END$$
DELIMITER ;

INSERT INTO employee
VALUES(109, "Oscar", "Martinez", "1968-02-19", "M", 69000, 106, 3);
SELECT * FROM trigger_test;

----------------------- 
-- COULD BE: --
-- TRIGGER my_trigger2 BEFORE/AFTER UPDATE/INSERT/DELETE
DELIMITER $$
CREATE
	TRIGGER my_trigger2 BEFORE INSERT
	ON employee
	FOR EACH ROW BEGIN
		IF NEW.sex = "M" THEN
			INSERT INTO trigger_test VALUES("Added male employee");
		ELSEIF NEW.sex = "F" THEN
			INSERT INTO trigger_test VALUES("Added female employee");
		ELSE
			INSERT INTO trigger_test VALUES("Added other employee");
		END IF;
	END$$
DELIMITER ;

INSERT INTO employee
VALUES(110, "Pam", "Beesly", "1970-02-19", "F", 69000, 106, 3);

SELECT * FROM trigger_test;
DROP TRIGGER my_trigger;
DROP TRIGGER my_trigger2;