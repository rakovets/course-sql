-- Домашнее задание № 4 (DT_DZ_04).
-- Тема: Многотабличные базы данных

DROP DATABASE IF EXISTS academy;
CREATE DATABASE academy;
USE academy;
DROP TABLE IF EXISTS curator, department, faculty, grоup, group_curator_link, group_lecture_link, lecture, subjеct, teacher;

CREATE TABLE curator (
    curator_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name NVARCHAR(30) NOT NULL CHECK (name != ''),
    surname NVARCHAR(30) NOT NULL CHECK (surname != '')
);

INSERT curator VALUES
	(1, 'Ellis', 'Cruz'),
	(2, 'Nichol', 'Washington'),
	(3, 'Willi', 'Black'),
	(4, 'Ray', 'Stone'),
	(5, 'Oliver', 'Payne');

CREATE TABLE faculty (
	faculty_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	financing DECIMAL(15,2) CHECK (financing >= 0) NOT NULL DEFAULT (0),
	name NVARCHAR(20) NOT NULL
);

INSERT faculty VALUES
	(1, 7000.0, 'Immunology'),
	(2, 20000.0, 'Java'),
	(3, 18000.0, 'English'),
	(4, 28000.0, 'Manufacturing'),
	(5, 15000.0, 'Computer Science');

CREATE TABLE department (
	department_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	financing DECIMAL(15,2) CHECK (financing >= 0) NOT NULL DEFAULT (0),
	name NVARCHAR(30) NOT NULL CHECK (name != '') UNIQUE,
	faculty_id INT NOT NULL,
	FOREIGN KEY (faculty_id) REFERENCES faculty (faculty_id)
);

INSERT department VALUES
	(1, 700.0, 'Biology', 1),
	(2, 3200.0, 'Software development', 2),
	(3, 1000.0, 'Linguistics', 3),
	(4, 40000.0, 'Engineering', 4),
	(5, 50000.0, 'Cybersecurity', 5);

CREATE TABLE grоup (
	grоup_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name NVARCHAR(10) NOT NULL CHECK (name != '') UNIQUE,
	year INT  NOT NULL CHECK (year >= 1 AND year <= 5),
	department_id INT NOT NULL,
	FOREIGN KEY (department_id) REFERENCES department (department_id)
);

INSERT grоup VALUES
	(1, 'B01', 1, 1),
	(2, 'L02', 2, 2),
	(3, 'S03', 3, 3),
	(4, 'E04', 4, 4),
	(5, 'C05', 5, 5);

CREATE TABLE group_curator_link (
	group_curator_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    curator_id INT NOT NULL,
    grоup_id INT NOT NULL,
    FOREIGN KEY (curator_id) REFERENCES curator (curator_id),
    FOREIGN KEY (grоup_id) REFERENCES grоup (grоup_id)
    );

INSERT group_curator_link VALUES
	(1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5);

CREATE TABLE subjеct (
	subjеct_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name NVARCHAR(100) NOT NULL CHECK (name != '') UNIQUE
);

INSERT subjеct VALUES
	(1, 'Chemistry'),
	(2, 'Database Theory'),
	(3, 'Conversation'),
	(4, 'Standard'),
	(5, 'Network');

CREATE TABLE teacher (
	teacher_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name NVARCHAR(30) NOT NULL CHECK (name != ''),
    salary DECIMAL(15, 2)  NOT NULL CHECK (salary > 0),
    surname NVARCHAR(30) NOT NULL CHECK (surname != '')
);

INSERT teacher VALUES
	(1, 'Mary', 10000.0, 'Bianchi'),
    (2, 'Nelle', 15000.0, 'Harper'),
    (3, 'Harry', 18000.0, 'Truman'),
    (4, 'Ronald', 20000.0, 'Tolkien'),
    (5, 'John', 11000.0, 'White');

CREATE TABLE lecture (
	lecture_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    lecture_room NVARCHAR(10) NOT NULL CHECK (lecture_room != ''),
    subjеct_id INT NOT NULL,
    teacher_id INT NOT NULL,
	FOREIGN KEY (subjеct_id) REFERENCES subjеct (subjеct_id),
    FOREIGN KEY (teacher_id) REFERENCES teacher (teacher_id)
	);

INSERT lecture VALUES
	(1, 'R001', 1, 1),
    (2, 'R002', 2, 2),
    (3, 'B103', 3, 3),
    (4, 'B103', 4, 4),
    (5, 'R005', 5, 5);

CREATE TABLE group_lecture_link (
	group_lecture_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    grоup_id INT NOT NULL,
    lecture_id INT NOT NULL,
    FOREIGN KEY (grоup_id) REFERENCES grоup (grоup_id),
    FOREIGN KEY (lecture_id) REFERENCES lecture (lecture_id)
    );

INSERT group_lecture_link VALUES
	(1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5);

