-- Write query to get number of graded assignments for each student:
SELECT student_id, COUNT(grade) as gradeCount 
FROM assignments 
WHERE Grade IS NOT NULL 
GROUP BY student_id; 