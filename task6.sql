drop database if exists academy4;
create database academy4;
USE academy4;
drop TABLE  IF EXISTS curator, department, facultie, grоup , group_curator , group_lecture , lecture, subject , teacher ;


CREATE table curator(
	curator_id int not null auto_increment primary key ,
	name nvarchar(20) not null check (name !='') ,
	surname  nvarchar(20) not null check (surname !='') 
	);

	select*from curator;

	insert curator values (1,'Ivan', 'Kydrishov');
	insert curator values (2,'Nikita','Andreev');
	insert curator values (3,'Serofim','Mayskii');
	insert curator values (4,'Andrei','Meshkov');
	insert curator values (5,'Herman','Ostrovech');


CREATE TABLE facultie (
	facultie_id  int not null auto_increment primary key ,
	financing DOUBLE not null CHECK(financing >=0),
	name nvarchar(20) not null check (name !='') UNIQUE
	);
    
    SELECT * from facultie;
    
	INSERT facultie VALUES(1,44,'Economic');
	INSERT facultie VALUES(2,34,'Pfinancing');
	INSERT facultie VALUES(3,56,'Lenguegies');
	INSERT facultie VALUES(4,77,'Math');
	INSERT facultie VALUES(5,88,'Programing');


CREATE table department(
	department_id int not null auto_increment primary key ,
	financing DOUBLE not null CHECK(financing >=0),
	name nvarchar(20) not null check (name !='') ,
	facultie_id  int not null,
	FOREIGN KEY (facultie_id) REFERENCES facultie (facultie_id)
	);
    
    SELECT * from department;
    
    INSERT department VALUES(1,55,'Math',4);
    INSERT department VALUES(2,66,'Bank',2);
    INSERT department VALUES(3,24,'Counter',1);
    INSERT department VALUES(4,88,'Java',5);
    INSERT department VALUES(5,50,'English',3);
    
    
    
    CREATE TABLE grоup(
		grоup_id int not null auto_increment primary key ,
		name nvarchar(20) not null check (name !='')  UNIQUE ,
		year int not NULL CHECK (1<year<5),
		department_id int not null,
		FOREIGN KEY (department_id) REFERENCES department (department_id)
		);
    
    
    SELECT *FROM grоup;
    
    INSERT grоup VALUES(1,'P107',1,1);
    INSERT grоup VALUES(2,'P108',2,4);
    INSERT grоup VALUES(3,'P109',3,3);
    INSERT grоup VALUES(4,'P1010',5,2);
    INSERT grоup VALUES(5,'P111',3,5);
    INSERT grоup VALUES(6,'P112',4,2);
    INSERT grоup VALUES(7,'P113',2,1);
    INSERT grоup VALUES(8,'P114',5,3);
    
    
    CREATE TABLE group_curator(
		group_curator_id int not null auto_increment primary key ,
		curator_id int not null,
		grоup_id int not null,
		FOREIGN KEY (grоup_id) REFERENCES grоup (grоup_id),
		FOREIGN KEY (curator_id) REFERENCES curator (curator_id)
		);
    
    
    SELECT * from group_curator;
    
    INSERT group_curator VALUES(1,1,1);
    INSERT group_curator VALUES(2,2,2);
    INSERT group_curator VALUES(3,3,3);
    INSERT group_curator VALUES(4,4,4);
    INSERT group_curator VALUES(5,5,5);
    INSERT group_curator VALUES(6,4,6);
    INSERT group_curator VALUES(7,3,7);
    INSERT group_curator VALUES(8,2,8);
    
    
    CREATE TABLE group_lecture (
		group_lecture_id int not null auto_increment primary key ,
		grоup_id int not null,
		lecture_id int not null,
		FOREIGN KEY (grоup_id) REFERENCES grоup (grоup_id),
		FOREIGN KEY (lecture_id) REFERENCES lecture (lecture_id)
		);
        
    SELECT *from group_lecture;
    
    INSERT group_lecture VALUES(1,1,1);
    INSERT group_lecture VALUES(2,2,2);
    INSERT group_lecture VALUES(3,3,3);
    INSERT group_lecture VALUES(4,4,4);
    INSERT group_lecture VALUES(5,5,5);
    INSERT group_lecture VALUES(6,6,6);
    INSERT group_lecture VALUES(7,7,7);
    INSERT group_lecture VALUES(8,8,8);
    INSERT group_lecture VALUES(9,8,9);

    
    CREATE TABLE subject(
		subject_id int not NULL AUTO_INCREMENT primary key ,
		name nvarchar(20) not null check (name !='') UNIQUE
		);
    
    SELECT * from subject;
    
    INSERT subject VALUES (1,'Matematics');
    INSERT subject VALUES (2,'Fizick');
    INSERT subject VALUES (3,'Geometry');
    INSERT subject VALUES (4,'HiMath');
    INSERT subject VALUES (5,'Astronomy');
    INSERT subject VALUES (6,'Pshyhilogist');
    INSERT subject VALUES (7,'Economic');
    INSERT subject VALUES (8,'Algebra');
    INSERT subject VALUES (9,'Olgoritm');
    INSERT subject VALUES (110,'Trigers');
    
    
    CREATE TABLE teacher(
		teacher_id int not NULL AUTO_INCREMENT primary key ,
		name nvarchar(20) not null check (name !=''),
		surname nvarchar(20) not null check (surname !=''),
		salary DECIMAL(15,2) not NULL CHECK (salary>0)
		);
    
    SELECT * from teacher;
    
    INSERT teacher VALUES(1,'Samantha','Adams',790.99);
    INSERT teacher VALUES(2,'Sandra','Nicolson',670.99);
    INSERT teacher VALUES(3,'Sergei','Adamenco',500.99);
    INSERT teacher VALUES(4,'Ivan','Lubko',300.99);
    INSERT teacher VALUES(5,'Irina','Ivanova',687.99);
    INSERT teacher VALUES(6,'Iren','Jordan',345.99);
    INSERT teacher VALUES(7,'Pavel','Golub',900.99);
    INSERT teacher VALUES(8,'Andrei','Serekov',353.99);
    INSERT teacher VALUES(9,'Piter','Pen',569.99);
    INSERT teacher VALUES(10,'Gleb','Vainshtein',120.99);
    
    
    CREATE TABLE lecture(
		lecture_id int not NULL AUTO_INCREMENT primary key ,
        lecture_room nvarchar(20) not null check (lecture_room !=''),
		teacher_id int NOT NULL,
		subject_id int NOT NULL,
		FOREIGN KEY (teacher_id) REFERENCES teacher (teacher_id),
		FOREIGN KEY (subject_id) REFERENCES subject (subject_id)
		);
		
    
    SELECT * from lecture;
    
    INSERT lecture VALUES(1,'109',1,1);
    INSERT lecture VALUES(2,'110',2,2);
    INSERT lecture VALUES(3,'111',3,3);
    INSERT lecture VALUES(4,'112',4,4);
    INSERT lecture VALUES(5,'113',5,5);
    INSERT lecture VALUES(6,'114',6,6);
    INSERT lecture VALUES(7,'115',7,7);
	INSERT lecture VALUES(8,'116',8,8);
    INSERT lecture VALUES(9,'117',9,9);


