SELECT *
FROM student;

-- Aggregation functions
-- COUNT()

SELECT COUNT(*) AS "count students"
FROM student;

SELECT COUNT(student_grant) AS "count student's grants"
FROM student;

SELECT COUNT(DISTINCT student_grant) AS "count unique values for student's grants"
FROM student;

-- AVG()

SELECT AVG(student_grant) AS "Average student's grant"
FROM student;

SELECT AVG(DATEDIFF(NOW(), birthdate) / 365.25) AS "Average age"
FROM student;

-- SUM()

SELECT SUM(student_grant) AS "Sum student's grants"
FROM student;

-- MIN()

SELECT MIN(birthdate) AS "Min date of birth"
FROM student;

-- MAX()

SELECT MAX(lastname) AS "Maximum last name"
FROM student;

-- using LIKE

SELECT COUNT(*) AS "count students"
FROM student
WHERE firstname LIKE 'J%';

SELECT COUNT(*) AS "count students"
FROM student AS s,
     student_group AS sg
WHERE sg.group_id = s.group_id
  AND sg.name LIKE '32%';

-- Grouping with using GROUP BY

-- [42803] ERROR: column "sg.name" must appear in the GROUP BY clause or be used in an aggregate function
SELECT sg.name, COUNT(*) AS "count students in groups"
FROM student AS s,
     student_group AS sg
WHERE sg.group_id = s.group_id;

SELECT sg.name, COUNT(*) AS "count students in groups"
FROM student AS s,
     student_group AS sg
WHERE sg.group_id = s.group_id
GROUP BY sg.name;

SELECT sg.name,
       s.student_grant,
       COUNT(*) AS "count students in groups with student's grant"
FROM student AS s,
     student_group AS sg
WHERE sg.group_id = s.group_id
GROUP BY sg.name, s.student_grant;

-- using HAVING

-- [42803] ERROR: aggregate functions are not allowed in WHERE
SELECT lastname, student_grant
FROM student
WHERE AVG(student_grant) <= 1200;

SELECT lastname, student_grant
FROM student
GROUP BY lastname, student_grant
HAVING AVG(student_grant) <= 1200
ORDER BY lastname;

SELECT name, COUNT(*) AS "Number of students"
FROM student_group AS sg,
     student AS s
WHERE sg.group_id = s.group_id
GROUP BY name
HAVING COUNT(s.group_id) > 2;

SELECT firstname, lastname
FROM student
GROUP BY firstname, lastname
HAVING lastname IN ('Moore', 'Thomas', 'Doe');

SELECT MIN(lastname) AS "Minimum lastname"
FROM student
HAVING AVG(student_grant) > 1100;

-- Subqueries

-- [21000] ERROR: more than one row returned by a subquery used as an expression
SELECT lastname, firstname, group_id
FROM student
WHERE group_id = (SELECT group_id
                  FROM student_group
                  WHERE name LIKE '%11');

SELECT lastname, firstname, name, student_grant
FROM student AS s,
     student_group AS sg
WHERE sg.group_id = s.group_id
  AND student_grant = 1256;

SELECT lastname, firstname, name, student_grant
FROM student AS s,
     student_group AS sg
WHERE sg.group_id = s.group_id
GROUP BY lastname, firstname, name, student_grant
HAVING student_grant = MAX(student_grant);

SELECT lastname, firstname, name, student_grant
FROM student AS s,
     student_group AS sg
WHERE sg.group_id = s.group_id
  AND student_grant = (SELECT MAX(student_grant)
                       FROM student);

SELECT lastname, firstname, group_id
FROM student
WHERE group_id IN (SELECT group_id
                   FROM student_group
                   WHERE name LIKE '%11');

SELECT t.lastname, sq.name
FROM trainer AS t,
     trainer_subject_link AS tsl,
     (SELECT s.subject_id, s.name
      FROM subject AS s,
           achievement AS a
      WHERE s.subject_id = a.subject_id
      GROUP BY s.name, s.subject_id
      HAVING MAX(a.assessment) >= 8) AS sq
WHERE t.trainer_id = tsl.trainer_id
  AND tsl.subject_id = sq.subject_id;

SELECT lastname
FROM trainer
GROUP BY lastname
HAVING AVG(MONTH(birthdate)) > (SELECT AVG(MONTH(birthdate))
                                FROM student);

SELECT name
FROM student_group
WHERE group_id IN (SELECT group_id
                   FROM student
                   WHERE student_grant = (SELECT MAX(student_grant)
                                          FROM student));

SELECT subject.name,
       (SELECT MAX(a.assessment)
        FROM achievement AS a
        WHERE subject.subject_id = a.subject_id) AS maximum
FROM subject;
