
USE StudentDB;

-- Display all students
SELECT * FROM Students;

-- Find CSE students
SELECT * FROM Students
WHERE department = 'CSE';

-- Display student names, courses, and marks
SELECT s.name, c.course_name, m.marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
JOIN Courses c ON m.course_id = c.course_id;

-- Calculate average marks
SELECT s.name, ROUND(AVG(m.marks), 2) AS average_marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
GROUP BY s.student_id, s.name
ORDER BY average_marks DESC;

-- Find highest mark in each course
SELECT c.course_name, MAX(m.marks) AS highest_marks
FROM Courses c
JOIN Marks m ON c.course_id = m.course_id
GROUP BY c.course_id, c.course_name;

-- Count students by department
SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department;
