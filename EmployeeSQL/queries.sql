
-- 1.  List details of all employees.

SELECT Employees.emp_no, Employees.first_name, Employees.last_name, Employees.gender, Salaries.salary
FROM Employees
INNER JOIN Salaries ON
Employees.emp_no = Salaries.emp_no;

-- 2.  List details of employees that were hired in 1986.

SELECT Employees.emp_no, Employees.first_name, Employees.last_name, Employees.gender, Salaries.salary, Employees.hire_date
FROM Employees
INNER JOIN Salaries ON
Employees.emp_no = Salaries.emp_no
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-01';

-- 3. List the manager of each department with the following information: department number, 
--    department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT Departments.dept_no, Departments.dept_name, Dept_Manager.emp_no, Employees.first_name, Employees.last_name,
       Dept_Manager.from_date, Dept_Manager.to_date
FROM Departments
LEFT JOIN Dept_Manager
ON Departments.dept_no = Dept_Manager.dept_no
LEFT JOIN Employees
ON Employees.emp_no = Dept_Manager.emp_no;

-- 4.  List the department of each employee with the following information: employee number, last name, 
--     first name, and department name.

SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
LEFT JOIN Dept_Emp
ON Employees.emp_no = Dept_Emp.emp_no
LEFT JOIN Departments
ON Dept_Emp.dept_no = Departments.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
FROM EMPLOYEES
WHERE first_name='Hercules' AND last_name LIKE 'B%'

-- 6.  List all employees in the Sales department, including their employee number, last name, first name, 
--     and department name.

SELECT Departments.dept_name, Employees.emp_no, Employees.last_name, Employees.first_name
FROM Departments
LEFT JOIN Dept_Emp
ON Departments.dept_no = Dept_Emp.dept_no
LEFT JOIN Employees
ON Employees.emp_no = Dept_Emp.emp_no
WHERE Departments.dept_name='Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, 
--    last name, first name, and department name.

SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
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

