--SQL Practice Session from fcc--
-- Basic Data Types used in SQL--
/*
INT  			-- Whole Numbers
DECIMAL(M,N)  	-- Decimal Numbers - Exact Value
VARCHAR(1) 		-- String of text length 1
BLOB       		-- Binary Large Objects, Stores Large data
DATE			-- 'YYYY-MM-DD'
TIMESTAMP		-- 'YYYY-MM-DD HH:MM:SS'  - Used for recording

*/
-- Any command written in sql will always end in a semi colon ';'
-- Creating Database Tables --
CREATE TABLE student (
	-- first attribute - 'student_id' also a primary key
    student_id INT,
    student_name varchar(20),
    major varchar(20),
    PRIMARY KEY(student_id)
);

DESCRIBE student;
SELECT * FROM student;

-- Delete and Modify a table using DROP --

DROP TABLE student;

-- Add columns to a table --
ALTER TABLE student ADD gpa DECIMAL(3,2); -- decimal(3,2) -> 3 digits, 2 digits appear after decimal points

ALTER TABLE student DROP COLUMN gpa;

-- INSERTing data into database tables --
-- The order of insertion should be in the order as creating a table.-- 
-- eg. (student_id, student_name, major)

INSERT INTO student VALUES(1, 'Jack', 'Biology');
INSERT INTO student VALUES(2, 'Kate', 'Sociology');
INSERT INTO student VALUES(3, 'Claire', 'English');
INSERT INTO student VALUES(4, 'Jack', 'Biology');
INSERT INTO student VALUES(5, 'Mike', 'Comp.Sci');

-- the value that is being inserted can be specified, 
INSERT INTO student(student_id, student_name) VALUES(6, 'Miguel');

-- Topic: CONSTRAINTS --

-- starting over --
DROP TABLE student;

-- NOT NULL: Defining a particular entry in the table cannot be null
-- Creating Database Tables Again to try 'NOT NULL'--

CREATE TABLE student (
	-- first attribute - 'student_id' also a primary key
    student_id INT,
    student_name varchar(20) NOT NULL, -- The student_name field cannot be empty
    major varchar(20) UNIQUE,	   -- The major field is to be unique. Once one student is assigned a major, another student cannot be assigned the same major
    
    PRIMARY KEY(student_id)
);
SELECT * FROM student;

-- Populating the table again

INSERT INTO student VALUES(1, 'Jack', 'Biology');
INSERT INTO student VALUES(2, 'Kate', 'Sociology');
INSERT INTO student VALUES(3, 'Claire', 'English');
-- INSERT INTO student VALUES(4, 'Jack', 'Biology');   -- Duplicate Entry for Biology because 'major' field is supposed to be unique 
INSERT INTO student VALUES(5, 'Mike', 'Comp.Sci');


INSERT INTO student VALUES(4, 'Jack', 'Physics');   -- Changed 'major' field of 4. Jack to Physics

-- automatically enumerate primary keys
-- create table with auto increment values of student_id
CREATE TABLE student (
	-- first attribute - 'student_id' also a primary key
    student_id INT AUTO_INCREMENT,		-- The data associated will be automatically incremented
    student_name varchar(20) NOT NULL, -- The student_name field cannot be empty
    major varchar(20) UNIQUE,	   -- The major field is to be unique. Once one student is assigned a major, another student cannot be assigned the same major
    
    PRIMARY KEY(student_id)
);

INSERT INTO student(student_name, major) VALUES('Jack','Biology');
INSERT INTO student(student_name, major) VALUES('Kate', 'Sociology');
INSERT INTO student(student_name, major) VALUES('Claire', 'English');
INSERT INTO student(student_name, major) VALUES('Jack', 'Physics');
INSERT INTO student(student_name, major) VALUES('Mike', 'Comp.Sci');
SELECT * FROM student;

-- Updating and Deleting rows inside a database table --
-- Task: Change the name of major : Biology -> Bio

UPDATE student SET major = 'Bio' WHERE major = 'Biology';
UPDATE student set major = 'Computer Science' WHERE major = 'Comp.Sci';

-- Task: Update major of Student who has ID of 4.
UPDATE student SET major = 'Geography' WHERE student_id = '4';
SELECT * FROM student;

-- Task: Change the name of major from 'Geography' to 'Chemistry'
UPDATE student set major = 'Chemistry' WHERE major = 'Geography';


