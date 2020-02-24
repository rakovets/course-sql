SELECT 
    *
FROM
    academy.teacher;


SELECT surname , premium / salary *100 , salary/premium * 100 FROM
teacher
ORDER BY premium , salary;

SELECT 
    CONCAT(' The dean of faculties ',
            name,
            ' is : ',
            dekan)
FROM
    faculties
ORDER BY dekan , name;

SELECT 
    SURNAME, format(salary / (salary + premium) * 100,2)
FROM
    teacher
ORDER BY premium , salary;

SELECT 
    *
FROM
    teacher
WHERE
    position = 'profesor' AND salary > 1000;
    
    SELECT 
    faculties.dapartment_id, dekan, name
FROM
    faculties
WHERE
    faculties.name != 'ComputerSinie'
ORDER BY name;

SELECT surname , position 
FROM teacher 
WHERE position NOT IN ('profesor');

SELECT 
    surname, position, premium, salary
FROM
    teacher
WHERE
    isassistant NOT IN (0) AND premium > 160
        AND premium < 550;
        
SELECT surname , premium /salary *100
FROM
teacher
WHERE isassistant NOT IN (0);

SELECT 
    surname, position
FROM
    teacher
WHERE
    2000 - 10 - 10 < employmentdate < 2007 - 01 - 05;
        
        








