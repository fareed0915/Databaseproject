/*  TABLE Initialization */
DROP TABLE IF EXISTS `STUDENTS`;
CREATE TABLE `STUDENTS` (
    `StudentID` int(11) NOT NULL AUTO_INCREMENT,
    `FirstName` varchar(255) DEFAULT NULL,
    `LastName` varchar(255) DEFAULT NULL,
    `Major` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`StudentID`)
);

/* STUDENT INFO */
INSERT INTO `STUDENTS` (FirstName, LastName, Major)
VALUES ('Dallas', 'Burton', 'English'),
('Erik', 'Bryant', 'Math'),
('Esther', 'Bell', 'English'),
('Archie', 'Peters', 'English'),
('Gail', 'Patrick', 'Chemistry'),
('Bethany', 'Gibson', 'Biology'),
('Misty', 'Nunez', 'Computer Science'),
('Wilfred', 'Romero', 'Communications'),
('Terrence', 'Wolfe', 'Computer Science'),
('Fred', 'Warren', 'English');

/* COURSES TABLE  */
DROP TABLE IF EXISTS `COURSES`;
CREATE TABLE `COURSES` (
    `CourseID` int(11) NOT NULL AUTO_INCREMENT,
    `CourseName` varchar(255) DEFAULT NULL,
    `Department` varchar(255) DEFAULT NULL,
    `CourseNumber` varchar(255) DEFAULT NULL,
    `Semester` varchar(255) DEFAULT NULL,
    `SchoolYear` int(4) DEFAULT NULL,
    PRIMARY KEY (`CourseID`)
 );

 /* COURSE INFO */
INSERT INTO `COURSES` (CourseID, CourseName, Department, CourseNumber, Semester, SchoolYear)
VALUES (CourseID, 'First Year English', 'ENG', '009', 'Spring', 2021),
(CourseID, 'Principles of Speech', 'SLMC', '101', 'Spring', 2021),
(CourseID, 'Biology', 'BIOL', '101', 'Fall', 2020),
(CourseID, 'Algebra I', 'MATH', '001', 'Spring', 2021),
(CourseID, 'Intro to Cont Africa', 'AFST', '101', 'Fall', 2021);

