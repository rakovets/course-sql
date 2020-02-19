DROP DATABASE IF EXISTS learning_management_systems;
CREATE DATABASE learning_management_systems;
USE learning_management_systems;

DROP TABLE IF EXISTS trainer;
CREATE TABLE trainer(
 fullname VARCHAR(128),
 birthdate DATE,
 department VARCHAR(64),
 phone VARCHAR(16),
 group_name VARCHAR(16),
 subject VARCHAR(32)
);

INSERT trainer VALUES ('Sophia Nelson', '1984-12-08', 'Software development', '32-12', '31PPS11', 'Java');
INSERT trainer VALUES ('Emma Kirk', '1973-05-12', 'Mathematics', '55-34', '32PR31', 'Discrete Math');
INSERT trainer VALUES ('Henry MacAlister', '1975-02-17', 'Software development', '32-12', '30PR11', 'MariaDB');
INSERT trainer VALUES ('Michael Cooper', '1978-11-23', 'Software development', '32-12', '29PR21', 'Spring');
INSERT trainer VALUES ('Daniel Williams', '1979-07-30', 'Cybersecurity', '37-65', '32PPS11', 'ITE1');
INSERT trainer VALUES ('Sophia Nelson', '1984-12-08', 'Software development', '32-12', '30PR11', 'JavaScript');
INSERT trainer VALUES ('Daniel Williams', '1979-07-30', 'Cybersecurity', '37-65', '32PPS11', 'Linux');

SELECT *
FROM trainer;
