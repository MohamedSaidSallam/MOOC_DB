-- avg price per university

SELECT university.name, avg(course.price) as avgPrice
FROM university
LEFT JOIN lecturer ON university.name = lecturer.uniName
LEFT JOIN taughtby ON lecturer.lid = taughtby.lid
LEFT JOIN Course ON course.cid = taughtby.cid
GROUP BY university.name
ORDER BY avgPrice DESC;

-- avg price per specialization

SELECT specialization.title, avg(course.price) as avgPrice
FROM specialization
LEFT JOIN Course ON course.spid = specialization.spid
GROUP BY specialization.title
ORDER BY avgPrice DESC;