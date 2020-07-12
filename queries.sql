--#1
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employee AS e
LEFT JOIN salaries AS s ON(e.emp_no = s.emp_no)
ORDER BY s.salary DESC;

--#2
SELECT first_name, last_name, hire_date
FROM employee
WHERE hire_date > '1986-12-31'
ORDER BY hire_date ASC;

--#3 (multiple managers for each department)
SELECT d_m.dept_no, d.dept_name, d_m.emp_no, e.last_name, e.first_name
FROM department_managers AS d_m LEFT JOIN departments AS d ON(d_m.dept_no = d.dept_no)
LEFT JOIN employee as e ON(d_m.emp_no = e.emp_no);

--#4 (some employees appear to be in multiple departments with no clear indication of priority dupes have been left in and table sorted by emp_no to group)
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee as e LEFT JOIN department_employees AS d_e ON(e.emp_no = d_e.emp_no)
LEFT JOIN departments as d on(d_e.dept_no = d.dept_no)
ORDER BY e.emp_no, d.dept_name;

--#5
Select first_name, last_name
FROM employee
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;

--#6
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee as e LEFT JOIN department_employees AS d_e ON(e.emp_no = d_e.emp_no)
LEFT JOIN departments as d on(d_e.dept_no = d.dept_no)
WHERE d.dept_no = 'd007'
ORDER BY e.emp_no, d.dept_name;

--#7
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee as e LEFT JOIN department_employees AS d_e ON(e.emp_no = d_e.emp_no)
LEFT JOIN departments as d on(d_e.dept_no = d.dept_no)
WHERE d.dept_no = 'd007' OR d.dept_no = 'd005'
ORDER BY e.emp_no, d.dept_name;

--#8
SELECT last_name, COUNT(*)
FROM employee
GROUP BY last_name
ORDER BY count DESC;