-- Write query to find the number of grade A's given by the teacher who has graded the most assignments
SELECT COUNT(grade) as maxGrade, teacher_id
FROM assignments 
WHERE grade IS 'A' 
GROUP BY teacher_id


-- Query to get the count of total number of A grade given be the teacher who has graded the maximum number of assignments
-- SELECT COUNT(grade) as maxGrade 
-- FROM assignments 
-- WHERE grade IS 'A' 
-- GROUP BY teacher_id
-- ORDER BY "maxGrade" DESC LIMIT 1
