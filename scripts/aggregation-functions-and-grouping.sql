-- * Uncomment the line for your RDBMS OR you need to manually set the schema to execute the script
-- * For MariaDB
-- USE aggregation_functions_and_grouping;
-- * For PostgreSQL
-- SET SEARCH_PATH TO aggregation_functions_and_grouping;

-- * NOTE:
-- * `IF EXISTS` - is PostgreSQL/MariaDB dialect

CREATE TABLE trainer
(
    trainer_id INTEGER PRIMARY KEY,
    firstname  VARCHAR(128),
    lastname   VARCHAR(128),
    birthdate  DATE,
    department VARCHAR(64),
    phone      VARCHAR(16)
);

CREATE TABLE student_group
(
    group_id   INTEGER PRIMARY KEY,
    name       VARCHAR(8),
    faculty_id INTEGER
);

CREATE TABLE student
(
    student_id    INTEGER PRIMARY KEY,
    firstname     VARCHAR(32),
    lastname      VARCHAR(32),
    birthdate     DATE,
    student_grant DECIMAL(15, 2) DEFAULT NULL,
    email         VARCHAR(64),
    group_id      VARCHAR(16)
);

CREATE TABLE subject
(
    subject_id INTEGER PRIMARY KEY,
    name       VARCHAR(128)
);

CREATE TABLE achievement
(
    achievement_id INTEGER PRIMARY KEY,
    student_id     INTEGER,
    subject_id     INTEGER,
    assessment     INT
);

CREATE TABLE trainer_subject_link
(
    trainer_id INTEGER,
    subject_id INTEGER
);

INSERT INTO trainer(trainer_id, firstname, lastname, birthdate, department, phone)
VALUES (1, 'Sophia', 'Nelson', '1984-12-08', 'Software development', '32-12'),
       (2, 'Emma', 'Kirk', '1973-05-12', 'Mathematics', '55-34'),
       (3, 'Henry', 'MacAlister', '1975-02-17', 'Software development', '32-12'),
       (4, 'Michael', 'Cooper', '1978-11-23', 'Software development', '32-12'),
       (5, 'Daniel', 'Williams', '1979-07-30', 'Cybersecurity', '37-65'),
       (6, 'Sophia', 'Nelson', '1984-12-08', 'Software development', '32-12'),
       (7, 'Daniel', 'Williams', '1979-07-30', 'Cybersecurity', '37-65');

INSERT INTO subject (subject_id, name)
VALUES (1, 'Java'),
       (2, 'Discrete Math'),
       (3, 'MariaDB'),
       (4, 'Spring'),
       (5, 'ITE1'),
       (6, 'JavaScript'),
       (7, 'Linux'),
       (8, 'HighLoad');

INSERT INTO trainer_subject_link
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7);

INSERT INTO student_group (group_id, name, faculty_id)
VALUES (1, '29PR21', 1),
       (2, '30PR11', 2),
       (3, '31PPS11', 3),
       (4, '32PR31', 4),
       (5, '32PPS11', 5),
       (6, '33GR12', 3);

INSERT INTO student (student_id, firstname, lastname, birthdate, student_grant, email, group_id)
VALUES (1, 'Jack', 'Jones', '1997-11-05', 1256.0, 'jj@net.eu', 1),
       (2, 'Harry', 'Miller', '1998-02-11', 1100.0, 'hm@net.eu', 1),
       (3, 'Grace', 'Evans', '1997-06-24', NULL, 'ge@net.eu', 2),
       (4, 'Lily', 'Wilson', '1998-09-12', NULL, 'lw@net.eu', 2),
       (5, 'Joshua', 'Johnson', '1997-05-23', 1100.0, 'jo@net.eu', 3),
       (6, 'Emily', 'Taylor', '1997-12-27', 1100.0, 'et@net.eu', 4),
       (7, 'Charlie', 'Thomas', '1998-01-31', 1256.0, 'ct@net.eu', 4),
       (8, 'Oliver', 'Moore', '1997-07-05', NULL, 'om@net.eu', 4),
       (9, 'Jessica', 'Brown', '1997-07-17', 1100.0, 'jb@net.eu', 5),
       (10, 'Charlotte', 'Becker', '1998-02-11', NULL, 'cb@net.eu', null);

INSERT INTO achievement(achievement_id, student_id, subject_id, assessment)
VALUES (1, 1, 1, 8),
       (2, 2, 2, 9),
       (3, 3, 3, 7),
       (4, 4, 4, 4),
       (5, 5, 5, 3),
       (6, 6, 6, 10),
       (7, 7, 7, 9),
       (8, 8, 1, 6),
       (9, 9, 2, 8),
       (10, 1, 3, 5),
       (11, 2, 4, 8);
