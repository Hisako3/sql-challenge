-- 1. List the employee number, last name, first name, sex, salary of each employee.
SELECT
	employee.emp_no,
	employee.last_name,
	employee.first_name,
	employee.sex,
	salaries.salary
FROM employee
INNER JOIN salaries
ON salaries.emp_no = employee.emp_no;

-- 2. List the first name, last name, hire date for employees who were hired in 1986.
SELECT
	employee.first_name,
	employee.last_name,
	employee.hire_date
FROM employee
Where employee.hire_date LIKE '%1986';

-- 3. List the manager of each department along with their department number, 
-- department name, employee number,last name, and first name.
SELECT
	dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employee.last_name,
	employee.first_name
FROM dept_manager 
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
Inner JOIN employee ON dept_manager.emp_no = employee.emp_no;
	
-- 4. List the department number for each employee along with that employee’s employee number,
-- last name, first name, and department name.
SELECT
	dept_emp.dept_no,
	employee.emp_no,
	employee.last_name,
	employee.first_name,
	departments.dept_name
FROM dept_emp
INNER JOIN employee ON dept_emp.emp_no = employee.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no ;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules
-- and whose last name begins with the letter B.
SELECT
	employee.first_name,
	employee.last_name,
	employee.sex
FROM employee
Where first_name = 'Hercules'
AND last_name LIKE 'B%' ;

-- 6. List each employee in the Sales department, including their employee number, 
-- last name, and first name.
SELECT
	dept_emp.dept_no,
	employee.emp_no,
	employee.last_name,
	employee.first_name
FROM dept_emp
INNER JOIN employee ON dept_emp.emp_no = employee.emp_no 
WHERE dept_emp.dept_no = 'd007';

-- 7. List each employee in the Sales and Development departments, including their employee number,
-- last name, first name, and department name.
--Attempt 1
SELECT emp_no, last_name,
	first_name, dept_name
FROM employee
WHERE emp_no IN
(
  SELECT emp_no
  FROM dept_emp
  WHERE dept_name IN
	(SELECT dept_name
	 FROM departments
	 Where dept_name = 'Sales' OR 'Development'
));
--Attempt 2
SELECT
	employee.emp_no,
	employee.last_name,
	employee.first_name
-- 	departments.dept_name
FROM dept_emp
INNER JOIN employee ON dept_emp.emp_no = employee.emp_no
WHERE dept_emp.dept_no = 'd007'OR dept_emp.dept_no = 'd005' ;

-- 8. List the frequency counts, in descending order,
-- of all the employee last names (that is, how many employees share each last name).
SELECT employee.last_name, 
COUNT(employee.last_name) AS frequency 
FROM employee GROUP BY employee.last_name ORDER BY frequency DESC ;