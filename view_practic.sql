SELECT * FROM students;

SELECT * FROM courses;

SELECT * FROM enrollments;

--------------------------------------------------------------------------

-- Q1
-- CREATE VIEW active_students_view AS
-- SELECT 
--     student_id,
--     student_name, 
--     department,
--     city,
--     admission_year
-- FROM students
-- WHERE status = 'Active';

-- SELECT * FROM active_students_view;

-- SELECT 
--     student_id,
--     student_name,
--     admission_year,
--     department
-- FROM active_students_view
-- WHERE  department = 'Computer'
-- ORDER BY admission_year DESC, 
--         student_name ASC;

--------------------------------------------------------------------------

-- Q2
-- CREATE VIEW course_performance_view AS 
-- SELECT 
--     c.course_id, 
--     c.course_name, 
--     c.category,
--     COUNT(en.student_id) AS total_enrollments, 

--     SUM(
--         CASE 
--             WHEN en.enrollment_status = 'Completed' THEN 1
--         END
--     ) AS completed_enrollments,

--     ROUND( AVG(
--         CASE 
--             WHEN en.enrollment_status = 'Completed' THEN en.marks
--         END
--     ) , 2) AS average_completed_marks

-- FROM courses c
-- LEFT JOIN enrollments en
-- ON c.course_id = en.course_id
-- GROUP BY c.course_id,
--          c.course_name,
--          c.category;


-- SELECT * FROM course_performance_view
-- WHERE average_completed_marks >= 80 
-- ORDER BY average_completed_marks DESC;


-- SELECT * FROM course_performance_view;

-----------------------------------------------------------------------------

-- Q3
-- CREATE VIEW student_academic_summary AS 
-- SELECT 
--     s.student_id, 
--     s.student_name, 
--     s.department,
--     COUNT(en.student_id) AS total_courses,

--     SUM (
--         CASE 
--             WHEN en.enrollment_status = 'Completed' THEN 1
--             ELSE 0
--         END 
--     ) AS completed_courses, 

--     ROUND (AVG(
--         CASE
--             WHEN en.enrollment_status = 'Completed' THEN en.marks
--         END
--     ), 2) AS average_marks

-- FROM students s
-- JOIN enrollments en
-- ON s.student_id = en.student_id
-- GROUP BY s.student_id,
--          s.student_name, 
--          s.department;

-- SELECT * FROM student_academic_summary;

-- SELECT * 
-- FROM student_academic_summary
-- WHERE department IN ('IT', 'Computer') 
--     AND completed_courses >= 2
--     AND average_marks >= 80;

-----------------------------------------------------------------------------

-- Q4
-- CREATE VIEW course_analysis_view AS
-- SELECT 
--     c.course_name,
--     c.category,
--     c.fee,
--     COUNT(en.course_id) AS total_students,
--     ROUND( AVG(
--         CASE 
--             WHEN en.enrollment_status = 'Completed' THEN en.marks
--         END
--     ), 2) AS average_marks,

--     MAX(
--         CASE 
--             WHEN en.enrollment_status = 'Completed' THEN en.marks
--         END
--     ) AS highest_marks, 

--     CASE 
--         WHEN 
--             ROUND( AVG(
--                 CASE 
--                     WHEN en.enrollment_status = 'Completed' THEN en.marks
--                 END
--                 ), 2) >= 85 THEN 'Excellent'

--         WHEN 
--             ROUND( AVG(
--             CASE 
--                 WHEN en.enrollment_status = 'Completed' THEN en.marks
--             END
--             ), 2) >= 70 THEN 'Good'

--         WHEN
--             ROUND( AVG(
--             CASE 
--                 WHEN en.enrollment_status = 'Completed' THEN en.marks
--             END
--             ), 2) >= 50 THEN 'Average'

--         ELSE 'Needs Improvement'
--     END AS performance_level     
-- FROM courses c 
-- LEFT JOIN enrollments en
-- ON c.course_id = en.course_id
-- GROUP BY c.course_id, 
--          c.course_name, 
--          c.category,
--          c.fee;


-- SELECT * FROM course_analysis_view;

-- SELECT * 
-- FROM course_analysis_view
-- WHERE category = 'AI/ML'
-- ORDER BY average_marks DESC;

-----------------------------------------------------------------------------

-- Q5
-- CREATE VIEW training_dashboard_view AS 
-- SELECT 
--     c.course_id,
--     c.course_name,
--     c.category,

--     SUM(
--         CASE 
--             WHEN en.enrollment_status IN ('Completed', 'Enrolled', 'Dropped') 
--             THEN 1
--             ELSE 0
--         END 
--     ) AS total_enrollment,

--     SUM (
--         CASE 
--             WHEN en.enrollment_status = 'Completed' 
--             THEN 1
--             ELSE 0
--         END 
--     ) AS total_completed,

--     SUM (
--         CASE 
--             WHEN en.enrollment_status = 'Dropped' 
--             THEN 1
--             ELSE 0
--         END 
--     ) AS total_dropped,

--     ROUND(
--         AVG(
--             CASE 
--                 WHEN en.enrollment_status = 'Completed'
--                 THEN en.marks
--             END
--             ), 
--             2
--     ) AS average_marks,

--     SUM(
--         CASE 
--             WHEN en.enrollment_status = 'Completed' 
--                 AND en.marks >= 85 
--             THEN 1
--             ELSE 0
--         END  
--     ) AS high_scores,

--     ROUND(
--         (
--             SUM (
--                 CASE 
--                     WHEN en.enrollment_status = 'Completed' 
--                     THEN 1
--                     ELSE 0
--                 END 
--                 ) * 100.0
--         /  NULLIF(
--                 SUM(
--                     CASE 
--                         WHEN en.enrollment_status IN ('Completed', 'Enrolled', 'Dropped') 
--                         THEN 1
--                         ELSE 0
--                     END 
--                     ), 
--                 0
--                )
--         ), 
--         2
--     ) AS completion_rate

-- FROM courses c
-- LEFT JOIN enrollments en
-- ON c.course_id = en.course_id
-- GROUP BY 
--         c.course_id,
--         c.course_name,
--         c.category;

-- SELECT * FROM training_dashboard_view;

-- SELECT * 
-- FROM training_dashboard_view
-- WHERE completion_rate >= 70 AND average_marks >= 75
-- ORDER BY 
--         completion_rate DESC,
--         average_marks DESC;

-----------------------------------------------------------------------------
