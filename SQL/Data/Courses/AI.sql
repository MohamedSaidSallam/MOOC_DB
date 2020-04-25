INSERT INTO Lecturer (name, imageUrl, bio, uniName)
VALUES
  (
    "Prof. Andrew NG",
    "xxx",
    "Pioneer in Deep Learning, Machine Learning and AI",
    "Stanford University"
  );
INSERT INTO Student (username, name, password)
VALUES
  ("mfayed", "Mariam", "12345");
INSERT INTO Student (username, name, password)
VALUES
  ("msaid", "Said", "12345");
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
  );
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
    "Machine Learning",
    30,
    10,
    " xxx ",
    "Machine learning is an application of artificial intelligence (AI) that provides systems the ability to automatically learn
    and improve
    from experience without being explicitly programmed.",
    2,
    "Artificial Intelligence",
    "Intermediate",
    "German"
  );
INSERT INTO Week (title, number, cid)
VALUES
  ("DL", 1, 1),
  ("DL", 2, 1),
  ("ML", 1, 2),
  ("ML", 2, 2);
INSERT INTO Enrolls (cid, username, startDate, enrollmentType)
VALUES
  (1, "mfayed", " 2020-5-10", "Paid");

INSERT INTO TaughtBy (lid, cid)
VALUES
  (1, 1);
INSERT INTO Section (title, duration, wid)
VALUES
  ("DL Section", 60, 1),
  ("DL Section", 60, 2),
  ("ML Section", 60, 3),
  ("ML Section", 60, 4);

INSERT INTO VideoLecture (sid, VideoURL, subtitles)
VALUES
  (1, " xxx ", "Arabic");

INSERT INTO Article (sid, text)
VALUES
  (2, " xxx ");
INSERT INTO Quiz (sid, maxGrade)
VALUES
  (3, 10);
INSERT INTO Question (text, sid)
VALUES
  ("xxx", 3);

INSERT INTO takes (sid, username, grade)
VALUES
  (3, "mfayed", 8);

INSERT INTO QuestionsChoice (choice, qid)
VALUES
  (" a ", 1);

INSERT INTO QuestionAnswer (qid, qcid)
VALUES
    (1, 1);