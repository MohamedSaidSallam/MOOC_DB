-- AvgQuizGrade

SET @CourseID = 4;

SELECT week.number as WeekNumber,quiz.sid, section.title as QuizTitle, avg(takes.grade) as AvgGrade, quiz.maxGrade
FROM quiz
LEFT JOIN section ON section.sid = quiz.sid
LEFT JOIN week ON week.wid = section.wid
LEFT JOIN course ON course.cid = week.cid
LEFT JOIN takes on takes.sid = quiz.sid
WHERE course.cid = @CourseID
GROUP BY quiz.sid
-- ORDER BY AvgGrade / quiz.maxGrade;
ORDER BY WeekNumber;