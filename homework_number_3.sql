-- Домашнее задание № 3 (DT_DZ_03)
-- Тема: Запросы SELECT, INSERT, UPDATE, DELETE

DROP DATABASE IF EXISTS academy;
CREATE DATABASE academy;
USE academy;
DROP TABLE IF EXISTS grоup, departments, faculty, teacher, grоup_new;

CREATE TABLE grоup (
grоup_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
grоup_name NVARCHAR(10) NOT NULL UNIQUE,
grоup_year INT CHECK (grоup_year >= 1 AND grоup_year <= 5) NOT NULL,
grоup_rating INT CHECK (grоup_rating >= 0 AND grоup_rating <= 5) NOT NULL
);

INSERT grоup VALUES (1, 'DJ001', 1, 3);
INSERT grоup VALUES (NULL, 'SS005', 2, 3);
INSERT grоup VALUES (NULL, 'RQ007', 3, 5);
INSERT grоup VALUES (NULL, 'LS054', 4, 0);
INSERT grоup VALUES (NULL, 'BD015',5 , 4 );

CREATE TABLE departments (
departments_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
departments_name NVARCHAR(100) NOT NULL UNIQUE,
departments_financing DECIMAL(15,2) CHECK (departments_financing >= 0) NOT NULL DEFAULT (0)
);

INSERT departments VALUES (1, 'Engineering', 30000.0);
INSERT departments VALUES (NULL, 'Biology', 7000.0);
INSERT departments VALUES (NULL, 'Linguistics', 12000.0);
INSERT departments VALUES (NULL, 'Software development', 10000.0);
INSERT departments VALUES (NULL, 'Mathematics', 15000.0);
INSERT departments VALUES (NULL, 'Cybersecurity', 40000.0);

CREATE TABLE faculty (
faculty_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
faculty_name NVARCHAR(100) NOT NULL UNIQUE
);

INSERT faculty VALUES (1, 'Manufacturing');
INSERT faculty VALUES (NULL, 'Computer Science');
INSERT faculty VALUES (NULL, 'Genetics');
INSERT faculty VALUES (NULL, 'Java');
INSERT faculty VALUES (NULL, 'Linux');
INSERT faculty VALUES (NULL, 'MariaDB');

CREATE TABLE teacher (
teacher_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
teacher_name NVARCHAR(10) NOT NULL,
teacher_surname NVARCHAR(10) NOT NULL,
teacher_salary DECIMAL(15, 2) CHECK (teacher_salary > 0) NOT NULL,
teacher_premium DECIMAL(15, 2) CHECK (teacher_premium >= 0) NOT NULL DEFAULT (0),
teacher_employment_date DATE CHECK (teacher_employment_date >= '1990-01-01') NOT NULL
);

INSERT teacher VALUES (NULL, 'Daniel', 'Lieberman', 2000.0, 300.0, '2019-04-28');
INSERT teacher VALUES (NULL, 'Jerome', 'Bruner', 1000.0, 700.0, '1990-12-17');
INSERT teacher VALUES (NULL, 'John', 'Harvard', 3000.0, 450.0, '1991-05-24');
INSERT teacher VALUES (NULL, 'Sophia', 'Nelson', 630.0, 450.0, '2003-09-30');
INSERT teacher VALUES (NULL, 'Emma', 'Kirk', 1200.0, 300.0, '2010-02-07');
INSERT teacher VALUES (NULL, 'Henry', 'MacAlister', 1560.0, 400.0, '1997-05-18');
INSERT teacher VALUES (NULL, 'Michael', 'Cooper', 320.0, 50.0, '2018-11-24');
INSERT teacher VALUES (NULL, 'Daniel', 'Williams', 900.0, 120.0, '1999-10-03');

-- 1. Вывести таблицу кафедр, но расположить ее поля в обратном порядке.

SELECT departments_financing, departments_name, departments_id
FROM departments;

-- 2. Вывести названия групп и их рейтинги с уточнением имен полей именем таблицы.

ALTER TABLE grоup RENAME TO grоup_new;
ALTER TABLE grоup_new CHANGE COLUMN grоup_name grоup_name_new NVARCHAR(10) NOT NULL UNIQUE;
SELECT grоup_name_new, grоup_rating
FROM grоup_new;