-- 'OR' logic --
UPDATE student SET major = 'Biochemistry' WHERE major = 'Bio' OR major = 'Chemistry';
-- Note: This didn't work because two majors would be assignmed as 'Biochemistry' which is not allowed as major field is supposed to be unique in this table

-- Change multiple column within the same query
UPDATE student
SET student_name = 'Tom', major = 'undecided'
WHERE student_id = 1;

-- Update everything in the column
UPDATE student
SET major = 'undecided';

-- Delete a specific row from a table
DELETE FROM student
WHERE student_id = 1;

SELECT * FROM student;

-- AND Statement --
DELETE FROM student
WHERE student_name = 'Jack' AND major = 'Sociology';

-- Delete the whole table --
DELETE FROM student;

/* - Basic Queries
   - Getting information from the database : SELECT
*/

SELECT * FROM student;	-- Select: Get information, * -> all information, can be modified to specify
/* SELECT * FROM student; -> Select *(everything) from the table
*/
SELECT major FROM student; -- Select column'major' from table'student'

SELECT student_name, major FROM student; -- Select columns 'student_name' and 'major' from table 'Student'

-- SELECT student_name AND major FROM student;	-- This does not work

-- Directly accessing

SELECT student.student_name, student.major	-- makes it clear which table the data is coming from
FROM student;

/* SQL Command: ORDER BY */

SELECT student.student_name, student.major
-- SELECT *
FROM student
-- ORDER BY student_name;		-- Orders in alphabetical order, default is ascending order
ORDER BY student_name DESC; -- DESC changes the order to descending order

/* Task 1: Generate the table in descending order of student_id*/

SELECT *
FROM student
ORDER BY student_id DESC;

/* SQL Command: LIMIT */

SELECT *
FROM student
ORDER BY student_id ASC -- Order by ascending order
LIMIT 2; 				-- Only Generates 2 Results


/* Task: Only display the column where columnn 'major' = 'Chemistry'*/

SELECT student_name, major		-- Display the student_name, major columns
FROM student					-- From Table Student
-- WHERE major = 'Biology';		-- Whose major field = 'Biology'
WHERE major = 'Biology' OR major = 'Comp.Sci'; -- OR Statement

/* Other Comparison or relational operators in SQL:
   < , > , <= , >= , <> , AND, OR
   Note: <> : Not equal to
*/

/* Task: 1. Display all students whose ID is less than 3 
		 2. Display all students whose ID is less than whose name is not Jack
*/

SELECT *
FROM student
WHERE student_id < 3;

SELECT *
FROM student
WHERE student_id < 3 AND student_name <> 'Jack';

/* SQL Keyword: IN
*/

SELECT *
FROM student
WHERE student_name IN ('Claire', 'Kate', 'Mike');	-- Condition True if the values is in that list ()
-- Note: Works like List iteration

/* Task: Display Students who have majors of Biology and English using IN keyword.
		 Add a constraint, if the student id is more than or equal to 4 using AND keyword.
*/
-- 1.
SELECT *
FROM student
WHERE major IN ('Biology', 'English');

-- 2.
SELECT *
FROM student
WHERE major IN ('Biology', 'English') AND student_id >= 4;

DROP TABLE student; -- Deleting the table for next assignment
SELECT * FROM student; -- Check

/* End of Part 1*/

/*
	Part 2:
	- Working with Multiple Tables -
	****
    Company Database Intro
    ****
*/
-- Employee Table
CREATE TABLE Employee (
	emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_date DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT

);

-- Branch Table
CREATE TABLE Branch(
	branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY(mgr_id) REFERENCES Employee(emp_id) ON DELETE SET NULL
);

/* SQL Syntax: ALTER :
				Used to Modify an existing database schema, such as tables, columns, constraints, or indexes.
                Allows to make changes to the structure of the database without having to recreate it from scratch.
*/
-- branch_id of Employee table references to branch_id of Branch table.
ALTER TABLE Employee
ADD FOREIGN KEY(branch_id)
REFERENCES Branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE Employee
ADD FOREIGN KEY(super_id)
REFERENCES Employee(emp_id)
ON DELETE SET NULL;

-- Create Table 'Client'

