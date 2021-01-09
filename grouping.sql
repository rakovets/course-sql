-- DROP DATABASE IF EXISTS learning_management_systems;
-- CREATE DATABASE learning_management_systems;
USE learning_management_systems;

DROP TABLE IF EXISTS trainer;
CREATE TABLE trainer(
 trainer_id BIGINT PRIMARY KEY,
 fullname VARCHAR(128),
 birthdate DATE,
 department VARCHAR(64),
 phone VARCHAR(16)
);

DROP TABLE IF EXISTS student_group;
CREATE TABLE student_group(
 group_id BIGINT PRIMARY KEY,
 name VARCHAR(8),
 faculty_id BIGINT
);

DROP TABLE IF EXISTS student;
CREATE TABLE student(
 student_id BIGINT PRIMARY KEY,
 firstname VARCHAR(32),
 lastname VARCHAR(32),
 birthdate DATE,
 student_grant DECIMAL(15, 2) DEFAULT NULL,
 email VARCHAR(64),
 group_id VARCHAR(16)
);

DROP TABLE IF EXISTS subject;
CREATE TABLE subject(
 subject_id BIGINT PRIMARY KEY,
 name VARCHAR(128)
);

DROP TABLE IF EXISTS achievement;
CREATE TABLE achievement(
 achievement_id BIGINT PRIMARY KEY,
 student_id BIGINT,
 subject_id BIGINT,
 assessment INT
);

DROP TABLE IF EXISTS trainer_subject_link;
CREATE TABLE trainer_subject_link(
 trainer_id BIGINT,
 subject_id BIGINT
);

INSERT trainer(trainer_id, fullname, birthdate, department, phone) VALUES (1, 'Sophia Nelson', '1984-12-08', 'Software development', '32-12');
INSERT trainer(trainer_id, fullname, birthdate, department, phone) VALUES (2, 'Emma Kirk', '1973-05-12', 'Mathematics', '55-34');
INSERT trainer(trainer_id, fullname, birthdate, department, phone) VALUES (3, 'Henry MacAlister', '1975-02-17', 'Software development', '32-12');
INSERT trainer(trainer_id, fullname, birthdate, department, phone) VALUES (4, 'Michael Cooper', '1978-11-23', 'Software development', '32-12');
INSERT trainer(trainer_id, fullname, birthdate, department, phone) VALUES (5, 'Daniel Williams', '1979-07-30', 'Cybersecurity', '37-65');
INSERT trainer(trainer_id, fullname, birthdate, department, phone) VALUES (6, 'Sophia Nelson', '1984-12-08', 'Software development', '32-12');
INSERT trainer(trainer_id, fullname, birthdate, department, phone) VALUES (7, 'Daniel Williams', '1979-07-30', 'Cybersecurity', '37-65');

INSERT subject (subject_id, name) VALUES (1, 'Java');
INSERT subject (subject_id, name) VALUES (2, 'Discrete Math');
INSERT subject (subject_id, name) VALUES (3, 'MariaDB');
INSERT subject (subject_id, name) VALUES (4, 'Spring');
INSERT subject (subject_id, name) VALUES (5, 'ITE1');
INSERT subject (subject_id, name) VALUES (6, 'JavaScript');
INSERT subject (subject_id, name) VALUES (7, 'Linux');

INSERT trainer_subject_link VALUES (1, 1);
INSERT trainer_subject_link VALUES (2, 2);
INSERT trainer_subject_link VALUES (3, 3);
INSERT trainer_subject_link VALUES (4, 4);
INSERT trainer_subject_link VALUES (5, 5);
INSERT trainer_subject_link VALUES (6, 6);
INSERT trainer_subject_link VALUES (7, 7);

INSERT student_group (group_id, name, faculty_id) VALUES (1, '29PR21', 1);
INSERT student_group (group_id, name, faculty_id) VALUES (2, '30PR11', 2);
INSERT student_group (group_id, name, faculty_id) VALUES (3, '31PPS11', 3);
INSERT student_group (group_id, name, faculty_id) VALUES (4, '32PR31', 4);
INSERT student_group (group_id, name, faculty_id) VALUES (5, '32PPS11', 5);

INSERT student (student_id, firstname, lastname, birthdate, student_grant, email, group_id) VALUES (1, 'Jack', 'Jones', '1997-11-05', 1256.0, 'jj@net.eu', 1);
INSERT student (student_id, firstname, lastname, birthdate, student_grant, email, group_id) VALUES (2, 'Harry', 'Miller', '1998-02-11', 1100.0, 'hm@net.eu', 1);
INSERT student (student_id, firstname, lastname, birthdate, student_grant, email, group_id) VALUES (3, 'Grace', 'Evans', '1997-06-24', NULL, 'ge@net.eu', 2);
INSERT student (student_id, firstname, lastname, birthdate, student_grant, email, group_id) VALUES (4, 'Lily', 'Wilson', '1998-09-12', NULL, 'lw@net.eu', 2);
INSERT student (student_id, firstname, lastname, birthdate, student_grant, email, group_id) VALUES (5, 'Joshua', 'Johnson', '1997-05-23', 1100.0, 'jo@net.eu', 3);
INSERT student (student_id, firstname, lastname, birthdate, student_grant, email, group_id) VALUES (6, 'Emily', 'Taylor', '1997-12-27', 1100.0, 'et@net.eu', 4);
INSERT student (student_id, firstname, lastname, birthdate, student_grant, email, group_id) VALUES (7, 'Charlie', 'Thomas', '1998-01-31', 1256.0, 'ct@net.eu', 4);
INSERT student (student_id, firstname, lastname, birthdate, student_grant, email, group_id) VALUES (8, 'Oliver', 'Moore', '1997-07-05', NULL, 'om@net.eu', 4);
INSERT student (student_id, firstname, lastname, birthdate, student_grant, email, group_id) VALUES (9, 'Jessica', 'Brown', '1997-07-17', 1100.0, 'jb@net.eu', 5);

INSERT achievement(achievement_id, student_id, subject_id, assessment) VALUES (1, 1, 1, 8);
INSERT achievement(achievement_id, student_id, subject_id, assessment) VALUES (2, 2, 2, 9);
INSERT achievement(achievement_id, student_id, subject_id, assessment) VALUES (3, 3, 3, 7);
INSERT achievement(achievement_id, student_id, subject_id, assessment) VALUES (4, 4, 4, 4);
INSERT achievement(achievement_id, student_id, subject_id, assessment) VALUES (5, 5, 5, 3);
INSERT achievement(achievement_id, student_id, subject_id, assessment) VALUES (6, 6, 6, 10);
INSERT achievement(achievement_id, student_id, subject_id, assessment) VALUES (7, 7, 7, 9);
INSERT achievement(achievement_id, student_id, subject_id, assessment) VALUES (8, 8, 1, 6);
INSERT achievement(achievement_id, student_id, subject_id, assessment) VALUES (9, 9, 2, 8);
INSERT achievement(achievement_id, student_id, subject_id, assessment) VALUES (10, 1, 3, 5);
INSERT achievement(achievement_id, student_id, subject_id, assessment) VALUES (11, 2, 4, 8);