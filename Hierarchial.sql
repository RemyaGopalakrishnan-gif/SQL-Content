CREATE TABLE employeesNew (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT
);

INSERT INTO employeesNew (id, name, manager_id) VALUES
(1, 'Alice (CEO)', NULL),
(2, 'Bob (CTO)', 1),
(3, 'Charlie (CFO)', 1),
(4, 'David (Dev Manager)', 2),
(5, 'Eve (Developer)', 4),
(6, 'Frank (Intern)', 5);



WITH RECURSIVE employee_hierarchy AS (
    SELECT 
        id,
        name,
        manager_id,
        1 AS level,
        CAST(name AS CHAR(1000)) AS path
    FROM employeesNew
    WHERE manager_id IS NULL  -- Root (e.g., CEO)

    UNION ALL

    SELECT 
        e.id,
        e.name,
        e.manager_id,
        eh.level + 1,
        CONCAT(eh.path, ' → ', e.name)
    FROM employeesNew e
    JOIN employee_hierarchy eh ON e.manager_id = eh.id
)
SELECT * FROM employee_hierarchy;





-- WITH RECURSIVE employee_hierarchy AS (...)
-- Defines a CTE named employee_hierarchy that can reference itself (i.e., it’s recursive).

-- SELECT 
--     id,
--     name,
--     manager_id,
--     1 AS level,
--     CAST(name AS CHAR(1000)) AS path
-- FROM employees
-- WHERE manager_id IS NULL
-- Finds top-level employees (like the CEO) who don’t report to anyone.
-- Sets the hierarchy level to 1.
-- Initializes the path with the employee's name.

-- Recursive Member
-- SELECT 
--     e.id,
--     e.name,
--     e.manager_id,
--     eh.level + 1,
--     CONCAT(eh.path, ' → ', e.name)
-- FROM employees e
-- JOIN employee_hierarchy eh ON e.manager_id = eh.id

-- Finds employees who report to someone already in the hierarchy (e.manager_id = eh.id).

-- Increases their level.

-- Appends their name to the hierarchical path.

