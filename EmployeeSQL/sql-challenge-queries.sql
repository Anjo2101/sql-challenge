SELECT * FROM employees LIMIT 100;
SELECT * FROM salaries LIMIT 100;
SELECT * FROM departments LIMIT 100;
SELECT * FROM dept_manager LIMIT 100;
SELECT * FROM dept_emp LIMIT 100;
--List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name,
		employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON 
employees.emp_no = salaries.salary
LIMIT 100;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%%/%%/1986'
LIMIT 100;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT employees.first_name, employees.last_name, 
departments.dept_name, departments.dept_no
FROM departments
JOIN dept_manager ON (departments.dept_no=dept_manager.dept_no)
JOIN employees ON (employees.emp_no=dept_manager.emp_no);

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name,
departments.dept_name, departments.dept_no
FROM employees
JOIN dept_emp ON (employees.emp_no=dept_emp.emp_no)
JOIN departments ON (dept_emp.dept_no=departments.dept_no) LIMIT 100;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT employees.emp_no, employees.first_name, employees.last_name,
dept_name
FROM employees
JOIN dept_emp ON (employees.emp_no=dept_emp.emp_no)
JOIN departments ON (dept_emp.dept_no=departments.dept_no)
WHERE departments.dept_name = 'Sales' LIMIT 100;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name,
dept_name
FROM employees
JOIN dept_emp ON (employees.emp_no=dept_emp.emp_no)
JOIN departments ON (dept_emp.dept_no=departments.dept_no)
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development' LIMIT 100;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC LIMIT 100;