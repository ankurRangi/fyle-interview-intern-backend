-- Write query to find the number of grade A's given by the teacher who has graded the most assignments
SELECT COUNT(teacher_id) as maxTeacher 
FROM assignments 
WHERE grade IS 'A' 
GROUP BY teacher_id
ORDER BY "maxTeacher" DESC LIMIT 1
