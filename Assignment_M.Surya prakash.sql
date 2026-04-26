USE company_db;

-- 1.Transaction To Transfer Salary
START TRANSACTION;
UPDATE employees
SET salary=salary-1000
WHERE employee_id=101;
UPDATE employees
SET salary=salary+1000
WHERE employe_id=102;
COMMIT;
SELECT employee_id,first_name,salary
FROM employees
WHERE employee_id IN (101,102);

-- 2.Departments with Employees
SELECT d.*
FROM departments d 
WHERE EXISTS(
SELECT 1
FROM employees e 
WHERE e.department_id=d.department_id);

-- 3.Recursive CTE for employee_Manager Hierarchy
WITH RECURSIVE emp_hierarchy AS (
SELECT employee_id,first_name,last_name,manager_id
FROM employees
WHERE manager_id IS NULL

UNION ALL 

SELECT e.employee_id,e.first_name,e.last_name,e.manager_id
FROM employees e
JOIN emp_hierarchy eh 
ON e.manager_id=eh.employee_id
)
SELECT*FROM emp_hierarchy;

-- 4.LEAD and LAG for salaries
SELECT 
employee_id,
first_name,
last_name,
salary,
LAG(salary)OVER(ORDER BY salary) AS previous_salary, 
LEAD(salary)OVER(ORDER BY salary) AS next_salary
FROM employees;

-- 5.Salary Toatals with ROLLUP
SELECT
department_id,
SUM(salary)AS total_salary
FROM employees
GROUP BY department_id WITH ROLLUP;
