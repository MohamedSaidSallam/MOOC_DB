DELETE FROM section
WHERE
  section.wid = 4;

DELETE FROM week
WHERE
  week.wid = 4;

-- Remove a student
SET
  @StudentToDelete = "Student Username 1";

DELETE FROM enrolls
WHERE
  username = @StudentToDelete;

DELETE FROM Takes
WHERE
  username = @StudentToDelete;

DELETE FROM student
WHERE
  username = @StudentToDelete;

-- Remove a Quiz
SET
  @SIDQuizToDelete = 3;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM questionanswer
Where
  qid in (
    SELECT
      qid
    FROM question
    Where
      sid = @SIDQuizToDelete
  );

DELETE FROM questionschoice
Where
  qid in (
    SELECT
      qid
    FROM question
    Where
      sid = @SIDQuizToDelete
  );

DELETE FROM question
Where
  sid = @SIDQuizToDelete;

DELETE FROM Takes
WHERE sid = @SIDQuizToDelete;

DELETE FROM quiz
WHERE
  sid = @SIDQuizToDelete;

DELETE FROM section
WHERE
  sid = @SIDQuizToDelete;

SET SQL_SAFE_UPDATES = 1;
