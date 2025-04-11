use javafs;
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);

CREATE VIEW sales_employees AS
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE department = 'Sales';

SELECT * FROM sales_employees;





use javafs;
desc sales_employees;

-- this is to update the exisiting view
CREATE OR REPLACE VIEW sales_employees AS
SELECT employee_id, first_name, last_name, salary, hire_date
FROM employees
WHERE department = 'Sales';

-- drop the view
DROP VIEW sales_employees;


-- You can now use INSERT, UPDATE, or DELETE statements on the sales_employees view,
-- and the changes will reflect in the employees table:

UPDATE sales_employees
SET salary = salary * 1.10
WHERE employee_id = 1;
