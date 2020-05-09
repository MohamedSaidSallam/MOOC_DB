-- Update a Lecturer's University
UPDATE Lecturer
SET uniName = "Ain Shams University"
WHERE Lecturer.lid = 1;

-- Update a user's enrollment type in a course to Paid
UPDATE enrolls
SET enrolls.enrollmenttype = "Paid"
WHERE username = "Student Username 1" AND cid = "3";

-- Update a user's enrollment to pass a course
UPDATE enrolls
SET enrolls.passed = True
WHERE username = "Student Username 1" AND cid = "3";

-- Update a user's Grade in a quiz
UPDATE Takes
SET grade = 5
WHERE username = "Student Username 1" AND sid = "8";

-- Update a Specialization description
UPDATE specialization
SET description = "New description"
WHERE spid = 1;

-- Update a Week's Title
UPDATE week
SET title = "new Title"
WHERE wid = 1;