CREATE TABLE Client(
	client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES Branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE Works_With(
	emp_id INT,
	client_id INT,
    total_sales INT,
    PRIMARY KEY(emp_id, client_id),				-- Composite Primary key: Combination of Primary Keys that work together
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES Client(client_id) ON DELETE CASCADE
);
-- NOTE: ON DELETE CASCADE: if a row in the parent table is deleted,
-- 							all corresponding rows in the child table will automatically be deleted as well.

CREATE TABLE branch_supplier(
	branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY(branch_id, supplier_name),	-- Composite Primary Key
    FOREIGN KEY(branch_id) REFERENCES Branch(branch_id) ON DELETE CASCADE
);

-- Insert Information to the tables
-- Employee Table
INSERT INTO Employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);
-- The last value of row 'branch_id' is set to NULL because Table branch has not been created yet.
SELECT * FROM Employee;
SELECT * FROM Branch;

INSERT INTO Branch VALUES(1, 'Corporate', 100, '2006-02-09');

-- Now, after creating the branch, we can update the value of branch_id for element in table emoployee. --
UPDATE Employee
SET branch_id = 1
WHERE emp_id = 100;

-- Adding other employees in employee table --
INSERT INTO Employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);
INSERT INTO Employee VALUES(102, 'Micheal', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);
INSERT INTO Employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, NULL, NULL);
INSERT INTO Employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO Employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);
INSERT INTO Employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);
INSERT INTO Employee VALUES(107, 'Andy','Bernard', '1973-07-22', 'M', 65000, NULL, NULL);
INSERT INTO Employee VALUES(108, 'Jim','Halpert','1978-10-01','M',71000,NULL, NULL);


-- Adding Branch into a Branch Table
INSERT INTO Branch VALUES(2, 'Scranton', 102, '1992-04-06');
INSERT INTO Branch VALUES(3, 'Stamford', 106, '1998-02-13');

/* Updating values in Employee table in accessing foreign keys from branch table */

UPDATE Employee
SET branch_id = 2
WHERE emp_id in (102, 103);

UPDATE Employee
SET super_id = 102
WHERE emp_id = 103;

UPDATE Employee
SET super_id = 100, branch_id = 3
WHERE emp_id = 106;

UPDATE Employee
SET super_id = 106, branch_id = 3
WHERE emp_id >= 107;

SELECT * FROM Employee;
SELECT * FROM Branch;
SELECT * FROM Client;
SELECT * FROM Works_With;
SELECT * FROM branch_supplier;
/* Populating values for other tables Client, Works_With, and Branch Supplier */

-- Table: Client
INSERT INTO Client VALUES(400,'Dunmore Highschool',2);
INSERT INTO Client VALUES(401,'Lackawana Country',2);
INSERT INTO Client VALUES(402, 'FedEx', 3);
INSERT INTO Client VALUES(403,'John Daly Law, LLC',3);
INSERT INTO Client VALUES(404,'Scranton Whitepages',2);
INSERT INTO Client VALUES(405,'Times Newspaper',3);
INSERT INTO Client VALUES(406,'FedEx',2);

-- Table: Works_With
INSERT INTO Works_With VALUES(105, 400, 55000);
INSERT INTO Works_With VALUES(102, 401, 267000);
INSERT INTO Works_With VALUES(108, 402, 22500);
INSERT INTO Works_With VALUES(107, 403, 5000);
INSERT INTO Works_With VALUES(108, 403, 12000);
INSERT INTO Works_With VALUES(105, 404, 33000);
INSERT INTO Works_With VALUES(107, 405, 26000);
INSERT INTO Works_With VALUES(102, 406, 15000);
INSERT INTO Works_With VALUES(105, 406, 130000);

SELECT * FROM Works_With ORDER BY client_id;

-- Table: Branch Supplier
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill','Paper');
INSERT INTO branch_supplier VALUES(2,'Uni-ball','Writing Utensils');
INSERT INTO branch_supplier VALUES(3,'Patriot Paper','Paper');
INSERT INTO branch_supplier VALUES(2,'J.T. Forms & Labels','Custom Forms');
INSERT INTO branch_supplier VALUES(3,'Uni-ball','Writing Utensils');
INSERT INTO branch_supplier VALUES(3,'Stamford Lables','Custom Forms');

--
/* More Basic Queries */

/* Task: Find all Employees and display first_name and last_name */
SELECT first_name, last_name FROM Employee;

/* Task: Find all Clients and display their branch_id and Client Name*/
SELECT * FROM Client;
SELECT branch_id, client_name from Client;

/* Task: Find all employees ordered by Salary */
SELECT emp_id, first_name, last_name, salary
FROM Employee
ORDER BY salary;

