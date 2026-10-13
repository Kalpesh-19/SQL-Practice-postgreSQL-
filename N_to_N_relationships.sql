SELECT * FROM students;

SELECT * FROM courses;

SELECT * FROM enrollments;

-- Q1
-- SELECT 
--     s.student_id, 
--     s.student_name, 
--     COUNT(er.course_id) AS total_courses
-- FROM students s
-- LEFT JOIN enrollments er
--     ON s.student_id = er.student_id
-- GROUP BY s.student_id
-- ORDER BY total_courses DESC, 
--          s.student_name ASC;


-- Q2
-- SELECT 
--     c.course_id, 
--     c.course_name, 
--     c.category, 
--     COUNT(en.student_id) AS total_students
-- FROM courses c
-- LEFT JOIN enrollments en
-- ON c.course_id = en.course_id
-- GROUP BY c.course_id
-- ORDER BY total_students DESC;


-- Q3
-- SELECT 
--     c.course_name, 
--     ROUND ( AVG(
--         CASE 
--             WHEN en.enrollment_status = 'Completed' THEN en.marks 
--         END
--     ), 2) AS average_marks,

--     MAX(
--         CASE 
--             WHEN en.enrollment_status = 'Completed' THEN en.marks 
--         END
--         ) AS highest_marks, 

--     MIN(
--         CASE 
--             WHEN en.enrollment_status = 'Completed' THEN en.marks 
--         END
--         ) AS lowest_marks,

--     SUM (
--         CASE
--             WHEN en.enrollment_status = 'Completed' 
--                 THEN 1
--             ELSE 0
--         END
--     ) AS completed_students

-- FROM courses c
-- LEFT JOIN enrollments en
--     ON c.course_id = en.course_id
-- GROUP BY c.course_id
-- HAVING ROUND ( AVG(
--         CASE 
--             WHEN en.enrollment_status = 'Completed' THEN en.marks 
--         END
--     ), 2)  >= 80
-- ORDER BY average_marks DESC;


-- Q4
-- SELECT 
--     s.student_name,
--     COUNT(en.course_id) AS total_courses,
--     ROUND(AVG(en.marks), 2) AS average_marks,
--     MAX(en.marks) AS highest_marks,
--     MIN(en.marks) AS lowest_marks
-- FROM students s
-- LEFT JOIN enrollments en
--     ON s.student_id = en.student_id
-- GROUP BY s.student_id
-- HAVING ROUND(AVG(en.marks), 2) >= 85
-- ORDER BY average_marks DESC;


-- Q5
-- SELECT 
--     c.course_name, 
--     c.category, 
--     COUNT(en.course_id) AS total_Student,
--     ROUND ( AVG( 
--         CASE 
--             WHEN en.enrollment_status = 'Completed' THEN en.marks
--         END
--     ), 2) AS average_marks,

--     SUM ( 
--         CASE 
--             WHEN en.marks >= 90 THEN 1
--             ELSE 0
--         END
--     ) AS high_scores,

--     CASE 
--         WHEN
--             ROUND ( AVG( 
--                 CASE 
--                     WHEN en.enrollment_status = 'Completed' THEN en.marks
--                 END
--             ), 2)  >= 90 THEN 'Excellent'

--         WHEN
--             ROUND ( AVG( 
--                 CASE 
--                     WHEN en.enrollment_status = 'Completed' THEN en.marks
--                 END
--             ), 2)  >= 80 THEN 'Good'

--         ELSE 'Needs Improvement'
    
--     END AS performance_level
-- FROM courses c
-- LEFT JOIN enrollments en
-- ON c.course_id = en.course_id
-- GROUP BY c.course_id
-- HAVING COUNT(en.course_id) >= 2
-- ORDER BY c.category ASC,  
--         average_marks DESC;