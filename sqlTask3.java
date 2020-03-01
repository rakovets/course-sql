public class sqlTask3 {
    DROP DATABASE IF EXISTS academy;
    CREATE DATABASE academy;
    USE academy;

    DROP TABLE IF EXISTS department;
    CREATE TABLE department (
            department_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    department_financing FLOAT NOT NULL CHECK (department_financing >= 0)  DEFAULT (0),
    department_name NVARCHAR(100) NOT NULL UNIQUE
);

    INSERT department
    VALUES
            (100.00, 'mechanics'),
	(200.00, 'mathematic'),
            (300.00, 'physics'),
            (250.00, 'history'),
            (150.00, 'philosophy'),
            (170.00, 'geography'),
            (500.00, 'programming');

    SELECT *
    FROM department;

    DROP TABLE IF EXISTS faculty;
    CREATE TABLE faculty (
            faculty_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    faculty_dean NVARCHAR(100) NOT NULL,
    faculty_name NVARCHAR(100) NOT NULL UNIQUE
);

    INSERT faculty
    VALUES
            ('ivan ivanovich', 'faculty_of_мechanics_and_тechnology'),
	('sergey sergeevich', 'faculty_of_automotive'),
            ('nestor nestorovich', 'faculty_of_economics'),
            ('petr petrovich', 'history_faculty'),
            ('sidr sidirivich', 'faculty_of_philosophy'),
            ('arkadiy arcadievich', 'faculty_of_natural_sciences');

    SELECT *
    FROM faculty;

    DROP TABLE IF EXISTS grоup;
    CREATE TABLE grоup (
            grоup_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    grоup_name VARCHAR(10) NOT NULL UNIQUE,
    grоup_rating INT NOT NULL CHECK (grоup_rating >= 0 AND grоup_rating <= 5),
    grоup_year INT NOT NULL CHECK (grоup_year >= 1 AND grоup_year <= 5)
);

    INSERT grоup
    VALUES
            ('gr104114', 4, 5),
	('tr204115', 3, 4),
            ('uh304116', 3, 3),
            ('ok404117', 4, 2),
            ('pl504118', 5, 1),
            ('mi604115', 3, 4),
            ('uj704114', 5, 5),
            ('pi804118', 5, 1);

    SELECT *
    FROM grоup;



    DROP TABLE IF EXISTS teacher;
    CREATE TABLE teacher (
            teacher_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    teacher_employment_date DATE NOT NULL CHECK (teacher_employment_date >= '1990-01-01'),
    teacher_is_assistant BIT NOT NULL DEFAULT (0),
    teacher_is_professor BIT NOT NULL DEFAULT (0),
    teacher_name NVARCHAR (MAX) NOT NULL,
    teacher_position NVARCHAR (MAX) NOT NULL,
    teacher_premium FLOAT NOT NULL CHECK (teacher_premium >= 0) DEFAULT (0),
    teacher_salary FLOAT NOT NULL CHECK (teacher_salary > 0),
    teacher_surname NVARCHAR (MAX) NOT NULL,
);

    INSERT teacher
    VALUES
            ('1995-10-15', 0, 1, 'ivan', 'professor', 20.00, 100.00, 'ivanov'),
	('1996-11-25', 0, 0, 'petr', 'position', 25.00, 120.00, 'petrov'),
            ('1998-07-05', 0, 0, 'sidr', 'position', 22.50, 110.00, 'sidorov'),
            ('2001-12-18', 1, 0, 'kirill', 'position', 10.00, 90.00, 'kirillov'),
            ('1993-01-23', 0, 1, 'feder', 'professor', 30.00, 130.00, 'fedorov'),
            ('1999-03-28', 1, 0, 'irina', 'position', 20.00, 100.00, 'ivanova'),
            ('1993-10-16', 0, 1, 'igor', 'professor', 35.00, 135.00, 'igorev');

    SELECT *
    FROM teacher;

1.
    SELECT *
    FROM department ORDER BY department_id DESC;

2.
    SELECT grоup_name, grоup_rating FROM grоup;

3.
    SELECT
            teacher_surname,
    teacher_premium  / teacher_salary * 100,
            (teacher_salary+teacher_premium)/teacher_salary*100
    FROM teacher;

4.
    SELECT *, CONCAT('The dean of faculty ', faculty_name, ' is ', faculty_dean) AS 'The dean of faculty is dean'
    FROM faculty;

5.
    SELECT teacher_surname
    FROM teacher
    WHERE teacher_position = 'professor' AND teacher_salary > 100;

6.
    SELECT department_name
    FROM department
    WHERE department_financing <= 100 OR department_financing >= 250;

7.
    SELECT faculty_name
    FROM faculty
    WHERE faculty_name <> 'faculty_of_automotive';

8.
    SELECT teacher_surname, teacher_position
    FROM teacher
    WHERE teacher_position <> 'professor';

9.
    SELECT teacher_surname, teacher_position,teacher_salary, teacher_premium
    FROM teacher
    WHERE teacher_position = 'position' AND teacher_premium >= 10 AND teacher_premium <= 25;

10.
    SELECT teacher_surname, teacher_salary
    FROM teacher
    WHERE teacher_position = 'position';

11.
    SELECT teacher_surname, teacher_position
    FROM teacher
    WHERE teacher_employment_date <= '01.01.2000';

12.
    SELECT department_name AS 'name_of_de­part­ment'
    FROM department
    WHERE department_name < 'philosophy'
    ORDER BY department_name;

13.
    SELECT teacher_surname
    FROM teacher
    WHERE teacher_position = 'position' AND teacher_salary+teacher_premium < 125;

14.
    SELECT grоup_name
    FROM grоup
    WHERE grоup_year = 5 AND grоup_rating >= 2 AND grоup_rating <= 4;

15.
    SELECT teacher_surname
    FROM teacher
    WHERE teacher_position = 'position' AND teacher_salary < 120 AND teacher_premium < 20;

}
