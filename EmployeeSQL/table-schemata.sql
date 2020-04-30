-- Create Departments Table, which included department number (dept_no), and department name (dept_name).  
-- Use dept_no as primary key, as it will be unique

CREATE TABLE Departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no));
	
-- Create Employees Table, which included details on employees.  Use emp_no as primary key as it will be unique

CREATE TABLE Employees (
	emp_no VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
 	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no));

-- Create Dept_Emp Table, which allows employees to be mapped to department.  It was not clear if the combination 
-- of emp_no and dept_no would uniquely identify a row, so I created without primary keys and then added the 
-- serial id as primary key.  I do define emp_no and dept_no as foreign keys.  Before uploading data, 
-- make sure to upload data to Departments and Employees tables, as they are referenced in foreign key defititions.

CREATE TABLE Dept_Emp (
	emp_no VARCHAR NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date VARCHAR NOT NULL,
	to_date VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no));

-- Add serial id as primary key.  Before adding, make sure to upload the data from the csv file.  Also need to make
-- sure to upload the data to tables Employees and Departments first, as they are referenced in foreign key
-- definitions.

ALTER TABLE Dept_Emp
ADD COLUMN id SERIAL PRIMARY KEY;	
	
-- Create Dept_Manager Table.  This file was small enough to visually inspect to see that the
-- combination of dept_no and emp_no was unique, so defined each as primary keys. Also defined
-- each as foreign keys.  Need to make sure to upload the data to tables Employees and Departments 
-- first, as they are referenced in foreign key definitions.

CREATE TABLE Dept_Manager (
	dept_no VARCHAR NOT NULL,
	emp_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE,
	PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no));	

-- Create Salaries Table. I expected that there could be duplicate emp_no's, so did not define as 
-- primary key. Did define emp_no as foreign key and then added a serial primary key.  Before uploading
-- data, need to upload data to Employees table, as it is references in foreign key defintion.

CREATE TABLE Salaries (
	emp_no VARCHAR NOT NULL,
	salary NUMERIC NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no));
	
-- Add serial id as primary key.  Before adding, make sure to upload the data from the csv file.  Also need to make
-- sure to upload the data to Employees table first, as it is referenced in foreign key
-- definition.

ALTER TABLE Salaries
ADD COLUMN id SERIAL PRIMARY KEY;

-- Create Titles Table.  I expected that there could be duplicate emp_no's, so did not define as 
-- primary key. Did define emp_no as foreign key and then added a serial primary key

CREATE TABLE Titles (
	emp_no VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no));

-- Add serial id as primary key.  Before adding, make sure to upload the data from the csv file.  Also need to make
-- sure to upload the data to Employees table first, as it is referenced in foreign key
-- definition.

ALTER TABLE Titles
ADD COLUMN id SERIAL PRIMARY KEY;

