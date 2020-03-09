drop database if exists bookshop;
create database  bookshop;
USE  bookshop;
drop TABLE  IF EXISTS author, book, countrie, sale , shop , theme;


create TABLE countrie (
	countrie_id int not null auto_increment primary key ,
	name nvarchar(20) not null check (name !='') UNIQUE
	);
    
    SELECT *FROM countrie;
    
INSERT countrie VALUES(1,'Mexico');
INSERT countrie VALUES(2,'Russia');
INSERT countrie VALUES(3,'Poland');
INSERT countrie VALUES(4,'England');
INSERT countrie VALUES(5,'Spain');
INSERT countrie VALUES(6,'Brazil');
INSERT countrie VALUES(7,'Argentina');
INSERT countrie VALUES(8,'Georgia');
INSERT countrie VALUES(9,'Moldova');
INSERT countrie VALUES(10,'Ukrain');



CREATE TABLE author(
	author_id int not null auto_increment primary key ,
	name  nvarchar(20) not null check (name !='') ,
	surname nvarchar(20) not null check (surname !='') ,
	countrie_id  int not null,
	FOREIGN KEY (countrie_id) REFERENCES countrie (countrie_id)
	);

select * from author;

INSERT  author values (1,'Mihail','Bulgakiv',1);
INSERT  author values (2,'Aleksei','Tolstoi',2);
INSERT  author values (3,'Yurii','Ivanov',3);
INSERT  author values (4,'Mihail','Krug',4);
INSERT  author values (5,'Ivan','Ahlabustin',5);
INSERT  author values (6,'Kosten','Kudin',6);
INSERT  author values (7,'Sergei','Kydrrshov',7);
INSERT  author values (8,'Ksenia','Ivanova',8);
INSERT  author values (9,'Urii','Peskov',9);
INSERT  author values (10,'Troi','Odin',10);


CREATE TABLE theme(
	theme_id int not null auto_increment primary key ,
	name nvarchar(20) not null check (name !='') UNIQUE
	);

SELECT * FROM theme;

INSERT theme VALUES (1,'Roman');
INSERT theme VALUES (2,'Fantacy');
INSERT theme VALUES (3,'Exiting');
INSERT theme VALUES (4,'Triler');
INSERT theme VALUES (5,'Horror');
INSERT theme VALUES (6,'Melidram');
INSERT theme VALUES (7,'Drama');
INSERT theme VALUES (8,'Peace');
INSERT theme VALUES (9,'Force');
INSERT theme VALUES (10,'Psyhologyst');

CREATE TABLE shop (
	shop_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name NVARCHAR(50) NOT NULL CHECK(name != ''),
    countrie_id INT NOT NULL,
    FOREIGN KEY (countrie_id) REFERENCES countrie (countrie_id)
);

SELECT * from shop;

INSERT shop VALUES(1,'oz',1);
INSERT shop VALUES(2,'qz',2);
INSERT shop VALUES(3,'ez',3);
INSERT shop VALUES(4,'tz',4);
INSERT shop VALUES(5,'iz',5);
INSERT shop VALUES(6,'pz',6);
INSERT shop VALUES(7,'jz',7);
INSERT shop VALUES(8,'hz',8);
INSERT shop VALUES(9,'kz',9);
INSERT shop VALUES(10,'mz',10);


CREATE TABLE book (
	book_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name NVARCHAR(30) NOT NULL CHECK (name != ''),
    page INT NOT NULL CHECK (page > 0),
    price DECIMAL(15,2) NOT NULL CHECK (price > 0),
    publish_date DATE CHECK (DATE (publish_date) < sysdate()) NOT NULL,
    author_id INT NOT NULL,
    theme_id INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES author (author_id),
    FOREIGN KEY (theme_id) REFERENCES theme (theme_id)
);

SELECT * from book;

INSERT book VALUES (1,'Peac and Force',500,55.0,'1910-10-10',2,8);
INSERT book VALUES (2,'Alica in Fantacy',150,20.90,'2010-04-02',1,2);
INSERT book VALUES (3,'Gena',300,34.99,'1985-09-10',3,4);
INSERT book VALUES (4,'Peac',599,55.63,'1910-10-10',5,7);
INSERT book VALUES (5, 'Force',500,55.33,'1910-10-10',6,3);
INSERT book VALUES (6,'Peac and Force',500,55.22,'1910-10-10',7,1);
INSERT book VALUES (7,'Peac and Force',500,55.77,'1910-10-10',8,9);
INSERT book VALUES (8,'Peac and Force',500,11.33,'1910-10-10',9,10);
INSERT book VALUES (9,'Peac and Force',500,45.84,'1910-10-10',10,5);
INSERT book VALUES (10,'Peac and Force',500,40.78,'1910-10-10',4,6);

CREATE TABLE sale (
	sale_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    price DECIMAL(15,2) NOT NULL CHECK (price > 0),
    quantity INT NOT NULL CHECK (quantity > 0),
    sale_date DATE CHECK (DATE (sale_date) < sysdate()) NOT NULL,
    book_id INT NOT NULL,
    shop_id INT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES book (book_id),
    FOREIGN KEY (shop_id) REFERENCES shop (shop_id)
);

SELECT * from sale;

INSERT sale VALUES(1,45.22,7,'2011-10-10',1,1);
INSERT sale VALUES(2,10.33,7,'2012-10-10',2,2);
INSERT sale VALUES(3,23.78,7,'2013-10-10',3,3);
INSERT sale VALUES(4,43.67,7,'2014-10-10',4,4);
INSERT sale VALUES(5,12.55,7,'2015-10-10',5,5);
INSERT sale VALUES(6,56.89,7,'2016-10-10',6,6);
INSERT sale VALUES(7,99.99,7,'2017-10-10',7,7);
INSERT sale VALUES(8,34.35,7,'2018-10-10',8,8);
INSERT sale VALUES(9,23.56,7,'2019-10-10',9,9);
INSERT sale VALUES(10,67.67,7,'2020-01-10',10,10);


