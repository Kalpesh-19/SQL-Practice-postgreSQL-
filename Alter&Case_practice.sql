-- Q1
-- ALTER TABLE employees
-- ADD COLUMN bonus NUMERIC(10, 2);


-- SELECT 
--     employee_id,
--     first_name,
--     salary,
--     CASE 
--         WHEN salary >= 100000 THEN (0.15 * salary)
--         WHEN salary >= 70000 THEN (0.1 * salary)
--         WHEN salary >= 50000 THEN (0.07 * salary)
--         ELSE (0.05 * salary)
--     END AS bonus
-- FROM employees;



-- Q2
-- ALTER TABLE employees
-- RENAME COLUMN performance_score TO performance_rating;


-- SELECT 
--     first_name,
--     performance_rating,
--     CASE
--         WHEN performance_rating BETWEEN 9 AND 10 THEN 'Excellent'
--         WHEN performance_rating BETWEEN 7 AND 8 THEN 'Good'
--         WHEN performance_rating BETWEEN 5 AND 6 THEN 'Average'
--         ELSE 'Poor'
--     END AS performance_category
-- FROM employees;



-- Q3
-- ALTER TABLE employees
-- ADD COLUMN job_level VARCHAR(50) DEFAULT 'Entry';

-- SELECT 
--     employee_id,
--     first_name,
--     experience_years,
--     job_level,
--     CASE
--         WHEN experience_years >= 8 THEN 'Senior'
--         WHEN experience_years >= 5 THEN 'Mid-level'
--         WHEN experience_years >= 2 THEN 'Junior'
--         ELSE 'Entry'
--     END AS calculated_level
-- FROM employees;



-- -- Q4
-- ALTER TABLE employees
-- ALTER COLUMN salary TYPE NUMERIC(10, 2);


-- SELECT 
--     first_name,
--     salary,
--     CASE 
--         WHEN salary >= 100000 THEN 'High Salary'
--         WHEN salary >= 70000 THEN 'Above Average'
--         WHEN salary >= 50000 THEN 'Average'
--         ELSE 'Low Salary'
--     END AS salary_range
-- FROM employees;



-- Q5
-- ALTER TABLE employees
-- ADD CONSTRAINT check_performance_rating CHECK(performance_rating BETWEEN 1 AND 10);


-- SELECT 
--     first_name,
--     performance_rating,
--     CASE
--         WHEN performance_rating BETWEEN 9 AND 10 THEN 'Top Performer'
--         WHEN performance_rating BETWEEN 7 AND 8 THEN 'Good Performer'
--         WHEN performance_rating BETWEEN 5 AND 6 THEN 'Needs Improvement'
--         ELSE 'Poor Performer'
--     END AS performance_status
-- FROM employees;



-- Q6
-- ALTER TABLE employees
-- ADD COLUMN employee_grade CHAR(1);


-- SELECT 
--     first_name,
--     salary,
--     performance_rating,
--     CASE
--         WHEN salary >= 100000 AND performance_rating >= 9 THEN 'A+'
--         WHEN salary >= 80000 AND performance_rating >= 8 THEN 'A'
--         WHEN salary >= 60000 AND performance_rating >= 7 THEN 'B'
--         WHEN salary >= 50000 AND performance_rating >= 6 THEN 'C'
--         ELSE 'D'
--     END AS employee_grade
-- FROM employees;


-- ALTER TABLE employees
-- ALTER COLUMN employee_grade TYPE VARCHAR(2);



-- Q7
-- ALTER TABLE employees
-- DROP COLUMN city;


-- SELECT 
--     first_name,
--     experience_years,
--     employment_status,
--     CASE 
--         WHEN employment_status = 'Active' AND experience_years >= 5 THEN 'Experienced Active Employee'
--         WHEN employment_status = 'Active' AND experience_years <  5 THEN 'Junior Active Employee'
--         WHEN employment_status = 'Inactive' THEN 'Inactive Employee'
--         WHEN employment_status = 'Probation' THEN 'Probation Employee'
--     END AS employee_category
-- FROM employees;


-- Q8
-- ALTER TABLE employees
-- RENAME TO company_employees;


-- SELECT 
--     employee_id,
--     first_name,
--     salary,
--     CASE
--         WHEN salary >= 100000 THEN 'High'
--         WHEN salary >= 70000 THEN 'Medium-high'
--         WHEN salary >= 50000 THEN 'Medium'
--         ELSE 'Low'
--     END AS salary_category,
--     experience_years,
--     CASE
--         WHEN experience_years >= 7 THEN 'Veteran'
--         WHEN experience_years >= 4 THEN 'Experienced'
--         WHEN experience_years >= 2 THEN 'Junior'
--         ELSE 'Fresher'
--     END AS experience_category
-- FROM company_employees;


-- Q9
-- ALTER TABLE company_employees
-- ADD COLUMN promotion_status VARCHAR(100);


-- SELECT 
--     first_name, 
--     experience_years,
--     performance_rating,
--     employment_status,
--     CASE
--         WHEN performance_rating >= 8 
--             AND experience_years >= 3 
--             AND employment_status = 'Active' 
--             THEN 'Eligible for promotion'
--         ELSE 'Not Eligible'
--     END AS promotion_status,
--     CASE 
--         WHEN performance_rating >= 9 
--             AND experience_years >= 5 
--             THEN 'High Priority'
--         WHEN performance_rating >= 8 
--             AND experience_years >= 3 
--             THEN 'Medium Priority'
--         ELSE 'Low Priority'
--     END AS promotion_priority
-- FROM company_employees;


-- Q10
-- ALTER TABLE company_employees
-- ADD COLUMN annual_bonus NUMERIC(10, 2) CHECK(annual_bonus >= 0);

-- ALTER TABLE company_employees
-- RENAME COLUMN job_level TO employee_level;

-- SELECT 
--     employee_id, 
--     first_name, 
--     department, 
--     salary, 
--     performance_rating,
--     experience_years, 
--     employee_level,
--     CASE 
--         WHEN 
--             performance_rating >= 9 
--             AND salary >= 100000 
--             THEN '20%'
--         WHEN 
--             performance_rating >= 8 
--             AND salary >= 80000 
--             THEN '15%'
--         WHEN 
--             performance_rating >= 7 
--             AND salary >= 60000 
--             THEN '10%'
--         ELSE '5%'
--     END AS bonus_percentage,
--     CASE 
--         WHEN 
--             employment_status = 'Inactive' 
--             THEN 'Not Eligible'
--         WHEN 
--             employment_status = 'Active' 
--             AND performance_rating >= 8 
--             AND experience_years >= 5 
--             THEN 'Promotion Ready'
--         WHEN 
--             employment_status = 'Active'
--             AND performance_rating >= 7 
--             THEN 'Performing Well'
--         WHEN 
--             employment_status = 'Active'
--             THEN 'Needs Review'
--         WHEN 
--             employment_status = 'Probation'
--             THEN 'Under Evaluation'
--     END AS Employee_status,
--     salary * 
--             CASE
--                 WHEN  
--                     performance_rating >= 9 
--                     AND salary >= 100000 
--                     THEN 0.2
--                 WHEN 
--                     performance_rating >= 8 
--                     AND salary >= 80000 
--                     THEN 0.15
--                 WHEN
--                     performance_rating >= 7 
--                     AND salary >= 60000 
--                     THEN 0.1
--                 ELSE 0.05
--     END AS bonus_amount
-- FROM company_employees;

