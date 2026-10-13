SELECT * FROM employees;
SELECT * FROM employee_details;

-- Q1
-- SELECT 
--     e.employee_id, 
--     e.employee_name, 
--     e.department, 
--     e.salary, 
--     ed.phone, 
--     ed.address, 
--     ed.emergency_contact
-- FROM employees e
-- LEFT JOIN employee_details ed
-- ON e.employee_id = ed.employee_id
-- ORDER BY e.employee_id;


-- Q2
-- SELECT 
--     e.employee_id,
--     e.employee_name,
--     e.department,
--     e.salary
-- FROM employees e
-- LEFT JOIN employee_details ed
--     ON e.employee_id = ed.employee_id
-- WHERE ed.employee_id IS NULL
-- ORDER BY e.employee_id;



-- Q3
-- SELECT  
--     e.employee_id,
--     e.employee_name,
--     e.department,
--     e.salary,
--     ed.phone,
--     ed.address
-- FROM employees e
-- LEFT JOIN employee_details ed
-- ON e.employee_id = ed.employee_id
-- WHERE ed.phone IS NOT NULL 
--     AND ed.address IS NOT NULL
-- ORDER BY e.salary DESC;


-- Q4
-- SELECT 
--     e.department, 
--     COUNT(*) AS total_employees,
--     SUM(
--         CASE 
--         WHEN ed.employee_id IS NOT NULL THEN 1
--             ELSE 0
--         END 
--         ) AS employees_with_details,
--     SUM(
--         CASE 
--             WHEN ed.employee_id IS NULL THEN 1
--             ELSE 0
--         END 
--         ) AS employees_without_details
-- FROM employees e
-- LEFT JOIN employee_details ed 
--     ON e.employee_id = ed.employee_id
-- GROUP BY e.department
-- HAVING COUNT(*) >= 2
-- ORDER BY employees_without_details DESC;



-- Q5
-- SELECT 
--     e.department, 
--     COUNT(*) AS total_employees, 
--     ROUND(AVG(e.salary), 2) AS average_salary, 
--     MAX(e.salary) AS highest_salary,
--     MIN(e.salary) AS lowest_salary,
--     SUM(
--         CASE 
--             WHEN ed.employee_id IS NOT NULL THEN 1
--             ELSE 0
--         END
--         ) AS employees_with_details
-- FROM employees e
-- LEFT JOIN employee_details ed
--     ON e.employee_id = ed.employee_id
-- GROUP BY e.department
-- HAVING AVG(e.salary) > 80000
-- ORDER BY average_salary DESC;