DROP TABLE Department;

CREATE TABLE Department (
	dept_no VARCHAR,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no));
	
SELECT * FROM Department;

CREATE TABLE Dept_Manager (
	dept_no VARCHAR,
	emp_no VARCHAR,
	from_date DATE,
	to_date DATE,
	PRIMARY KEY (dept_no, emp_no));
	
SELECT * FROM Dept_Manager;



	