/* Task: Find all employees ordered by sex then name */
SELECT *
FROM Employee
ORDER BY sex desc, first_name asc, last_name desc;

/* Task: Find the first 5 employees in the table */
SELECT *
FROM Employee
LIMIT 5;

/* Task: Find the first and last name of all employees */
SELECT first_name, last_name
FROM Employee;

/* Task: Find the 'forename' and 'surnames' of all employeess */

SELECT first_name AS forename, last_name AS surname
FROM Employee;
-- Note: 'AS': Changes the name of the column

/* Task: Find all the different genders. */
SELECT DISTINCT sex
FROM Employee;

--
/* Functions */
--

/* Find the number of employees 
   Func: COUNT
*/

SELECT COUNT(emp_id)	-- Counts the number of rows in column 'emp_id'
FROM employee;


SELECT COUNT(super_id) FROM Employee; -- should be 8 because one value is null

/* Task 1: Find the number of female employees born after or on 1970 */
SELECT COUNT(sex) FROM Employee
WHERE sex = 'F' AND birth_date > '1970-01-01';

/* Task: Find the average of all employee's salary. */
SELECT AVG(salary) FROM Employee;

/* Task: Find the average salary of all the male employees. */
SELECT AVG(salary) FROM Employee
WHERE sex = 'M';

/** Task: Find the sum of all employee's salary **/
SELECT SUM(salary) FROM Employee;

/* Task: Find out how many males and females are there. */
SELECT COUNT(sex), sex FROM Employee
WHERE sex = 'M';
SELECT COUNT(sex) FROM Employee
WHERE sex = 'F';

SELECT sex, COUNT(sex) FROM Employee GROUP BY sex;

/* Task: Find the total sales of each salesman */
SELECT emp_id, SUM(total_sales)
FROM Works_With GROUP BY emp_id;
/* Find out the total spending of each client */
SELECT client_id, SUM(total_sales)
FROM Works_With GROUP BY client_id;

--
/* WildCards */
-- % = any # characters, _ = one character

/* Prompt: Find any client's who are an LLC */
SELECT * FROM client
WHERE client_name LIKE '%LLC';

/*ADD NOTES FOR LIKE SYNTAX
	_ : One character
    % : Multiple characters
*/

/* Task: Find any branch supplier who are in the label business */
SELECT * FROM branch_supplier
WHERE supplier_name LIKE '%Labels%';

SELECT * FROM branch_supplier;

/* Task: Change the data of branch_supplier table's column 'supplier_name':*/

UPDATE branch_supplier
SET supplier_name = 'Stamford Labels'
WHERE branch_id = 3 AND supplier_name = 'Stamford Lables' ;

/* Task: Find any employee born in October */
SELECT * FROM Employee
WHERE birth_date LIKE '%-10-%';

-- Another approach,

SELECT * FROM Employee
WHERE birth_date LIKE '____-10-%';

/* Find all employees that were born in February*/
SELECT * FROM Employee
WHERE birth_date LIKE '____-02%';

/* Find all clients who are schools. */
SELECT * FROM Client
WHERE client_name LIKE '%school%';

/* UNIONs in SQL:
	the 'UNION' operator is used to combine the result sets of two or more 'SELECT' statements into a single result set.
    the 'UNION' operation removes duplicate rows from the combined result, ensuring that each row in the final result is unique.
*/

/* Find a list of employee and branch name */
-- should have the same number of columns and should be of the same data type

SELECT first_name FROM Employee
UNION
SELECT branch_name FROM Branch;

SELECT first_name, last_name FROM Employee UNION SELECT branch_name, branch_id FROM Branch;

/* Change the name of column name during display */
SELECT last_name AS client_employee FROM Employee
UNION
SELECT client_name FROM Client;

/* Find a list of all clients & branch supplier's name */
SELECT client_name, client.branch_id FROM Client
UNION
SELECT supplier_name, branch_supplier.branch_id FROM branch_supplier group by branch_id;

-- Task: Find a list of all money spent or earned by the company
-- money spent: employee.salary, money earned - works_with.total_sales

SELECT Employee.salary FROM Employee
UNION
SELECT Works_With.total_sales FROM Works_With;

