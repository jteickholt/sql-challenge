
-- 1.  List details of all employees.  I do a left join as I want to include all employees, whether or
--     not they are in the salaries file. 

SELECT Employees.emp_no AS "Employee #", Employees.first_name AS "First Name", Employees.last_name AS "Last Name", 
Employees.gender AS "Gender", Salaries.salary AS "Salary"
FROM Employees
LEFT JOIN Salaries ON
Employees.emp_no = Salaries.emp_no;

-- 2.  List details of employees that were hired in 1986.  I do a left join as I want to include all employees, whether or
--     not they are in the salaries file.

SELECT Employees.emp_no AS "Employee #", Employees.first_name AS "First Name", Employees.last_name AS "Last Name", 
Employees.gender AS "Gender", Salaries.salary AS "Salary", Employees.hire_date AS "Hire Date"
FROM Employees
LEFT JOIN Salaries ON
Employees.emp_no = Salaries.emp_no
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-01';

-- 3. List the manager of each department with the following information: department number, 
--    department name, the manager's employee number, last name, first name, and start and end employment dates.
--	  Use left joins to make sure all departments and managers are included even if not in the Employees table.

SELECT Departments.dept_no AS "Department #", Departments.dept_name AS "Department", Dept_Manager.emp_no "Employee #",
Employees.first_name AS "First Name", Employees.last_name AS "Last Name",
Dept_Manager.from_date AS "Start Date", Dept_Manager.to_date AS "End Date"
FROM Departments
LEFT JOIN Dept_Manager
ON Departments.dept_no = Dept_Manager.dept_no
LEFT JOIN Employees
ON Employees.emp_no = Dept_Manager.emp_no;

-- 4.  List the department of each employee with the following information: employee number, last name, 
--     first name, and department name.  USE left join to make sure all employees included, whether or
--     not they are included in the other files

SELECT Employees.emp_no AS "Employee #", Employees.last_name AS "Last Name", Employees.first_name AS "First Name",
Departments.dept_name AS "Department Name"
FROM Employees
LEFT JOIN Dept_Emp
ON Employees.emp_no = Dept_Emp.emp_no
LEFT JOIN Departments
ON Dept_Emp.dept_no = Departments.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name AS "First Name", last_name AS "Last Name"
FROM EMPLOYEES
WHERE first_name='Hercules' AND last_name LIKE 'B%'

-- 6.  List all employees in the Sales department, including their employee number, last name, first name, 
--     and department name.

SELECT Employees.emp_no AS "Employee #", Employees.last_name AS "Last Name",
Employees.first_name AS "First Name", Departments.dept_name AS "Department Name"
FROM Departments
LEFT JOIN Dept_Emp
ON Departments.dept_no = Dept_Emp.dept_no
LEFT JOIN Employees
ON Employees.emp_no = Dept_Emp.emp_no
WHERE Departments.dept_name='Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, 
--    last name, first name, and department name.

SELECT Employees.emp_no AS "Employee #", Employees.last_name AS "Last Name", 
Employees.first_name AS "First Name", Departments.dept_name AS "Department Name"
FROM Departments
LEFT JOIN Dept_Emp
ON Departments.dept_no = Dept_Emp.dept_no
LEFT JOIN Employees
ON Dept_Emp.emp_no = Employees.emp_no
WHERE Departments.dept_name = 'Sales' OR Departments.dept_name = 'Development'

-- 8.  In descending order, list the frequency count of employee last names, i.e., how many employees 
--     share each last name.

SELECT last_name AS "Last Name", COUNT(last_name) AS "Number of Employees"
FROM Employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

