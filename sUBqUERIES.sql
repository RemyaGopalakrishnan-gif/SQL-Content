
SELECT * FROM EMPLOYEE;

-- SUBQUERY IS EXECUTED FIRST .OUTPUT OF SUBQUERY AS THE INPUT FOR THE MAIN QUERY

SELECT ENAME FROM Employee WHERE Salary < 
(SELECT AVG(Salary) FROM Employee);


SELECT eName, Salary
FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);


-- Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);



-- Insert data into departments table
INSERT INTO departments (department_id, department_name) VALUES
(1, 'Sales'),
(2, 'Marketing'),
(3, 'HR');

-- Insert data into employees table
INSERT INTO employees (employee_id, employee_name, department_id) VALUES
(101, 'Alice', 1),
(102, 'Bob', 1),
(103, 'Charlie', 2),
(104, 'Diana', 3);

/**Suppose you want to find the names of employees who work in the 'Sales' department.**/

SELECT employee_name
FROM employees
WHERE department_id = (SELECT department_id
                       FROM departments
                       WHERE department_name = 'Sales');
                       
 /**Suppose you want to include the department name along with each 
 employee’s name. You can use a subquery in the SELECT clause to 
 retrieve the department name.**/
 SELECT employee_name,
       (SELECT department_name
        FROM departments
        WHERE departments.department_id = employees.department_id) AS department_name
FROM employees;


/**Find employees who are in departments with more than 1 employee.**/

SELECT employee_name
FROM employees
WHERE department_id IN (SELECT department_id
                        FROM employees
                        GROUP BY department_id
                        HAVING COUNT(*) > 1);



/**Find departments that have at least one employee.**/


SELECT department_name
FROM departments d
WHERE EXISTS (SELECT 1
              FROM employees e
              WHERE e.department_id = d.department_id);


/**Find departments that do not have any employees.**/


SELECT department_name
FROM departments d
WHERE NOT EXISTS (SELECT 1
                  FROM employees e
                  WHERE e.department_id = d.department_id);



/**Find departments where the average employee ID is greater than 102.**/
SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(employee_id) > 102;
