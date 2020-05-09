-- Number Of Courses Taught By Lecturer

SELECT lecturer.lid, lecturer.name, lecturer.uniName, COUNT(course.cid) as NumberOfCourses
FROM lecturer
LEFT JOIN taughtby ON lecturer.lid = taughtby.lid
LEFT JOIN course ON course.cid = taughtby.cid
GROUP BY lecturer.lid
ORDER BY NumberOfCourses DESC;