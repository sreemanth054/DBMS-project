CREATE DATABASE student;

USE student;

CREATE TABLE Contacts (
    ContactID INT PRIMARY KEY,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    ContactID INT,
    FOREIGN KEY (ContactID) REFERENCES Contacts(ContactID)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    Name VARCHAR(100),
    Credits INT
);

CREATE TABLE Grades (
    GradeID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade VARCHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) UNIQUE,
    HeadOfDepartment VARCHAR(100),
    Location VARCHAR(255)
);
INSERT INTO Contacts (ContactID, Email, Phone, Address) VALUES
(1, 'john.doe@example.com', '123-456-7890', '123 Main St'), 
(2, 'jane.smith@example.com', '987-654-3210', '456 Elm St'),
(3, 'bob.johnson@example.com', '555-123-4567', '789 Oak St'),
(4, 'emma.watson@example.com', '111-222-3333', '567 Pine St'),
(5, 'michael.jackson@example.com', '444-555-6666', '890 Maple St');
INSERT INTO Students (StudentID, Name, ContactID) VALUES
(1, 'John Doe', 1),
(2, 'Jane Smith', 2),
(3, 'Bob Johnson', 3),
(4, 'Emma Watson', 4),
(5, 'Michael Jackson', 5);
INSERT INTO Courses (CourseID, Name, Credits) VALUES
(101, 'Mathematics', 3),
(102, 'English', 3),
(103, 'Physics', 4),
(104, 'History', 3),
(105, 'Biology', 4);
INSERT INTO Grades (GradeID, StudentID, CourseID, Grade) VALUES
(1, 1, 101, 'A'),
(2, 1, 102, 'B'),
(3, 2, 101, 'B'),
(4, 2, 102, 'A'),
(5, 3, 103, 'A'),
(6, 3, 104, 'B'),
(7, 4, 103, 'C'),
(8, 4, 104, 'A'),
(9, 5, 101, 'B'),
(10, 5, 105, 'A');
INSERT INTO Departments (DepartmentName, HeadOfDepartment, Location)
VALUES
('Mathematics', 'Prof. Smith', 'Building A, Room 101'),
('English', 'Dr. Johnson', 'Building B, Room 201'),
('Physics', 'Dr. Brown', 'Building C, Room 301'),
('History', 'Prof. Davis', 'Building D, Room 401'),
('Biology', 'Dr. White', 'Building E, Room 501');
CREATE VIEW StudentGrades AS
SELECT Students.Name, Courses.Name AS Course, Grades.Grade
FROM Students
JOIN Grades ON Students.StudentID = Grades.StudentID
JOIN Courses ON Grades.CourseID = Courses.CourseID;
CREATE VIEW EnrolledStudents AS
SELECT Courses.Name AS Course, COUNT(*) AS EnrolledStudents
FROM Courses
JOIN Grades ON Courses.CourseID = Grades.CourseID
GROUP BY Courses.Name;
CREATE VIEW StudentContactInfo AS
SELECT Students.Name, Contacts.Email, Contacts.Phone
FROM Students
JOIN Contacts ON Students.ContactID = Contacts.ContactID;
CREATE VIEW HighGrades AS
SELECT Students.Name, Courses.Name AS Course, Grades.Grade
FROM Students
JOIN Grades ON Students.StudentID = Grades.StudentID
JOIN Courses ON Grades.CourseID = Courses.CourseID
WHERE Grades.Grade IN ('A', 'A+');
CREATE VIEW LowGrades AS
SELECT Students.Name, Courses.Name AS Course, Grades.Grade
FROM Students
JOIN Grades ON Students.StudentID = Grades.StudentID
JOIN Courses ON Grades.CourseID = Courses.CourseID
WHERE Grades.Grade IN ('D', 'F');
SHOW TABLES;
select*from contacts;
select*from courses;
select*from departments;
select*from enrolledstudents;
select*from grades;
select*from studentcontactinfo;
select*from studentgrades;
select*from students;



