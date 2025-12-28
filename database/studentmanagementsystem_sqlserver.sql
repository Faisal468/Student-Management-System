USE master;
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'studentmanagementsystem')
BEGIN
    CREATE DATABASE studentmanagementsystem;
END
GO

USE studentmanagementsystem;
GO

-- Table structure for table `attendance`
DROP TABLE IF EXISTS attendance;
CREATE TABLE attendance (
  Name varchar(max) NOT NULL,
  RollNumber varchar(15) NOT NULL,
  Course varchar(max) NOT NULL,
  Section int NOT NULL,
  Date date NOT NULL,
  Present varchar(50)
);

INSERT INTO attendance (Name, RollNumber, Course, Section, Date, Present) VALUES
('Harsh mange', '130', 'OOP', 1, '2019-04-06', '1'),
('Harsh mange', '130', 'OOP', 1, '2019-04-06', '1'),
('Harsh mange', '130', 'OOP', 1, '2019-04-06', '0'),
('Harsh mange', '130', 'MAT100', 1, '2019-04-06', '0');

-- Table structure for table `course`
DROP TABLE IF EXISTS course;
CREATE TABLE course (
  Name varchar(max) NOT NULL,
  RollNumber varchar(15) NOT NULL,
  Programme varchar(max) NOT NULL,
  Mail varchar(max) NOT NULL,
  Course varchar(max) NOT NULL,
  Section int NOT NULL,
  Attendance bit NOT NULL
);

INSERT INTO course (Name, RollNumber, Programme, Mail, Course, Section, Attendance) VALUES
('Harsh mange', '130', 'btech', 'harshm44', 'OOP', 1, 0);

-- Table structure for table `faculty`
DROP TABLE IF EXISTS faculty;
CREATE TABLE faculty (
  Name varchar(max) NOT NULL,
  Mail varchar(max) NOT NULL,
  Course varchar(max) NOT NULL,
  UserName varchar(20) NOT NULL PRIMARY KEY,
  Password varchar(max) NOT NULL
);

INSERT INTO faculty (Name, Mail, Course, UserName, Password) VALUES
('Kuntal Patel', 'kuntalpatel@ahduni.edu.in', 'OOP Lab', 'Kuntalpatel', 'Kuntalpatel'),
('Aditya Patel', 'adityapatel@ahduni.edu.in', 'OOP', 'Adityapatel', 'Adityapatel'),
('Faculty', 'Faculty', 'xyz', 'Faculty', 'Faculty');

-- Table structure for table `quiz`
DROP TABLE IF EXISTS quiz;
CREATE TABLE quiz (
  QuizNo varchar(50) NOT NULL,
  Course varchar(max) NOT NULL,
  Section varchar(50) NOT NULL,
  Question varchar(max) NOT NULL,
  OptA varchar(max) NOT NULL,
  OptB varchar(max) NOT NULL,
  OptC varchar(max) NOT NULL,
  OptD varchar(max) NOT NULL,
  Answer varchar(max) NOT NULL
);

INSERT INTO quiz (QuizNo, Course, Section, Question, OptA, OptB, OptC, OptD, Answer) VALUES
('1', 'MAT100', '1', 'what is java?', 'language', 'oop language', 'programming', 'all', 'all'),
('1', 'MAT100', '1', 'what is c?', 'language', 'oop language', 'programming', 'all', 'programming'),
('1', 'MAT100', '1', 'what is maths', 'subject', 'best sub', 'logical sub', 'queen of physics', 'queen of physics'),
('1', 'MAT100', '1', 'why to learn maths', 'subject', 'best sub', 'logical sub', 'maths is love', 'maths is love'),
('1', 'MAT100', '1', 'why to learn physics', 'subject', 'best sub', 'logical sub', 'king of maths', 'king of maths'),
('2', 'null', '1', 'what is sin30', 'func', 'algo', '1/2', 'all', '1/2'),
('2', 'null', '1', 'what is sin90', 'func', 'algo', '1', 'all', '1');

-- Table structure for table `quizresult`
DROP TABLE IF EXISTS quizresult;
CREATE TABLE quizresult (
  QuizNo varchar(50) NOT NULL,
  Course varchar(max) NOT NULL,
  Section varchar(max) NOT NULL,
  Marks varchar(50) NOT NULL,
  RollNumber varchar(max) NOT NULL
);

INSERT INTO quizresult (QuizNo, Course, Section, Marks, RollNumber) VALUES
('1', 'MAT100', '1', '2', '130'),
('1', 'MAT100', '1', '2', '130'),
('1', 'MAT100', '1', '2', '130'),
('1', 'MAT100', '1', '2', '130'),
('1', 'MAT100', '1', '4', '130'),
('1', 'MAT100', '1', '2', '130'),
('1', 'MAT100', '1', '3', '130');

-- Table structure for table `student`
DROP TABLE IF EXISTS student;
CREATE TABLE student (
  Name varchar(max),
  RollNumber varchar(15) NOT NULL PRIMARY KEY,
  Address varchar(max),
  Programme varchar(max),
  Mail varchar(max),
  Password varchar(max) -- Using varchar instead of mediumtext
);

INSERT INTO student (Name, RollNumber, Address, Programme, Mail, Password) VALUES
('Harsh mange', '130', 'avb', 'btech', 'harshm44', '12345'),
('preyanshu sukhadia', '140', 'azxcvds', 'btech ict', 'preyanshu.s', '12345'),
('Student', '1841100', 'abc', 'b.tech', 'Student', 'Student');
GO