#  (1 Task : Показать все книги, количество страниц в которых больше
# 500, но меньше 650.
  
SELECT b.name
FROM book b
WHERE b.page>500 and b.page<650;

#  (2 Task :Показать все книги, в которых первая буква названия либо
# «А», либо «З». ) 

SELECT *
FROM book b 
WHERE b.name  LIKE 'P%' or b.name LIKE 'F%';

#  (3 Task :Показать все книги жанра «Детектив», количество проданных книг более 30 экземпляров.)

SELECT *
FROM book b
JOIN theme t on t.theme_id =b.theme_id
JOIN sale s on s.book_id = b.book_id
WHERE t.name = 'Drama' and s.quantity>5;

#  (4 Task :Показать все книги, в названии которых есть слово «Microsoft», но нет слова «Windows».)

SELECT *
FROM book b
WHERE b.name LIKE 'Peac%' or b.name NOT LIKE 'Force%';

#  (5 Task :Показать все книги (название, тематика, полное имя автора
# в одной ячейке), цена одной страницы которых меньше
# 65 копеек.)

SELECT b.name , t.name , a.name , a.surname , format(COUNT(page)/price ,2) 
FROM book b 
JOIN theme t on t.theme_id =b.theme_id
JOIN author a on a.author_id =b.author_id
WHERE price > 0.65;

# (6 Task :Показать все книги, название которых состоит из 4 слов.)

SELECT * 
FROM book b
WHERE b.name  LIKE "_%_%_%_%";

#  (7 Task :Показать информацию о продажах в следующем виде:
# Название книги, но, чтобы оно не содержало букву «А».
# Тематика, но, чтобы не «Программирование».
# Автор, но, чтобы не «Герберт Шилдт».
# Цена, но, чтобы в диапазоне от 10 до 20 гривен.
# Количество продаж, но не менее 8 книг.
# Название магазина, который продал книгу, но он не
# должен быть в Украине или России.

SELECT b.name, t.name , a.name , b.price , s.quantity , sh.name , c.name
FROM sale s
JOIN shop sh on sh.shop_id = s.shop_id
JOIN book b on b.book_id = s.book_id
JOIN theme t on t.theme_id = b.theme_id
JOIN author a on a.author_id = b.author_id
JOIN countrie c on c.countrie_id = sh.countrie_id
WHERE b.name NOT LIKE 'G%' and
 t.name not LIKE 'Drama%' and
 a.name not like  'Troi%' and 
 b.price >11.33 and b.price<56 and 
 s.quantity>=4 and
 c.name NOT LIKE 'Brazil%'  and
 c.name not like 'Mexico%';

#  (8 Task :Показать следующую информацию в два столбца (числа
# в правом столбце приведены в качестве примера):
# Количество авторов: 14
# Количество книг: 47
# Средняя цена продажи: 85.43 грн.
# Среднее количество страниц: 650.6..)

SELECT  'Количество авторов:' ,COUNT(a.name)
FROM author a UNION
SELECT 'Количество книг:' ,COUNT(b.name)
FROM book b UNION
SELECT 'Средняя цена продажи:' , format(AVG (s.price) , 2) 
from sale s UNION
SELECT 'Среднее количество страниц:' , format(AVG (b.page) , 2) 
FROM book b;

# (9 Task :Показать тематики книг и сумму страниц всех книг по
# каждой из них.)

SELECT  t.name , 'Summa pages : ' , SUM(b.page) 
from book b 
JOIN theme t on t.theme_id = b.book_id
GROUP BY b.name ;

# (10 Task :Показать количество всех книг и сумму страниц этих книг
# по каждому из авторов.)

SELECT a.name , a.surname , SUM(b.page) AS 'Summa pages' , COUNT(b.name) as 'Count book'
FROM book b 
JOIN author a on a.author_id = b.author_id
GROUP BY a.name;

# (11 Task :Показать книгу тематики «Программирование» с наибольшим количеством страниц.)

SELECT MAX(b.page) as 'Max page' , b.*
FROM book b
JOIN theme t on t.theme_id = b.theme_id
WHERE t.name LIKE 'Horror%';

# (12 Task :Показать среднее количество страниц по каждой тематике,
# которое не превышает 400.)

SELECT  format(avg(b.page),2) as 'Average page' , t.name
from book b
JOIN theme t on t.theme_id = b.theme_id
GROUP BY t.name;

# (13 Task :Показать сумму страниц по каждой тематике, учитывая
# только книги с количеством страниц более 400, и чтобы
# тематики были «Программирование», «Администрирование» и «Дизайн».)

SELECT  SUM(b.page ) as 'Sum page', t.name
from book b
JOIN theme t on t.theme_id = b.theme_id
WHERE t.name in ('Drama','Force') and b.page>400
GROUP BY t.name;

# (14 Task : Показать информацию о работе магазинов: что, где, кем,
# когда и в каком количестве было продано.)

SELECT b.name , c.name , s.name , sl.sale_date , sl.quantity
FROM shop s
JOIN sale sl on sl.shop_id =s.shop_id
JOIN countrie c on c.countrie_id = s.countrie_id
JOIN book b on b.book_id = sl.book_id;

# (15 Task : Показать самый прибыльный магазин.)

SELECT  MAX(s.price - b.price )  as 'Most profit shop : ', sh.*
from book b 
JOIN sale s on s.book_id =b.book_id
JOIN shop sh on sh.shop_id =s.shop_id
GROUP BY sh.name;


gg