/* --
   JOINS in SQL
   In SQL, 'JOINS' are used to combine rows from two or more tables based on a related column between them.
   Types of joins:
	1. Inner Join: Returns only the rows that have matching values in both tables.
    2. Left Join/ Left Outer Join: Returns all rows from the left table and the matched rows from the right table.
    3. Right Join/ Right Outer Join: Returns all rows from the right table and the matched rows from the left table.
    4. Full Join/ Full Outer Join : Returns all rows when there is a match in either the left or the right table.
    5. Self Join: Used to combine rows from a single table. Often used when there is a table with hierarchical data.
    6. Cross Join/ Cartesian Join: Returns the Cartesian Product of two tables, resulting in all possible combination of rows from both tables.
    7. Anti Join/ AntiSemi Join: Returns rows from the first table that have no matching rows in the second table.

    --*/
    
-- Insert another branch into the branch table
    
INSERT INTO Branch VALUES(4, 'Buffalo',NULL,NULL);
    
/* Task: Find all branches and the names of their managers */
-- Inner Join
SELECT employee.first_name, employee.last_name, branch.branch_name	-- specification because we have data from two table
FROM Employee
JOIN Branch
ON Employee.emp_id = branch.mgr_id;
-- mgr_id from branch table and emp_id from Employee table are same.

-- Left Join -> All values from Left Table
SELECT employee.first_name, employee.last_name, branch.branch_name	-- specification because we have data from two table
FROM Employee
LEFT JOIN Branch
ON Employee.emp_id = branch.mgr_id;

-- Right Join -> All values from Right Table
SELECT employee.first_name, employee.last_name, branch.branch_name	-- specification because we have data from two table
FROM Employee
RIGHT JOIN Branch
ON Employee.emp_id = branch.mgr_id;

/* NESTED QUERIES
		or subquery: A SQL query that is embedded within another SQL query.
        Allows to retriever data from one or more tables based on the result of an inner query, which is executed first.
        Commonly used for filtering, joining, & performing calculations on data.
*/
-- Task: Find names of all employees who have sold over 30000 to a single client.
-- Approach: Find names of all employees(from Employee) who have total_sales > 30000(from works_with), relation with emp_id

SELECT Employee.first_name, Employee.last_name
FROM Employee
WHERE Employee.emp_id IN(
SELECT works_with.emp_id
FROM works_with
WHERE works_with.total_sales > 30000
);
/* Task: Find all client's who are handled by the branch
--       that Micheal Scott manages
--       Assume you know Micheal's ID.  */

/* Approach: 1. Find all branch that Micheal Scott Manages, Find the clients handled by that branch

*/

SELECT Employee.first_name, Employee.last_name
FROM Employee
WHERE employee.emp_id = 102;
-- By emp_id
SELECT Client.client_name
FROM Client
WHERE Client.branch_id IN(
	SELECT Branch.branch_id
    FROM Branch
    WHERE Branch.branch_id IN(
		SELECT Employee.branch_id
        FROM Employee
        WHERE Employee.emp_id = 102
        )
);

-- By first name and last name
SELECT Client.client_name
FROM Client
WHERE Client.branch_id IN(
	SELECT Branch.branch_id
    FROM Branch
    WHERE Branch.branch_id IN(
		SELECT Employee.branch_id
        FROM Employee
        WHERE Employee.first_name = 'Micheal' AND Employee.last_name = 'Scott'
        )
);

/* ON DELETE
		Clause used in a foreign key constraint to specify what action should be taken when a record(row) in the 
        referenced table (the table with the primary key) is deleted.
        Defines the refential integrity behavior, ensuring that relationships between tables are maintained
        correctly. Supported Clauses:
        1. CASCADE
        2. SET NULL
        3. SET DEFAULT
        4. NO ACTION / RESTRICT
*/

/*
CREATE TABLE Branch(
	branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY(mgr_id) REFERENCES Employee(emp_id) ON DELETE SET NULL
    -- If the emp_id from employee table gets deleted,
    the mgr_id in Branch table will be set to NULL
);
*/
/*
CREATE TABLE Branch(
	branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY(mgr_id) REFERENCES Employee(emp_id) ON DELETE CASCADE
    -- If the emp_id from employee table gets deleted,
    the whole row of mgr_id will be deleted.
);
*/

/*
	TRIGGERS:
    -> A database object that is associated with a specific table and is automatically executed(or 'triggered')
       in response to specific events or actions that occur within that table.
	-> Triggers are used to enforce data integrity, automate repetitive tasks, and perform actions such as logging changes,
	   or updating related data.
	-> Triggers can be defined to activate before or after events like INSERT, UPDATE, DELETE, or when when
       a specific condition is met.
*/