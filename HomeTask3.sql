DROP DATABASE academy;

CREATE DATABASE academy;
USE academy;



CREATE TABLE faculty (
  faculty_id INT NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL UNIQUE CHECK(name != ''),
  financing DECIMAL(15, 2) NOT NULL DEFAULT 0 CHECK(financing >= 0),
  PRIMARY KEY (faculty_id)
);

INSERT faculty VALUES
(1, 'Infocommunication', 40000),
(2, 'Medical', 35000),
(3, 'Computer Science', 32000),
(4, 'Programming', 43000),
(5, 'Linguistic', 22000);

CREATE TABLE department (
  department_id INT NOT NULL AUTO_INCREMENT,
  financing decimal(15, 2) NOT NULL CHECK (financing >= 0) DEFAULT 0,
  name varchar(100) NOT NULL UNIQUE CHECK(name != ''),
  faculty_id INT NOT NULL,
  PRIMARY KEY (department_id),
  FOREIGN KEY (faculty_id) REFERENCES faculty (faculty_id)
);

INSERT department VALUES
(1, 10000, 'PE', 2),
(2, 20000, 'MATH', 1),
(3, 27000, 'INF0RMATIC', 4),
(4, 30000, 'SOCIAL STUDIES', 5),
(5, 27000, 'ZORO', 3),
(6, 28000, 'SOFTWARE DEVELOPMENT', 3),
(7, 25000, 'CHEMISTRI', 2);

CREATE TABLE curator (
	curator_id INT NOT NULL AUTO_INCREMENT,
	name NVARCHAR(100) NOT NULL CHECK(name != ''),
    surname NVARCHAR(100) NOT NULL CHECK(surname != ''),
    PRIMARY KEY (curator_id)
);

INSERT curator VALUES
(1, 'William', 'Bell'),
(2, 'Jack', 'Rassel'),
(3, 'Gorvard', 'Grey'),
(4, 'Kan', 'Roberto');

CREATE TABLE group_student(
	group_student_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name NVARCHAR(10) NOT NULL UNIQUE CHECK(name != ''),
	year INT NOT NULL,
    department_id INT NOT NULL,
	CONSTRAINT year CHECK (year > 0 and year <= 5),
    FOREIGN KEY (department_id) REFERENCES department (department_id)
);

INSERT group_student VALUES
(1, '660801', 3, 2),
(2, '760801', 4, 3),
(3, '760802', 5, 3),
(4, '940501', 3, 4),
(5, '960802', 5, 5),
(6, 'P107', 3, 2);

CREATE TABLE teacher (
  teacher_id INT NOT NULL AUTO_INCREMENT,
  name NVARCHAR(32) NOT NULL CHECK(name != ''),
  surname NVARCHAR(32) NOT NULL CHECK(surname != ''),
  salary DECIMAL(15, 2) NOT NULL,
  PRIMARY KEY (teacher_id),
  CONSTRAINT salary CHECK (salary > 0)
);

INSERT teacher VALUES
(1, 'James', 'Mcovoy', 1000),
(2, 'William', 'Braun', 1200),
(3, 'Henry', 'Ford', 800),
(4, 'Ellay', 'Black', 1500),
(5, 'Samantha', 'Adams', 1300),
(6, 'Daniel', 'Ryan', 900);

CREATE TABLE group_curator (
	group_curator_id INT NOT NULL AUTO_INCREMENT,
	curator_id INT NOT NULL,
	group_id INT NOT NULL,
    PRIMARY KEY (group_curator_id),
    FOREIGN KEY (curator_id) REFERENCES curator (curator_id),
    FOREIGN KEY (group_id) REFERENCES group_student (group_student_id)
);

INSERT group_curator VALUES
(1, 1, 1),
(2, 1, 2),
(3, 3, 3),
(4, 2, 4),
(5, 4, 5),
(6, 4, 6);

CREATE TABLE subject (
	subject_id INT NOT NULL AUTO_INCREMENT,
    name NVARCHAR(100) NOT NULL UNIQUE CHECK(name != ''),
    PRIMARY KEY (subject_id)
);

