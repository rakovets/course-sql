
DROP DATABASE IF EXISTS learning_management_systems;
CREATE DATABASE learning_management_systems;
USE learning_management_systems;

CREATE TABLE trainer(
 trainer_id INT,
 fullname VARCHAR(128),
 birthdate DATE,
 department_id INT,
 group_name VARCHAR(16),
 subject VARCHAR(32)
);

CREATE TABLE department(
department_id INT,
department_name VARCHAR(50),
department_phone VARCHAR (10)
);

INSERT department VALUES (1, 'Software development','32-12');
INSERT department VALUES (2, 'Mathematics','55-34');
INSERT department VALUES (3,'Cybersecurity','37-65');

INSERT trainer VALUES (1,'Sophia Nelson', '1984-12-08', 1,  '31PPS11', 'Java');
INSERT trainer VALUES (2,'Emma Kirk', '1973-05-12', 2, '32PR31', 'Discrete Math');
INSERT trainer VALUES (3,'Henry MacAlister', '1975-02-17', 1, '30PR11', 'MariaDB');
INSERT trainer VALUES (4,'Michael Cooper', '1978-11-23', 1, '29PR21', 'Spring');
INSERT trainer VALUES (5,'Daniel Williams', '1979-07-30', 3,  '32PPS11', 'ITE1');
INSERT trainer VALUES (6,'Sophia Nelson', '1984-12-08', 3,  '30PR11', 'JavaScript');
INSERT trainer VALUES (7,'Daniel Williams', '1979-07-30', 3, '32PPS11', 'Linux');

SELECT *
FROM trainer;

SELECT 
t.trainer_id , t.fullname , d.department_id 
FROM 
trainer AS t 
INNER JOIN department AS d ON t.trainer_id = d.department_id
ORDER BY t.fullname;
