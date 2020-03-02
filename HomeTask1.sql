DROP TABLE IF EXISTS department;
CREATE TABLE department (
  department_id INT NOT NULL AUTO_INCREMENT,
  financing decimal(15, 2) NOT NULL DEFAULT 0,
  name varchar(100) NOT NULL UNIQUE CHECK(name != ''),
  PRIMARY KEY (department_id),
  CONSTRAINT financing CHECK ((financing >= 0))
);

DROP TABLE IF EXISTS faculty;
CREATE TABLE faculty (
  faculty_id INT NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL UNIQUE CHECK(name != ''),
  PRIMARY KEY (faculty_id)
);

DROP TABLE IF EXISTS group_student;
CREATE TABLE group_student(
	group_student_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name NVARCHAR(10) NOT NULL UNIQUE CHECK(name != ''),
	raiting INT NOT NULL,
	year INT NOT NULL,
	CONSTRAINT raiting CHECK
		(raiting >= 1 and raiting <= 5),
	CONSTRAINT year CHECK
		(year > 0 and year <= 5)
);

DROP TABLE IF EXISTS teacher;
CREATE TABLE teacher (
  teacher_id INT NOT NULL AUTO_INCREMENT,
  name NVARCHAR(32) NOT NULL CHECK(name != ''),
  surname NVARCHAR(32) NOT NULL CHECK(surname != ''),
  salary DECIMAL(15, 2) NOT NULL,
  premium DECIMAL(15, 2) NOT NULL DEFAULT 0,
  date_of_employ DATE NOT NULL,
  PRIMARY KEY (teacher_id),
  CONSTRAINT date_of_employ CHECK (date_of_employ > '1990-01-01'),
  CONSTRAINT premium CHECK (premium > 0),
  CONSTRAINT salary CHECK (salary >= 0)
);

ALTER TABLE faculty
ADD dean NVARCHAR(100) NOT NULL CHECK(dean != '');

ALTER TABLE teacher
ADD is_assistant BIT NOT NULL DEFAULT 0;

ALTER TABLE teacher
ADD is_professor BIT NOT NULL DEFAULT 0;

ALTER TABLE teacher
ADD position NVARCHAR(32) NOT NULL CHECK(position != '');

INSERT department VALUES
(NULL, 10000, 'PE'),
(NULL, 20000, 'MATH'),
(NULL, 27000, 'INF0RMATIC'),
(NULL, 25000, 'CHEMISTRI');

INSERT group_student VALUES
(NULL, '660801', 3, 2),
(NULL, '760801', 4, 3),
(NULL, '760802', 5, 3),
(NULL, '660504', 3, 2);

INSERT teacher VALUES
(NULL, 'James', 'Mcovoy', 1000, 100, '1998-04-21', 0, 1, 'professor'),
(NULL, 'William', 'Braun', 1200, 100, '2005-02-12', 1, 0, 'Oldest assistent'),
(NULL, 'Ellay', 'Black', 1500, 250, '2003-11-01', 1, 0, 'Oldest assistent'),
(NULL, 'Jack', 'Owen', 1300, 100, '2005-01-23', 0, 1, 'professor'),
(NULL, 'Daniel', 'Ryan', 900, 20, '2010-07-10', 0, 1, 'professor');

INSERT faculty VALUES
(NULL, 'Infocommunication', 'Owen'),
(NULL, 'Medical', 'Henry'),
(NULL, 'Computer science', 'Daniel'),
(NULL, 'Programming', 'Jack'),
(NULL, 'Linguistic', 'Ethan');

SELECT * FROM department;

SELECT *
FROM department
ORDER BY department_id DESC;

SELECT name, raiting
FROM group_student;

SELECT surname, salary + premium AS Full_amount
FROM teacher;

SELECT CONCAT('The dean of faculty ', name, ' is ', dean) AS Information_about_faculty
FROM faculty;

SELECT surname
FROM teacher
WHERE is_professor = 1 AND salary > 1050;

SELECT name
FROM department
WHERE financing < 11000 OR financing > 25000;

SELECT name
FROM faculty
WHERE NOT name = 'Computer science';

SELECT surname, position
FROM teacher
WHERE is_professor = 0;

SELECT surname, position, salary, premium
FROM teacher
WHERE is_assistant = 1 AND premium >= 160 AND premium <= 550;

SELECT surname, salary
FROM teacher
WHERE is_assistant = 1;

SELECT surname, position
FROM teacher
WHERE date_of_employ < '2000-01-01';

SELECT name AS Name_of_department
FROM department
WHERE name