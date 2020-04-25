-- SELECT enrollmentType, COUNT(username)
-- FROM Enrolls
-- GROUP BY enrolls.enrollmentType;

SELECT course.name, Enrolls.cid, enrollmentType, COUNT(username) as count
FROM Enrolls
LEFT JOIN Course ON enrolls.cid = course.cid
GROUP BY enrolls.enrollmentType,  Enrolls.cid
-- HAVING enrolls.enrollmentType = "Paid"
ORDER BY count DESC;