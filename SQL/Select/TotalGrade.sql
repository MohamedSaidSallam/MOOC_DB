SELECT Student.username, course.name, SUM(takes.grade) as TotalGrade
FROM Student
LEFT JOIN takes ON Student.username = takes.username
LEFT JOIN Section ON takes.sid = section.sid
LEFT JOIN week ON week.wid = section.wid
LEFT JOIN Course on course.cid = week.cid
GROUP BY Student.username, course.cid
HAVING TotalGrade is not null
ORDER BY TotalGrade DESC;