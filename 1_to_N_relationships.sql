SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM order_items;

-- Q1
-- SELECT 
--     d.department_name, 
--     COUNT(*) AS total_employees, 
--     ROUND(AVG(e.salary), 2) AS average_salary,
--     MAX(e.salary) AS highest_salary,
--     MIN(e.salary) AS lowest_salary,
--     SUM(
--         CASE 
--             WHEN e.performance_rating >= 8 THEN 1
--             ELSE 0
--         END
--     ) AS pr_eq_or_gt_8
-- FROM departments d
-- JOIN employees e
-- ON d.department_id = e.department_id
-- GROUP BY d.department_id, d.department_name
-- HAVING COUNT(*) >= 3
-- ORDER BY average_salary DESC;




-- Q2
-- SELECT 
--     d.department_name, 
--     COUNT(*) AS total_employees, 
--     SUM(e.salary) AS total_salary_expenses,
--     ROUND(AVG(e.performance_rating), 2) AS average_performance_rating,
--     CASE 
--         WHEN
--             SUM(
--                 CASE 
--                     WHEN e.performance_rating >= 8 THEN 1
--                     ELSE 0
--                 END
--                 )  >= 2
--             THEN 'Strong'
--         ELSE 'Needs Review'
--         END AS performance_status
-- FROM departments d
-- JOIN employees e
-- ON d.department_id = e.department_id
-- GROUP BY d.department_id, d.department_name
-- HAVING SUM(e.salary) > 200000
-- ORDER BY total_salary_expenses DESC;



-- Q3
-- SELECT 
--     c.customer_name, 
--     COUNT(*) AS total_orders,
--     SUM(o.total_amount) AS total_order_amount,
--     ROUND(AVG(o.total_amount), 2) AS avg_order_amount,
--     CASE 
--         WHEN 
--             SUM(o.total_amount) >= 100000 
--                 THEN 'VIP'
--         WHEN 
--             SUM(o.total_amount) 
--                 BETWEEN 50000 AND 99999.99 
--                 THEN 'Regular'
--         ELSE 'Basic'
--     END AS customer_type
-- FROM customers c
-- JOIN orders o
-- ON c.customer_id = o.customer_id
-- GROUP BY c.customer_id, c.customer_name
-- HAVING COUNT(*) >= 2
-- ORDER BY total_order_amount DESC;



-- Q4
-- SELECT 
--     c.customer_name, 
--     COUNT(o.order_id) AS total_orders,

--     SUM (
--         CASE 
--             WHEN o.status = 'Delivered' THEN 1
--             ELSE 0
--         END 
--         ) AS delivered_orders,

--     SUM (
--         CASE 
--             WHEN o.status = 'Cancelled' THEN 1
--             ELSE 0
--         END 
--         ) AS cancelled_orders,

--     SUM (
--         CASE 
--             WHEN o.status = 'Delivered' THEN o.total_amount
--             ELSE 0
--         END 
--         ) AS total_value_of_delivered_orders,

--     CASE 
--         WHEN 
--             SUM (
--                 CASE 
--                     WHEN o.status = 'Delivered' THEN 1
--                     ELSE 0
--                 END 
--                 ) >= 2 THEN 'Active'

--         WHEN 
--             SUM (
--                 CASE 
--                     WHEN o.status = 'Delivered' THEN 1
--                     ELSE 0
--                 END 
--                 ) = 1 THEN 'At Risk'

--         WHEN 
--             SUM (
--                 CASE 
--                     WHEN o.status = 'Delivered' THEN 1
--                     ELSE 0
--                 END 
--                 ) = 0 THEN 'No Purchase'
--     END AS activity_status
        
-- FROM customers c
-- LEFT JOIN orders o
-- ON c.customer_id = o.customer_id
-- GROUP BY c.customer_id, c.customer_name
-- ORDER BY 
--     CASE 
--         WHEN SUM (
--                 CASE 
--                     WHEN o.status = 'Delivered' THEN 1
--                     ELSE 0
--                 END 
--                 ) 
--                 >= 2 THEN 0 

--         WHEN SUM (
--                 CASE 
--                     WHEN o.status = 'Delivered' THEN 1
--                     ELSE 0
--                 END 
--                 ) 
--                 = 1 THEN 1

--         ELSE 2 
--     END,
--     total_value_of_delivered_orders DESC;



-- Q5