-- 1. Вывести все возможные пары строк преподавателей и групп.

SELECT CONCAT(t.name, ' ', t.surname) AS 'teacher', g.name AS 'group'
FROM grоup AS g
JOIN group_lecture_link AS gll ON g.grоup_id = gll.grоup_id
JOIN lecture AS l ON gll.lecture_id = l.lecture_id
JOIN teacher AS t ON l.teacher_id = t.teacher_id;

-- 2. Вывести названия факультетов, фонд финансирования кафедр которых превышает фонд финансирования факультета.

SELECT f.name
FROM faculty AS f
JOIN department AS d ON f.faculty_id = d.faculty_id
WHERE d.financing > f.financing;

-- 3. Вывести фамилии кураторов групп и названия групп, которые они курируют.

SELECT c.surname AS 'curator surname', g.name AS 'grоup name'
FROM curator AS c
JOIN group_curator_link AS gcl ON c.curator_id = gcl.curator_id
JOIN grоup AS g ON gcl.grоup_id = g.grоup_id;

-- 4. Вывести имена и фамилии преподавателей, которые читают лекции у группы “P107”.

INSERT grоup VALUE (6, 'P107', 5, 5);
INSERT group_lecture_link VALUES
	(6, 6, 1),
	(7, 6, 2);

SELECT CONCAT(t.name, ' ', t.surname) AS 'group "P107" teachers'
FROM grоup AS g
JOIN group_lecture_link AS gll ON g.grоup_id = gll.grоup_id
JOIN lecture AS l ON gll.lecture_id = l.lecture_id
JOIN teacher AS t ON l.teacher_id = t.teacher_id
WHERE g.name = 'P107';

-- 5. Вывести фамилии преподавателей и названия факультетов на которых они читают лекции.

SELECT t.surname, f.name
FROM faculty AS f
JOIN department AS d ON f.faculty_id = d.faculty_id
JOIN grоup AS g ON d.department_id = g.department_id
JOIN group_lecture_link AS gll ON g.grоup_id = gll.grоup_id
JOIN lecture AS l ON gll.lecture_id = l.lecture_id
JOIN teacher AS t ON l.teacher_id = t.teacher_id
ORDER BY (t.surname);

-- 6. Вывести названия кафедр и названия групп, которые к ним относятся.

SELECT d.name, g.name
FROM department AS d
JOIN grоup AS g ON d.department_id = g.department_id;

-- 7. Вывести названия дисциплин, которые читает преподаватель “Samantha Adams”.

INSERT teacher VALUE (6, 'Samantha', 50000.0, 'Adams');
INSERT lecture VALUES
(6, 'R001', 1, 6),
(7, 'R002', 2, 6);

SELECT s.name
FROM subjеct AS s
JOIN lecture AS l ON s.subjеct_id = l.subjеct_id
JOIN teacher AS t ON l.teacher_id = t.teacher_id
WHERE t.name = 'Samantha' AND t.surname = 'Adams';

-- 8. Вывести названия кафедр, на которых читается дисциплина “Database Theory”.

SELECT d.name AS 'department name where read “Database Theory”'
FROM department AS d
JOIN grоup AS g ON d.department_id = g.department_id
JOIN group_lecture_link AS gll ON g.grоup_id = gll.grоup_id
JOIN lecture AS l ON gll.lecture_id = l.lecture_id
JOIN subjеct AS s ON l.subjеct_id = s.subjеct_id
WHERE s.name = 'Database Theory';

-- 9. Вывести названия групп, которые относятся к факультету “Computer Science”.

SELECT g.name AS 'grоup name'
FROM faculty AS f
JOIN department AS d ON f.faculty_id = d.faculty_id
JOIN grоup AS g ON d.department_id = g.department_id
WHERE f.name = 'Computer Science';

-- 10. Вывести названия групп 5-го курса, а также название факультетов, к которым они относятся.

SELECT g.name AS 'grоup name', f.name
FROM faculty AS f
JOIN department AS d ON f.faculty_id = d.faculty_id
JOIN grоup AS g ON d.department_id = g.department_id
WHERE g.year = 5;

-- 11. Вывести полные имена преподавателей и лекции, которые они читают (названия дисциплин и групп),
--     причем отобрать только те лекции, которые читаются в аудитории “B103”.

SELECT CONCAT(t.name, ' ', t.surname) AS 'teacher full name', s.name AS 'subjеct name', g.name AS 'grоup name'
FROM grоup AS g
JOIN group_lecture_link AS gll ON g.grоup_id = gll.grоup_id
JOIN lecture AS l ON gll.lecture_id = l.lecture_id
JOIN teacher AS t ON l.teacher_id = t.teacher_id
JOIN subjеct AS s ON l.subjеct_id = s.subjеct_id
WHERE l.lecture_room = 'B103';