SELECT university.name, avg(course.price) as avgPrice
FROM university
LEFT JOIN lecturer ON university.name = lecturer.uniName
LEFT JOIN taughtby ON lecturer.lid = taughtby.lid
LEFT JOIN Course ON course.cid = taughtby.cid
GROUP BY university.name
ORDER BY avgPrice DESC;

-- avg price per spec
-- avg price per uni
-- total video lecture time per course 