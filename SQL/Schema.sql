USE dbproject;

CREATE TABLE University
(
  name VARCHAR(255) NOT NULL,
  logoUrl VARCHAR(255) NOT NULL,
  PRIMARY KEY (name)
);

CREATE TABLE Lecturer
(
  lid INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  imageUrl VARCHAR(255) NOT NULL,
  bio VARCHAR(255) NOT NULL,
  uniName VARCHAR(255) NOT NULL,
  PRIMARY KEY (lid),
  FOREIGN KEY (uniName) REFERENCES University(name)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE Specialization
(
  spid INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  PRIMARY KEY (spid)
);

CREATE TABLE Student
(
  username INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (username)
);

CREATE TABLE CourseCategory
(
  name INT NOT NULL,
  PRIMARY KEY (name)
);

CREATE TABLE CourseLevel
(
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (name)
);

CREATE TABLE EnrollmentType
(
  type VARCHAR(255) NOT NULL,
  PRIMARY KEY (type)
);

CREATE TABLE Language
(
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (name)
);

CREATE TABLE Course
(
  cid INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  price NUMERIC(10, 2) NOT NULL DEFAULT 0,
  duration INT NOT NULL,
  pictureURL VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  spid INT NULL,
  category INT NOT NULL,
  level VARCHAR(255) NOT NULL,
  language VARCHAR(255) NOT NULL,
  PRIMARY KEY (cid),
  FOREIGN KEY (spid) REFERENCES Specialization(spid)
    ON UPDATE CASCADE
    ON DELETE SET NULL,
  FOREIGN KEY (category) REFERENCES CourseCategory(name)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  FOREIGN KEY (level) REFERENCES CourseLevel(name)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  FOREIGN KEY (language) REFERENCES Language(name)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  CONSTRAINT postivePrice CHECK(price >= 0),
  CONSTRAINT postiveDuration CHECK(duration >= 0)
);

CREATE TABLE Week
(
  wid INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  number INT NOT NULL,
  cid INT NOT NULL,
  PRIMARY KEY (wid),
  FOREIGN KEY (cid) REFERENCES Course(cid)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE Enrolls
(
  cid INT NOT NULL,
  username INT NOT NULL,
  startDate DATE NOT NULL,
  passed BOOLEAN NULL DEFAULT NULL,
  enrollmentType VARCHAR(255) NOT NULL,
  PRIMARY KEY (username, cid),
  FOREIGN KEY (username) REFERENCES Student(username)
    ON UPDATE CASCADE
    ON DELETE RESTRICT, -- CASCADE?
  FOREIGN KEY (cid) REFERENCES Course(cid)
    ON UPDATE CASCADE
    ON DELETE RESTRICT, -- CASCADE?
  FOREIGN KEY (enrollmentType) REFERENCES EnrollmentType(type)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE TaughtBy
(
  lid INT NOT NULL,
  cid INT NOT NULL,
  PRIMARY KEY (lid, cid),
  FOREIGN KEY (lid) REFERENCES Lecturer(lid)
    ON UPDATE CASCADE
    ON DELETE RESTRICT, -- CASCADE?
  FOREIGN KEY (cid) REFERENCES Course(cid)
    ON UPDATE CASCADE
    ON DELETE RESTRICT -- CASCADE?
);

CREATE TABLE Section
(
  sid INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  duration INT NOT NULL,
  wid INT NOT NULL,
  PRIMARY KEY (sid),
  FOREIGN KEY (wid) REFERENCES Week(wid)
    ON UPDATE CASCADE
    ON DELETE RESTRICT, -- CASCADE?
  CONSTRAINT postiveSectionDuration CHECK(duration >= 0)
);

CREATE TABLE VideoLecture
(
  sid INT NOT NULL,
  VideoURL VARCHAR(255) NOT NULL,
  subtitles VARCHAR(255) NOT NULL,
  PRIMARY KEY (sid),
  FOREIGN KEY (sid) REFERENCES Section(sid)
    ON UPDATE CASCADE
    ON DELETE RESTRICT -- CASCADE?
);

CREATE TABLE Article
(
  sid INT NOT NULL,
  text VARCHAR(255) NOT NULL,
  PRIMARY KEY (sid),
  FOREIGN KEY (sid) REFERENCES Section(sid)
    ON UPDATE CASCADE
    ON DELETE RESTRICT -- CASCADE?
);

CREATE TABLE Quiz
(
  sid INT NOT NULL,
  maxGrade INT NOT NULL,
  PRIMARY KEY (sid),
  FOREIGN KEY (sid) REFERENCES Section(sid)
    ON UPDATE CASCADE
    ON DELETE RESTRICT, -- CASCADE?
  CONSTRAINT postiveMaxGrade CHECK(maxGrade >= 0)
);

CREATE TABLE Questions
(
  qid INT NOT NULL,
  text VARCHAR(255) NOT NULL,
  answer VARCHAR(255) NOT NULL,
  sid INT NOT NULL,
  PRIMARY KEY (qid),
  FOREIGN KEY (sid) REFERENCES Quiz(sid)
    ON UPDATE CASCADE
    ON DELETE RESTRICT -- CASCADE?
);

CREATE TABLE takes
(
  sid INT NOT NULL,
  username INT NOT NULL,
  grade INT NOT NULL,
  PRIMARY KEY (username, sid),
  FOREIGN KEY (username) REFERENCES Student(username)
    ON UPDATE CASCADE
    ON DELETE RESTRICT, -- CASCADE?
  FOREIGN KEY (sid) REFERENCES Quiz(sid)
    ON UPDATE CASCADE
    ON DELETE RESTRICT, -- CASCADE?
  CONSTRAINT postiveGrade CHECK(grade >= 0)
);

CREATE TABLE QuestionsChoices
(
  choice VARCHAR(255) NOT NULL,
  qid INT NOT NULL,
  PRIMARY KEY (choice),
  FOREIGN KEY (qid) REFERENCES Questions(qid)
    ON UPDATE CASCADE
    ON DELETE RESTRICT -- CASCADE?
);

 ALTER TABLE Questions ADD FOREIGN KEY (answer) REFERENCES QuestionsChoices(choice)
    ON UPDATE CASCADE
    ON DELETE RESTRICT; -- CASCADE?