-- 3. Вывести для преподавателей их фамилию, процент ставки по отношению к надбавке
-- и процент ставки по отношению к зарплате (сумма ставки и надбавки).

SELECT  teacher_surname,
FORMAT(teacher_salary / teacher_premium * 100, 2) AS 'salary / premium * 100',
FORMAT(teacher_salary / (teacher_salary + teacher_premium) * 100, 2) AS 'salary / (salary + premium) * 100'
FROM teacher;

-- 4. Вывести таблицу факультетов в виде одного поля в следующем формате: “The dean of faculty [faculty] is [dean].”.

ALTER TABLE faculty ADD dean_fullname NVARCHAR(20) DEFAULT 'Hilary Olson';
UPDATE faculty SET dean_fullname = 'Henry Adams'
WHERE faculty_id = 3 OR faculty_id = 4 OR faculty_id = 5;

SELECT CONCAT('The dean of faculty ', faculty_name, ' is ', dean_fullname) AS 'The dean of faculty [faculty] is [dean]'
FROM faculty;

-- 5. Вывести фамилии преподавателей, которые являются профессорами и ставка которых превышает 1050.

ALTER TABLE teacher ADD teacher_position NVARCHAR(20) DEFAULT 'Assistant';
UPDATE teacher SET teacher_position = 'Professor'
WHERE teacher_id = 1 OR teacher_id = 3;

SELECT teacher_surname, teacher_salary AS 'salary > 1050'
FROM teacher
WHERE teacher_salary > 1050 AND teacher_position = 'Professor';

-- 6. Вывести названия кафедр, фонд финансирования которых меньше 11000 или больше 25000.

SELECT departments_name, departments_financing AS 'financing <11000 or >25000'
FROM departments
WHERE departments_financing < 11000 OR departments_financing > 25000;

-- 7. Вывести названия факультетов кроме факультета “Computer Science”.

SELECT faculty_name
FROM faculty
WHERE faculty_name != 'Computer Science';

-- 8. Вывести фамилии и должности преподавателей, которые не являются профессорами.

SELECT teacher_surname, teacher_position
FROM teacher
WHERE teacher_position != 'Professor';

-- 9. Вывести фамилии, должности, ставки и надбавки ассистентов, у которых надбавка в диапазоне от 160 до 550.

SELECT teacher_surname, teacher_position, teacher_salary, teacher_premium
FROM teacher
WHERE teacher_premium > 160 AND teacher_premium < 550 AND teacher_position = 'Assistant';

-- 10. Вывести фамилии и ставки ассистентов.

SELECT teacher_surname, teacher_salary, teacher_position
FROM teacher
WHERE teacher_position = 'Assistant';

-- 11. Вывести фамилии и должности преподавателей, которые были приняты на работу до 01.01.2000.

SELECT teacher_surname, teacher_position, teacher_employment_date
FROM teacher
WHERE teacher_employment_date <= '2000-01-01';

-- 12. Вывести названия кафедр, которые в алфавитном порядке располагаются до кафедры “Software Development”.
-- Выводимое поле должно иметь название “Name of De part ment”.

SELECT departments_name AS 'Name of De part ment'
FROM departments
WHERE departments_name < 'Software Development'
ORDER BY (departments_name);

-- 13. Вывести фамилии ассистентов, имеющих зарплату (сумма ставки и надбавки) не более 1200.

SELECT teacher_surname, teacher_salary, teacher_premium, teacher_salary + teacher_premium AS 'salary + premium'
FROM teacher
WHERE teacher_position = 'Assistant' AND (teacher_salary + teacher_premium) < 1200;

-- 14. Вывести названия групп 5-го курса, имеющих рейтинг в диапазоне от 2 до 4.

SELECT grоup_name_new, grоup_year, grоup_rating
FROM grоup_new
WHERE grоup_year = 5 AND grоup_rating >= 2 AND grоup_rating <= 4;

-- 15. Вывести фамилии ассистентов со ставкой меньше 550 или надбавкой меньше 200.

SELECT teacher_surname, teacher_salary, teacher_premium
FROM teacher
WHERE teacher_position = 'Assistant' AND teacher_salary < 550 OR teacher_premium < 200;