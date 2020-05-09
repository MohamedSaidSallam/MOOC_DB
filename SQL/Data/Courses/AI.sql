
INSERT INTO Course (
    name,
    price,
    duration,
    pictureUrl,
    description,
    spid,
    category,
    level,
    language
  )
VALUES
  (
    "Deep Learning",
    50,
    11,
    " xxx ",
    " Deep Learning is an artificial intelligence function that imitates the workings of the human brain in processing data
    and creating patterns for use in decision making.",
    2,
    "Artificial Intelligence",
    "Intermediate",
    "English"
  ),
  (
    "Machine Learning",
    30,
    10,
    "xxx",
    "Machine learning is an application of artificial intelligence (AI) that provides systems the ability to automatically learn
    and improve
    from experience without being explicitly programmed.",
    2,
    "Artificial Intelligence",
    "Intermediate",
    "German"
  );

SET @CourseID = LAST_INSERT_ID();
INSERT INTO TaughtBy (lid, cid)
VALUES
  (1, @CourseID);

INSERT INTO Enrolls (cid, username, startDate, enrollmentType)
VALUES
  (@CourseID, "mfayed", CURDATE(), "Paid");

INSERT INTO Week (title, number, cid)
VALUES
  ("DL", 1, @CourseID-1),
  ("DL", 2, @CourseID-1),
  ("ML", 1, @CourseID),
  ("ML", 2, @CourseID);

SET @Week1 = LAST_INSERT_ID();
INSERT INTO Section (title, duration, wid)
VALUES
  ("DL Section", 60, @Week1),
  ("DL Section", 60, @Week1 + 1),
  ("ML Section", 60, @Week1 + 2),
  ("ML Section", 60, @Week1 + 3);

SET @Section1 = LAST_INSERT_ID();

INSERT INTO VideoLecture (sid, VideoURL, subtitles)
VALUES
  (@Section1, " xxx ", "Arabic");

INSERT INTO Article (sid, text)
VALUES
  (@Section1 + 1, " xxx ");
INSERT INTO Quiz (sid, maxGrade)
VALUES
  (@Section1 + 2, 10);
INSERT INTO Question (text, sid)
VALUES
  ("xxx", @Section1 + 2);

INSERT INTO takes (sid, username, grade)
VALUES
  (@Section1 + 2, "mfayed", 8);

SET @Question1ID = LAST_INSERT_ID();

INSERT INTO QuestionsChoice (choice, qid)
VALUES
  (" a ", @Question1ID);

SET @Choice1ID = LAST_INSERT_ID();

INSERT INTO QuestionAnswer (qid, qcid)
VALUES
    (@Question1ID, @Choice1ID);