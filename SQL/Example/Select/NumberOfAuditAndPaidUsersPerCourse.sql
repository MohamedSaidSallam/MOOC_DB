-- Number Of Audit And Paid Users Per Course
SELECT
  course.cid,
  course.name,
  (
    SELECT
      count(enrolls.username)
    FROM enrolls
    WHERE enrolls.cid = Course.cid and enrolls.enrollmentType = "Paid"
  ) as PaidCount,
    (
    SELECT
      count(enrolls.username)
    FROM enrolls
    WHERE enrolls.cid = Course.cid and enrolls.enrollmentType = "Audit"
  ) as AuditCount
FROM Course
ORDER BY
  PaidCount DESC,
  AuditCount DESC;