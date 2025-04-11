use dataanalaytics;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees (employee_id, name, department, salary) VALUES
(1, 'Alice',   'Sales', 50000),
(2, 'Bob',     'Sales', 60000),
(3, 'Charlie', 'Sales', 45000),
(4, 'David',   'IT',    70000),
(5, 'Eva',     'IT',    80000),
(6, 'Frank',   'IT',    75000);

-- Rank Employees by Salary Within Each Department

SELECT
    employee_id,
    name,
    department,
    salary,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_in_dept
FROM employees;













-- Running Total of Salaries (Company-wide)
SELECT
    employee_id,
    name,
    salary,
    SUM(salary) OVER (ORDER BY salary) AS running_total
FROM employees;


-- Compare Each Employee's Salary with Previous and Next

SELECT
    employee_id,
    name,
    salary,
    LAG(salary) OVER (ORDER BY salary) AS previous_salary,
    LEAD(salary) OVER (ORDER BY salary) AS next_salary
FROM employees;


-- Rank Employees by Salary Within Department (with Ties)
SELECT
    employee_id,
    name,
    department,
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM employees;



SELECT
    employee_id,
    name,
    department,
    salary,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_dense_rank
FROM employees;


SELECT
    employee_id,
    name,
    salary,
    NTILE(4) OVER (ORDER BY salary DESC) AS salary_quartile
FROM employees;