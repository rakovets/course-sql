public class sqlTask2 {
    DROP DATABASE IF EXISTS academy;
    CREATE DATABASE academy;
    USE academy;

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

    DROP TABLE IF EXISTS department;
    CREATE TABLE department (
            department_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
            department_financing INT NOT NULL CHECK (department_financing >= 0)  DEFAULT (0),
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
            faculty_name NVARCHAR(100) NOT NULL UNIQUE
);

    INSERT faculty
        VALUES
            ('faculty_of_мechanics_and_тechnology'),
	        ('faculty_of_automotive'),
            ('faculty_of_economics'),
            ('history_faculty'),
            ('faculty_of_philosophy'),
            ('faculty_of_natural_sciences');

    SELECT *
    FROM faculty;

    DROP TABLE IF EXISTS teacher;
    CREATE TABLE teacher (
            teacher_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
            teacher_employment_date DATE NOT NULL CHECK (teacher_employment_date >= '1990-01-01'),
            teacher_name NVARCHAR (MAX) NOT NULL,
            teacher_premium FLOAT NOT NULL CHECK (teacher_premium >= 0) DEFAULT (0),
            teacher_salary FLOAT NOT NULL CHECK (teacher_salary > 0),
            teacher_surname NVARCHAR (MAX) NOT NULL
);

    INSERT teacher
        VALUES
            ('1995-10-15', 'ivan', 20.00, 100.00, 'ivanov'),
	        ('1996-11-25', 'petr', 25.00, 120.00, 'petrov'),
            ('1998-07-05', 'sidr', 22.50, 110.00, 'sidorov'),
            ('2001-12-18', 'kirill', 10.00, 90.00, 'kirillov'),
            ('1993-01-23', 'feder', 30.00, 130.00, 'fedorov'),
            ('1999-03-28', 'irina', 20.00, 100.00, 'ivanova'),
            ('1993-10-16', 'igor', 35.00, 135.00, 'igorev');

    SELECT *
    FROM teacher;
}
