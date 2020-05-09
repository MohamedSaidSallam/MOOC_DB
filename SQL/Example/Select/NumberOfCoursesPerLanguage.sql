-- Number Of Courses Per Language

SELECT Language.name, COUNT(Course.cid) as NumberOfCourses
FROM Course
LEFT JOIN Language ON Language.name = course.language
GROUP BY Language.name
ORDER BY NumberOfCourses DESC;