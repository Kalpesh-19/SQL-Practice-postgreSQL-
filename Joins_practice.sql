SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM employee_details;
SELECT * FROM projects;
SELECT * FROM employee_projects;

-- Q1
-- SELECT 
-- 	e.employee_id,
-- 	e.employee_name, 
-- 	d.department_name
-- FROM departments d
-- JOIN employees e
-- ON d.department_id = e.department_id;



-- Q2
-- SELECT 
-- 	d.department_id,
-- 	d.department_name,
-- 	e.employee_id,
-- 	e.employee_name
-- FROM departments d
-- LEFT JOIN employees e
-- ON d.department_id = e.department_id;


-- Q3
-- SELECT 
-- 	e.employee_name,
-- 	ed.email,  
-- 	ed.phone,
-- 	ed.city
-- FROM employees e
-- JOIN employee_details ed
-- ON e.employee_id = ed.employee_id;


-- Q4
-- SELECT 
--     e.employee_name, p.project_name, ep.hours_worked
-- FROM employee_projects ep
-- JOIN employees e
--     ON ep.employee_id = e.employee_id
-- JOIN projects p
--     ON ep.project_id = p.project_id;


-- Q5
-- SELECT 
--     e.employee_id, e.employee_name, e.department_id
-- FROM employees e
-- LEFT JOIN employee_projects ep
--     ON e.employee_id = ep.employee_id
--     WHERE ep.project_id IS NULL;


-- Q6
-- SELECT 
--     d.department_name, e.employee_id, e.employee_name
-- FROM employees e
-- RIGHT JOIN departments d
-- ON e.department_id  = d.department_id;


-- Q7
-- SELECT 
--     e.employee_name, m.employee_name AS manager_name, d.department_name
-- FROM employees e
-- JOIN employees m ON e.manager_id = m.employee_id
-- JOIN departments d ON e.department_id = d.department_id
-- WHERE e.manager_id IS NOT NULL;


-- Q8
-- SELECT d.department_name, p.project_id, p.project_name
-- FROM departments d 
-- FULL JOIN projects p
--     ON d.department_id = p.department_id;


-- Q9
-- SELECT 
--     d.department_name, 
--     p.project_name, 
--     CONCAT_WS(' - ', d.department_name, p.project_name) AS planning_label
-- FROM departments d
-- CROSS JOIN projects p;



-- Q10 (Incomplete)
-- SELECT d.department_name AS department_name , COUNT(*) AS employees_count
-- FROM departments d
-- JOIN employees e 
--     ON d.department_id = e.department_id
-- GROUP BY d.department_name;


-- SELECT p.department_id AS department_id, COUNT(*) AS project_count
-- FROM departments d
-- JOIN projects p
--     ON d.department_id = p.department_id
-- GROUP BY p.department_id;


-- SELECT d.department_name AS department_name , ROUND(AVG(salary), 2) AS avg_salary
-- FROM departments d
-- JOIN employees e 
--     ON d.department_id = e.department_id
-- GROUP BY d.department_name;


-- SELECT e.employee_name, ep.project_id
-- FROM employees e
-- LEFT JOIN employee_projects ep
-- ON e.employee_id = ep.employee_id
-- WHERE ep.project_id IS NULL;



