USE company_db;

# 1.Retrieve all employees from the employees table.
SELECT*FROM employees; 

# 2.Select employees working in the 'Sales' department.
SELECT*FROM employees
WHERE department_id=(SELECT department_id
FROM departments
WHERE department_name='Sales');

# 3.List unique job titles available.
SELECT DISTINCT job_title
FROM employees;

# 4.Sort employees by salary in descending order.
SELECT*FROM employees
ORDER BY salary DESC;

# 5.Count the total number of employees.
SELECT COUNT(*) AS total_employees
FROM employees;

# 6.Show the average salary per department.
SELECT department_id,AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;

# 7.join employees and departments to show employee name and department.
SELECT e.first_name,e.last_name,d.department_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id;
