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