/* ENROLLMENT TABLE */
DROP TABLE IF EXISTS `ENROLLMENT`;
CREATE TABLE `ENROLLMENT` (
  `StudentID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  PRIMARY KEY (StudentID, CourseID)
);

/* ENROLLMENT INFO */
INSERT INTO `ENROLLMENT` (StudentID, CourseID)
VALUES (1,2),(1,4),(1,3),(2,2),(2,3),(2,1),(3,1),(3,4),(3,2),
(4,4),(4,5),(4,1),(5,1),(5,3),(5,2),(6,5),(6,4),(6,1),
(7,3),(7,4),(7,5),(8,2),(8,3),(8,5),(9,5),(9,1),(9,2),
(10,3),(10,4),(10,5);

/* DISTRIBUTION TABLE Initialization */
DROP TABLE IF EXISTS `DISTRIBUTION`;
CREATE TABLE `DISTRIBUTION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CourseID` int(11) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `Percent` int(3) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`CourseID`) REFERENCES COURSES(CourseID)
);

/* DISTRIBUTION INFO*/
INSERT INTO `DISTRIBUTION` (ID, CourseID, Category, Percent)
VALUES (ID, 1, 'Participation', 50),(ID, 1, 'Homework', 10),(ID, 1, 'Tests', 20),(ID, 1, 'Projects', 20),
(ID, 2, 'Participation', 30),(ID, 2, 'Homework', 30),(ID, 2, 'Tests', 20),(ID, 2, 'Projects', 20),
(ID, 3, 'Participation', 10),(ID, 3, 'Homework', 30),(ID, 3, 'Tests', 20),(ID, 3, 'Projects', 40),
(ID, 4, 'Participation', 15),(ID, 4, 'Homework', 35),(ID, 4, 'Tests', 30),(ID, 4, 'Projects', 20),
(ID, 5, 'Participation', 10),(ID, 5, 'Homework', 20),(ID, 5, 'Tests', 40),(ID, 5, 'Projects', 30);

/* ASSIGNMENTs TABLE */
DROP TABLE IF EXISTS `ASSIGNMENTS`;
CREATE TABLE `ASSIGNMENTS` (
  `AssignID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` int(11) DEFAULT NULL,
  `Instance` int(11) DEFAULT NULL,
  `MaxScore` int(3) DEFAULT NULL,
  PRIMARY KEY (`AssignID`),
  FOREIGN KEY (`ID`) REFERENCES DISTRIBUTION(ID)
);
/* ASSIGNMENTs INFO */
INSERT INTO `ASSIGNMENTS` (AssignID, ID, Instance, MaxScore)
VALUES (AssignID, 1, 1, 100),(AssignID, 2, 3, 100),(AssignID, 3, 2, 100),(AssignID, 4, 1, 100),
(AssignID, 5, 1, 100),(AssignID, 6, 5, 100),(AssignID, 7, 2, 100),(AssignID, 8, 2, 100),
(AssignID, 9, 1, 100),(AssignID, 10, 2, 100),(AssignID, 11, 1, 100),(AssignID, 12, 1, 100),
(AssignID, 13, 1, 100),(AssignID, 14, 1, 100),(AssignID, 15, 1, 100),(AssignID, 16, 2, 100),
(AssignID, 17, 1, 100),(AssignID, 18, 1, 100),(AssignID, 19, 1, 100),(AssignID, 20, 1, 100);

/* SCORE TABLE */
DROP TABLE IF EXISTS `SCORE`;
CREATE TABLE `SCORE` (
    `StudentID` int(11) NOT NULL,
    `AssignID` int(11) NOT NULL,
  	`Score` int(11) DEFAULT 0 NOT NULL,
    PRIMARY KEY (StudentID, AssignID),
    FOREIGN KEY (`StudentID`) REFERENCES STUDENTS(StudentID),
    FOREIGN KEY (`AssignID`) REFERENCES ASSIGNMENTS(AssignID)
);

INSERT INTO `SCORE` (StudentID, AssignID, Score)
VALUES (1, 6, 79), (1, 7, 70), (1, 8, 79),(1, 9, 60), (1, 10, 88), (1, 11, 95), (1, 12, 28), (1, 13, 68), (1, 14, 87), (1, 15, 40), (1, 16, 95),
(2, 1, 87), (2, 2, 78), (2, 3, 75), (2, 4, 79), (2, 5, 70), (2, 6, 74), (2, 7, 93), (2, 8, 83), (2, 9, 93), (2, 10, 74), (2, 11, 92), (2, 12, 79),
(3, 1, 70), (3, 2, 92), (3, 3, 91), (3, 4, 79), (3, 5, 93), (3, 6, 82), (3, 7, 95), (3, 8, 83), (3, 13, 73), (3, 14, 79), (3, 15, 79), (3, 16, 79),
(4, 1, 74), (4, 2, 83), (4, 3, 79), (4, 4, 96), (4, 13, 78), (4, 14, 89), (4, 15, 76), (4, 16, 50), (4, 17, 97), (4, 18, 76), (4, 19, 98), (4, 20, 70),
(5, 1, 73), (5, 2, 79), (5, 3, 70), (5, 4, 86), (5, 5, 83), (5, 6, 79), (5, 7, 92), (5, 8, 76), (5, 9, 70), (5, 10, 83), (5, 11, 83), (5, 12, 74),
(6, 1, 77), (6, 2, 88), (6, 3, 95), (6, 4, 93), (6, 13, 93), (6, 14, 97), (6, 15, 92), (6, 16, 88), (6, 17, 86), (6, 18, 85), (6, 19, 93), (6, 20, 70),
(7, 9, 88), (7, 10, 70), (7, 11, 76), (7, 12, 89), (7, 13, 93), (7, 14, 92), (7, 15, 84), (7, 16, 73), (7, 17, 98), (7, 18, 89), (7, 19, 93), (7, 20, 89), (8, 5, 89), (8, 6, 93), (8, 7, 83), (8, 8, 92), (8, 9, 82), (8, 10, 67), (8, 11, 93), (8, 12, 93), (8, 17, 85), (8, 18, 89), (8, 19, 83), (8, 20, 89),
(9, 1, 89), (9, 2, 83), (9, 3, 84), (9, 4, 93), (9, 5, 73), (9, 6, 72), (9, 7, 74), (9, 8, 84), (9, 17, 72), (9, 18, 93), (9, 19, 88), (9, 20, 83), (10, 9, 82), (10, 10, 92), (10, 11, 74), (10, 12, 84), (10, 13, 98), (10, 14, 97), (10, 15, 81), (10, 16, 73), (10, 17, 99), (10, 18, 81), (10, 19, 97), (10, 20, 85);


select * from `DISTRIBUTION`;
select * from `COURSES`;

-- query: distribution by course
select COURSES.CourseName, Category, Percent  from `DISTRIBUTION`, `COURSES`
where (COURSES.courseID = DISTRIBUTION.CourseID)
order by CourseName;

-- query: assignments by distribution
select AssignID, COURSES.CourseName, Instance, MaxScore, DISTRIBUTION.Category
from `ASSIGNMENTS`
left join `DISTRIBUTION` on (DISTRIBUTION.ID = ASSIGNMENTS.ID)
left join `COURSES` on (COURSES.CourseID = DISTRIBUTION.courseID);

-- query: student grades by assignment
select SCORE.AssignID, SCORE.StudentID, FirstName, LastName, Score, MaxScore, Instance
from `SCORE`
right JOIN `ASSIGNMENTS` ON (ASSIGNMENTS.AssignID = SCORE.AssignID)
LEFT JOIN `STUDENTS` ON (STUDENTS.StudentID = SCORE.StudentID);

-- #4 query: Compute the average/highest/lowest score of an assignment
select a.AssignID, a.MaxScore, avg(s.Score) AS PointAVG, max(s.Score) AS BestScore, min(s.Score) AS WorstScore
from ASSIGNMENTS a, SCORE s
where a.AssignID=2 AND s.AssignID=a.AssignID;

-- #5 query: List all of the students in a given course
select LastName, FirstName, CourseName from `ENROLLMENT`
inner join `STUDENTS` on (STUDENTS.StudentID = ENROLLMENT.StudentID)
inner join `COURSES` on (COURSES.CourseID = ENROLLMENT.CourseID) where (COURSES.CourseID = 2)
-- feel free to change the CourseID to get the student list for the other courses
order by LastName asc;

-- #6 query: List all of the students in a course and all of their scores on every assignment
select LastName, FirstName, CourseName, ASSIGNMENTS.AssignID, Score, MaxScore from `ENROLLMENT`
inner join `STUDENTS` on (STUDENTS.StudentID = ENROLLMENT.StudentID)
inner join `SCORE` on (SCORE.StudentID = ENROLLMENT.StudentID)
inner join `ASSIGNMENTS` on (ASSIGNMENTS.AssignID = SCORE.AssignID)
inner join `COURSES` on (COURSES.CourseID = ENROLLMENT.CourseID) where (COURSES.CourseID = 1)
order by AssignID, LastName asc;

-- #7 query: Add an assignment to a course
insert into ASSIGNMENTS(ID, Instance, MaxScore)
VALUES (1, 3, 100);
-- updated #7 table
SELECT * FROM ASSIGNMENTS;

-- #8 query: Change the percentages of the categories for a course
-- feel free to change Percent to set new distribution
-- NOTE: another Percent must be altered to keep the total Percent = 100
update DISTRIBUTION set Percent = 30
where ID = 1;
update DISTRIBUTION set Percent = 40
where ID = 3;
-- updated #8 table
SELECT * FROM DISTRIBUTION;

-- #9 query: Add 2 Score to the score of each student on an assignment
UPDATE SCORE SET Score = Score + 2
WHERE AssignID = 4;
-- updated #9 table
SELECT * FROM `SCORE`
LEFT JOIN `ASSIGNMENTS` ON (SCORE.AssignID = ASSIGNMENTS.AssignID) WHERE (SCORE.AssignID = 4)
order by StudentID;

-- #10 query: Add 2 Score just to those students whose last name contains a ‘Q’
SELECT * FROM `SCORE`
LEFT JOIN `ASSIGNMENTS` ON (SCORE.AssignID = ASSIGNMENTS.AssignID) 
WHERE (SCORE.StudentID = 6)
order by StudentID;

update `SCORE`
left join `STUDENTS` 
on (SCORE.StudentID = STUDENTS.StudentID)
set Score = Score + 2
where (STUDENTS.LastName LIKE '%q%')
or (STUDENTS.LastName LIKE '%Q%')
and (STUDENTS.StudentID = 6);

SELECT * FROM `SCORE`
LEFT JOIN `ASSIGNMENTS` ON (SCORE.AssignID = ASSIGNMENTS.AssignID) 
WHERE (SCORE.StudentID = 6)
order by StudentID;


-- #11 query: compute the grade for a student
-- student final grade for Dallas Burton in English
Select SUM(((sg.Score * 100) / a.MaxScore) * (Percent / 100)) AS FINALGRADE
FROM DISTRIBUTION d, ASSIGNMENTS a, SCORE sg
WHERE d.ID = a.ID
AND sg.AssignID = a.AssignID
AND d.CourseID = 3
AND StudentID = 1;

-- #12 query: Compute the grade for a student, where the lowest score for a given category is dropped
Select SUM(((sg.Score * 100) / a.MaxScore) * (Percent / 100)) AS FINALGRADE
FROM DISTRIBUTION d, ASSIGNMENTS a, SCORE sg
WHERE d.ID = a.ID
AND sg.AssignID = a.AssignID
AND d.CourseID = 3
AND StudentID = 1;                

SELECT min(s.Score) as WorstGrade FROM SCORE s
left join `ASSIGNMENTS` a on (s.AssignID = a.AssignID)
left join `DISTRIBUTION` d on (d.ID = a.ID)
left join `COURSES` c on (c.CourseID = d.courseID)
WHERE  s.StudentID = 1
and d.CourseID = 3
order by s.StudentID asc;
SELECT * FROM SCORE where StudentID = 1;

Delete from `SCORE` 
where StudentID = 1 and AssignID = 9;

Select SUM(((sg.Score * 100) / a.MaxScore) * (Percent / 100)) AS FINALGRADE
FROM DISTRIBUTION d, ASSIGNMENTS a, SCORE sg
WHERE d.ID = a.ID
AND sg.AssignID = a.AssignID
AND d.CourseID = 3
AND StudentID = 1;
                                                
SELECT s.AssignID, s.StudentID,d.CourseID, s.Score  FROM SCORE s
left join `ASSIGNMENTS` a on (s.AssignID = a.AssignID)
left join `DISTRIBUTION` d on (d.ID = a.ID)
left join `COURSES` c on (c.CourseID = d.courseID)
WHERE  s.StudentID = 1
and d.CourseID = 3
order by s.StudentID asc;

