USE dbproject;

INSERT INTO Course (
    name,
    price,
    duration,
    pictureURL,
    description,
    spid,
    category,
    level,
    language
  )
VALUES
  (
    "Introduction To Databases",
    100,
    14,
    "Dummy URL",
    "Dummy Text Dummy Text Dummy Text Dummy Text",
    1,
    -- "Computer Science Essentials"
    "Computer Science",
    "Introductory",
    "Arabic"
  );

SET @CourseID = LAST_INSERT_ID();

INSERT INTO taughtby (lid, cid)
VALUES
    (2, @CourseID),
    (3, @CourseID);

INSERT INTO Enrolls (cid, username, startDate, enrollmentType)
VALUES
  (
    @CourseID,
    "Student Username 1",
    CURDATE(),
    "Audit"
  ),
  (
    @CourseID,
    "Student Username 2",
    CURDATE() -5,
    "Paid"
  );

-- Week 1
INSERT INTO Week (title, number, cid)
VALUES
  ("Dummy Title 1", 1, @CourseID);

SET @Week1 = LAST_INSERT_ID();

INSERT INTO Section (title, duration, wid)
VALUES
    ("Title 1", 30, @Week1),
    ("Title 2", 15, @Week1),
    ("Title 3", 10, @Week1),
    ("Title 4", 10, @Week1);

SET @Section1 = LAST_INSERT_ID();

INSERT INTO Article (sid, text)
VALUES
    (@Section1, "Dummy text Dummy text Dummy text Dummy text"),
    (@Section1+1, "Dummy text Dummy text Dummy text Dummy text");

INSERT INTO VideoLecture (sid, VideoURL, subtitles)
VALUES
    (@Section1+2, "Dummy URL", "Dummy text Dummy text Dummy text Dummy text");

INSERT INTO Quiz (sid, maxGrade)
VALUES
    (@Section1+3, 10);

INSERT INTO Question (text, sid)
VALUES
    ("Dummy Text 1", @Section1+3),
    ("Dummy Text 2", @Section1+3);

SET @Question1ID = LAST_INSERT_ID();

INSERT INTO QuestionsChoice (choice, qid)
VALUES
    ("Dummy Answer 1", @Question1ID),
    ("Dummy Answer 2", @Question1ID),
    ("Dummy Answer 3", @Question1ID),
    ("Dummy Answer 4", @Question1ID),
    ("Dummy Answer 1", @Question1ID + 1),
    ("Dummy Answer 2", @Question1ID + 1),
    ("Dummy Answer 3", @Question1ID + 1);

SET @Choice1ID = LAST_INSERT_ID();

INSERT INTO QuestionAnswer (qid, qcid)
VALUES
    (@Question1ID, @Choice1ID),
    (@Question1ID + 1, @Choice1ID + 4);

INSERT INTO takes (sid, username, grade)
VALUES
    (@Section1+3, "Student Username 1", 9),
    (@Section1+3, "Student Username 2", 10);

-- Week 1 END

-- Week 2
INSERT INTO Week (title, number, cid)
VALUES
  ("Dummy Title 2", 2, @CourseID);

SET @Week2 = LAST_INSERT_ID();

INSERT INTO Section (title, duration, wid)
VALUES
    ("Title 1", 5, @Week2),
    ("Title 2", 10, @Week2),
    ("Title 3", 7, @Week2),
    ("Title 4", 12, @Week2);

SET @Section1 = LAST_INSERT_ID();

INSERT INTO Article (sid, text)
VALUES
    (@Section1, "Dummy text Dummy text Dummy text Dummy text");
INSERT INTO VideoLecture (sid, VideoURL, subtitles)
VALUES
    (@Section1 + 1, "Dummy URL", "Dummy text Dummy text Dummy text Dummy text"),
    (@Section1 + 2, "Dummy URL", "Dummy text Dummy text Dummy text Dummy text");

INSERT INTO Quiz (sid, maxGrade)
VALUES
    (@Section1 + 3, 20);

INSERT INTO Question (text, sid)
VALUES
    ("Dummy Text 1", @Section1 + 3),
    ("Dummy Text 2", @Section1 + 3),
    ("Dummy Text 3", @Section1 + 3);

SET @Question1ID = LAST_INSERT_ID();

INSERT INTO QuestionsChoice (choice, qid)
VALUES
    ("Dummy Answer 1", @Question1ID),
    ("Dummy Answer 2", @Question1ID),
    ("Dummy Answer 3", @Question1ID),
    ("Dummy Answer 1", @Question1ID + 1),
    ("Dummy Answer 2", @Question1ID + 1),
    ("Dummy Answer 3", @Question1ID + 1),
    ("Dummy Answer 4", @Question1ID + 1),
    ("Dummy Answer 1", @Question1ID + 2),
    ("Dummy Answer 2", @Question1ID + 2),
    ("Dummy Answer 3", @Question1ID + 2);

SET @Choice1ID = LAST_INSERT_ID();

INSERT INTO QuestionAnswer (qid, qcid)
VALUES
    (@Question1ID, @Choice1ID),
    (@Question1ID + 1, @Choice1ID+4),
    (@Question1ID + 2, @Choice1ID+7);

INSERT INTO takes (sid, username, grade)
VALUES
    (@Section1+3, "Student Username 1", 15),
    (@Section1+3, "Student Username 2", 20);

-- Week 2 END