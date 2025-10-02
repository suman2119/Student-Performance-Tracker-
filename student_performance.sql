CREATE DATABASE student_performance_tracker; 
USE student_performance_tracker; 

CREATE TABLE students(
roll_no INT PRIMARY KEY,
name VARCHAR(50),
class VARCHAR(10)
);

CREATE TABLE subjects(
subject_id INT PRIMARY KEY,
subject_name VARCHAR(50)
);

CREATE TABLE marks(
roll_no INT, 
subject_id INT, 
marks INT, 
FOREIGN KEY(roll_no) REFERENCES students(roll_no),
FOREIGN KEY(subject_id) REFERENCES subjects(subject_id)
);

INSERT INTO students
(roll_no, name, class)
VALUES 
(1, "Amit", 10), 
(2, "Priya", 10), 
(3, "Ravi", 10);
SELECT * FROM students;

INSERT INTO subjects
(subject_id, subject_name)
VALUES 
(101, "Math"), 
(102, "Science"), 
(103, "English"); 
SELECT * FROM subjects; 

INSERT INTO marks
(roll_no, subject_id, marks)
VALUES
(1, 101, 90), 
(1, 102, 50), 
(1, 103, 30), 
(2, 101, 100), 
(2, 102, 90), 
(2, 103, 95), 
(3, 101, 20), 
(3, 102, 40), 
(3, 103, 60); 
SELECT * FROM marks;

#average marks per student 
SELECT students.name, AVG(marks.marks) AS average_marks
FROM students 
JOIN marks ON students.roll_no = marks.roll_no 
GROUP BY students_name; 

#toppers in each subject 
SELECT subjects.subject_name, student.name, MAX(marks.marks) AS highest_marks
FROM marks.marks 
JOIN students ON marks.roll_no = students.roll_no
JOIN subjects ON marks.subject_id = subjects.subject_id 
GROUP BY subjects.subject_name; 

#students who failed(<40)
SELECT DISTINCT students.name 
FROM students 
JOIN marks ON students.roll_no = marks.roll_no 
WHERE marks.marks<40; 
