SELECT * FROM employees;
SELECT * FROM products;
SELECT * FROM students;

-- Q1
-- CREATE PROCEDURE update_salary (em_id INT, new_salary NUMERIC)
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN 
--     IF new_salary > 0  THEN 
    
--         UPDATE employees
--         SET salary = new_salary
--         WHERE employee_id = em_id;

--     ELSE 
--         RAISE NOTICE 'Invalid salary. Salary must be greater than 0.';

--     END IF;

-- END;
-- $$;

-- CALL update_salary(1, 60000.00)

-- SELECT * FROM employees
-- WHERE employee_id = 1;



-- Q2
-- CREATE PROCEDURE change_status (em_id INT, new_status VARCHAR)
-- LANGUAGE plpgsql
-- AS $$ 
-- BEGIN
--     IF new_status IN ('Active', 'Inactive') THEN

--         UPDATE employees
--         SET status = new_status
--         WHERE employee_id = em_id;

--     ELSE 

--         RAISE NOTICE 'Invalid status. Status must be Active or Inactive.';
    
--     END IF;
    
-- END;
-- $$;

-- CALL change_status(4, 'Active');

-- SELECT * FROM employees
-- WHERE employee_id = 4;



-- Q3
-- CREATE PROCEDURE add_product (p_name VARCHAR, p_price NUMERIC, p_stock INT)
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN 
--     IF p_price > 0 AND p_stock >= 0 THEN 
--         INSERT INTO products(product_name, price, stock)
--         VALUES
--             (p_name, p_price, p_stock);
--     ELSE 
--         RAISE NOTICE 'Invalid input. Price must be greater than 0 and stock cannot be negative.';

--     END IF;
-- END;
-- $$;

-- CALL add_product('Keyboard Mouse Combo', 799.50, 5); -- Valid Call

-- SELECT * FROM products; -- Verify

-- CALL add_product('Toothpaste', 0, 0); -- Invalid Call


-- Q4
-- CREATE PROCEDURE update_result (s_id INT, student_marks INT)
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
--     IF student_marks >= 40 THEN 
--         UPDATE students
--         SET result = 'Pass'
--         WHERE student_id = s_id;

--     ELSE 
--         UPDATE students
--         SET result = 'Fail'
--         WHERE student_id = s_id;

--     END IF;
-- END;
-- $$;

-- CALL update_result(1, 85);
-- CALL update_result(2, 42);
-- CALL update_result(3, 67);
-- CALL update_result(4, 91);
-- CALL update_result(5, 35);

-- SELECT * FROM students;



-- Q5
-- CREATE PROCEDURE manage_stock (p_id INT, p_quantity INT, p_operation VARCHAR)
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN 
--     IF p_quantity > 0 AND p_operation IN ('Add', 'Remove') THEN

--         IF p_operation = 'Add' THEN
--             UPDATE products
--             SET stock = stock + p_quantity
--             WHERE product_id = p_id;

--         ELSIF p_operation = 'Remove' THEN
--             UPDATE products
--             SET stock = stock - p_quantity
--             WHERE product_id = p_id
--             AND stock >= p_quantity;
        
--         END IF;

--     ELSE 
--         RAISE NOTICE 'Quantity must be greater than 0 & operation must be Add or Remove.';

--     END IF;

-- END;
-- $$;


-- CALL manage_stock (3, 5, 'Add');

-- SELECT * FROM products;

-- CALL manage_stock (1, 11, 'Remove');