#  (1 Task : ) Вывести все возможные пары строк преподавателей и групп.

SELECT *
from teacher  t
JOIN lecture l on l.teacher_id = t.teacher_id
JOIN group_lecture gl on gl.lecture_id = l.lecture_id
JOIN grоup g on g.grоup_id =gl.grоup_id;


# (2 Task : )  Вывести названия факультетов, фонд финансирования
# кафедр которых превышает фонд финансирования факультета.

SELECT *
from facultie f
join department d on d.facultie_id=f.facultie_id
WHERE d.financing>f.financing;


# (3 Task : )  Вывести фамилии кураторов групп и названия групп, которые они курируют.

SELECT c.surname , g.name
from curator c
JOIN group_curator gc on gc.curator_id = c.curator_id
join grоup g on g.grоup_id = gc.grоup_id;


# (4 Task : )  Вывести имена и фамилии преподавателей, которые читают
# лекции у группы “P107”.

SELECT c.surname , c.name, g.name 
from curator c
JOIN group_curator gc on gc.curator_id = c.curator_id
join grоup g on g.grоup_id = gc.grоup_id
WHERE g.name ='p107';


# (5 Task : )  Вывести фамилии преподавателей и названия факультетов
# на которых они читают лекции.

SELECT t.name , f.name
from teacher  t
JOIN lecture l on l.teacher_id = t.teacher_id
JOIN group_lecture gl on gl.lecture_id = l.lecture_id
JOIN grоup g on g.grоup_id =gl.grоup_id
JOIN department d on g.department_id =d.department_id
JOIN facultie f on f.facultie_id = d.facultie_id;


# (6 Task : )  Вывести названия кафедр и названия групп, которые к
# ним относятся.

SELECT d.name , g.name
from department d
JOIN grоup g on g.department_id =d.department_id;


# (7 Task : ) Вывести названия дисциплин, которые читает преподаватель “Samantha Adams”.

SELECT s.name
from teacher t
JOIN lecture l on l.teacher_id = t.teacher_id
JOIN subject s on s.subject_id =l.subject_id
WHERE t.name ='Samantha' and t.surname ='Adams';


# (8 Task : ) Вывести названия кафедр, на которых читается дисциплина
# “Database Theory”.

SELECT d.name 
from subject s
JOIN lecture l on l.subject_id = s.subject_id
JOIN group_lecture gl on gl.lecture_id = l.lecture_id
JOIN grоup g on g.grоup_id =gl.grоup_id
JOIN department d on g.department_id =d.department_id
JOIN facultie f on f.facultie_id = d.facultie_id
WHERE s.name ='Olgoritm';


# (9 Task : ) Вывести названия групп, которые относятся к факультету
# “Computer Science”.

SELECT g.name
from facultie f
JOIN department d on d.facultie_id = f.facultie_id
JOIN grоup g on g.department_id = g.grоup_id
WHERE f.name ='Programing';


# (10 Task : ) Вывести названия групп 5-го курса, а также название факультетов, к которым они относятся.

SELECT   g.name , f.name
from facultie f
JOIN department d on d.facultie_id = f.facultie_id
JOIN grоup g on g.department_id = d.department_id
WHERE g.year=5;


# (11 Task : ) Вывести полные имена преподавателей и лекции, которые
# они читают (названия дисциплин и групп), причем отобрать
# только те лекции, которые читаются в аудитории “B103”.

SELECT  t.name , t.surname , s.name , g.name
FROM grоup g 
JOIN group_lecture gl on g.grоup_id =gl.grоup_id
JOIN lecture l on gl.lecture_id = l.lecture_id
JOIN teacher t on l.teacher_id = t.teacher_id
join subject s on s.subject_id =l.subject_id
 WHERE l.lecture_room ='109';
