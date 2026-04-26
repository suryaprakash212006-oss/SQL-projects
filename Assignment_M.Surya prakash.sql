USE company_db;
-- 1.Update the Salary of Employees in the 'Sales' Department by 10%
UPDATE employees e
JOIN departments d
ON e.department_id=d.department_id
SET e.salary=e.salary*1.10
WHERE d.department_name='Sales';

SELECT*FROM employees;

-- 2.Delete Employees Working in a Department Named 'Obsolete'
DELETE e 
FROM employees e 
JOIN departments d 
ON e.department_id=d.department_id
WHERE d.department_name='Obsolete';

SELECT*FROM employees;

-- 3.Create a View Showing High-Earning Employees(Salary>80,000)
CREATE VIEW high_earning_employees AS
SELECT *
FROM employees
WHERE salary>80000;

SELECT * FROM employees;

-- 4.Add a Check Constraints to Ensure Salary>0
ALTER TABLE employees
ADD CONSTRAINT chk_salary
CHECK(salary>0);

INSERT INTO employees
(employee_id,first_name,last_name,department_id,salary,hire_data,job_title)
VALUES(999,'test','user',101,-5000,'2024-01-01','tester');

-- 5.Create an Index on Employee Last Names for Faster Searching
CREATE INDEX idx_last_name
ON employees(last_name);

SHOW INDEX FROM employees;

-- 6.Create a Stored Procedure to Retrieve Employees of a Given Department
DELIMITER //
CREATE PROCEDURE get_employees_by_department(IN dept_name VARCHAR(100))
BEGIN
SELECT e.*
FROM employees e  
JOIN departments d 
ON e.department_id=d.department_id
WHERE d.department_name=dept_name;
END //
DELIMITER ;
 
CALL get_employees_by_department('Sales');