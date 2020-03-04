-- Домашнее задание № 2 (DT_DZ_02)
-- Тема: Основы взаимодействия с MySQL и MySQL WorkBench

DROP DATABASE IF EXISTS academy;
CREATE DATABASE academy;
USE academy;
DROP TABLE IF EXISTS grоup, department, faculty, teacher;

CREATE TABLE grоup (
    grоup_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name NVARCHAR(10) NOT NULL CHECK (name != '') UNIQUE,
    year INT CHECK (year >= 1 AND year <= 5) NOT NULL,
    rating INT CHECK (rating >= 0 AND rating <= 5) NOT NULL
);

INSERT grоup VALUES (1, 'DJ001', 1, 3);
INSERT grоup VALUES (NULL, 'SS005', 2, 3);
INSERT grоup VALUES (NULL, 'RQ007', 3, 5);
INSERT grоup VALUES (NULL, 'LS054', 4, 0);
INSERT grоup VALUES (NULL, 'BD015',5 , 4 );

SELECT *
FROM grоup;

CREATE TABLE department (
    department_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL CHECK (name != '') UNIQUE,
    financing DECIMAL(15,2) CHECK (financing >= 0) NOT NULL DEFAULT (0)
);

INSERT department VALUES (1, 'Engineering', 50000.0);
INSERT department VALUES (NULL, 'Biology', 100000.0);
INSERT department VALUES (NULL, 'Linguistics', 4000000.5);

SELECT *
FROM department;

CREATE TABLE faculty (
    faculty_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL CHECK (name != '') UNIQUE
);

INSERT faculty VALUES (1, 'Manufacturing');
INSERT faculty VALUES (NULL, 'Mechanics');
INSERT faculty VALUES (NULL, 'Neuroscience');
INSERT faculty VALUES (NULL, 'Genetics');
INSERT faculty VALUES (NULL, 'Italian');
INSERT faculty VALUES (NULL, 'French');

SELECT *
FROM faculty;

CREATE TABLE teacher (
    teacher_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name NVARCHAR (10000) NOT NULL CHECK (name != ''),
    surname NVARCHAR (10000) NOT NULL,
    salary DECIMAL(15,2) CHECK (salary > 0) NOT NULL,
    premium DECIMAL(15,2) CHECK (premium >= 0) NOT NULL DEFAULT (0),
    employment_date DATE CHECK (employment_date >= '1990-01-01') NOT NULL
);

INSERT teacher VALUES (1, 'Hilary', 'Putnam', 100000.0, 5000.0, '2001-10-03');
INSERT teacher VALUES (NULL, 'Henry', 'Adams', 356000.0, 55000.0, '1998-01-31');
INSERT teacher VALUES (NULL, 'Charles', 'Olson', 150000.0, 35000.0, '1990-06-07');
INSERT teacher VALUES (NULL, 'Daniel', 'Lieberman', 26000.0, 5000.0, '2019-04-28');
INSERT teacher VALUES (NULL, 'Jerome', 'Bruner', 540000.0, 250000.0, '1990-12-17');
INSERT teacher VALUES (NULL, 'John', 'Harvard', 50000.0, 4000.0, '2000-05-24');

SELECT *
FROM teacher;