INSERT subject VALUES
(1, 'Math'),
(2, 'Physics'),
(3, 'Chemistri'),
(4, 'Economic'),
(5, 'Database Theory');

CREATE TABLE lecture (
	lecture_id INT NOT NULL AUTO_INCREMENT,
    lecture_room NVARCHAR(32) NOT NULL CHECK(lecture_room != ''),
	subject_id INT NOT NULL,
    teacher_id INT NOT NULL,
    PRIMARY KEY (lecture_id),
    FOREIGN KEY (subject_id) REFERENCES subject (subject_id),
    FOREIGN KEY (teacher_id) REFERENCES teacher (teacher_id)
);

INSERT lecture VALUES
(1, 'B103', 1, 2),
(2, '305', 3, 1),
(3, '209', 2, 3),
(4, '110', 3, 4),
(5, '201', 4, 5),
(6, '305', 5, 2);

CREATE TABLE group_lecture (
	group_lecture_id INT NOT NULL AUTO_INCREMENT,
	group_id INT NOT NULL,
    lecture_id INT NOT NULL,
    PRIMARY KEY (group_lecture_id),
    FOREIGN KEY (group_id) REFERENCES group_student (group_student_id),
    FOREIGN KEY (lecture_id) REFERENCES lecture (lecture_id)
);

INSERT group_lecture VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 5),
(4, 4, 1),
(5, 5, 6),
(6, 6, 4);

SELECT * FROM teacher, group_student;

SELECT faculty.name FROM faculty
INNER JOIN department
ON faculty.faculty_id = department.faculty_id
WHERE faculty.financing < department.financing;

SELECT curator.name, group_student.name FROM group_curator
INNER JOIN curator
ON group_curator.curator_id = curator.curator_id
INNER JOIN group_student
ON group_curator.group_id = group_student.group_student_id;

SELECT t.name, t.surname FROM group_student as gs
	JOIN group_lecture AS gl ON gl.group_id = gs.group_student_id
	JOIN lecture AS l ON l.lecture_id = gl.lecture_id
	JOIN teacher AS t ON t.teacher_id = l.teacher_id
    WHERE gs.name = 'P107';

SELECT t.surname, f.name FROM teacher AS t
JOIN lecture AS l ON l.teacher_id = t.teacher_id
JOIN group_lecture AS gl ON gl.lecture_id = l.lecture_id
JOIN group_student AS gs ON gs.group_student_id = gl.group_id
JOIN department AS d ON d.department_id = gs.department_id
JOIN faculty AS f ON f.faculty_id = d.faculty_id;

SELECT gs.name, d.name FROM group_student AS gs
JOIN department AS d ON d.department_id = gs.department_id;

SELECT s.name FROM teacher AS t
JOIN lecture AS l ON l.teacher_id = t.teacher_id
JOIN subject AS s ON s.subject_id = l.subject_id
WHERE t.name = 'Samantha' AND t.surname = 'Adams';

SELECT d.name FROM subject AS s
JOIN lecture AS l ON l.subject_id = s.subject_id
JOIN group_lecture AS gl ON gl.lecture_id = l.lecture_id
JOIN group_student AS gs ON gs.group_student_id = gl.group_id
JOIN department AS d ON d.department_id = gs.department_id
WHERE s.name = 'Database Theory';

SELECT gs.name FROM group_student AS gs
JOIN department AS d ON d.department_id = gs.department_id
JOIN faculty AS f ON f.faculty_id = d.faculty_id
WHERE f.name = 'Computer Science';

SELECT gs.name, f.name FROM group_student AS gs
JOIN department AS d ON d.department_id = gs.department_id
JOIN faculty AS f ON f.faculty_id = d.faculty_id
WHERE gs.year = 5;

SELECT t.name, t.surname, s.name, gs.name  FROM teacher AS t
JOIN lecture AS l ON l.teacher_id = t.teacher_id
JOIN group_lecture AS gl ON gl.lecture_id = l.lecture_id
JOIN group_student AS gs ON gs.group_student_id = gl.group_id
JOIN subject AS s ON l.subject_id = s.subject_id
WHERE l.lecture_room = 'B103';