DROP DATABASE book_shop;

CREATE DATABASE book_shop;
USE book_shop;

CREATE TABLE country (
	country_id INT NOT NULL AUTO_INCREMENT,
    name NVARCHAR (50) NOT NULL UNIQUE CHECK (name != ''),
	PRIMARY KEY (country_id)
);

INSERT country VALUES
(1, 'Belarus'),
(2, 'Belgium'),
(3, 'Germany'),
(4, 'Russia'),
(5, 'Italia');

CREATE TABLE author (
	author_id INT NOT NULL AUTO_INCREMENT,
    name NVARCHAR (32) NOT NULL CHECK (name != ''),
	surname NVARCHAR (32) NOT NULL CHECK (surname != ''),
    country_id INT NOT NULL,
    PRIMARY KEY (author_id),
    FOREIGN KEY (country_id) REFERENCES country (country_id)
);

INSERT author VALUES
(1, 'Mark', 'Twen', 2),
(2, 'Rey', 'Bradbery', 3),
(3, 'Jordj', 'Orual', 3),
(4, 'Gregori', 'Roberts', 2),
(5, 'Bert', 'Baits', 1);

CREATE TABLE theme (
	theme_id INT NOT NULL AUTO_INCREMENT,
    name NVARCHAR (100) NOT NULL UNIQUE CHECK (name != ''),
	PRIMARY KEY (theme_id)
);

INSERT theme VALUES
(1, 'fantasy'),
(2, 'fantastica'),
(3, 'prikluchenie'),
(4, 'computer sience'),
(5, 'programming');

CREATE TABLE book (
	book_id INT NOT NULL AUTO_INCREMENT,
    name NVARCHAR (32) NOT NULL CHECK (name != ''),
	page INT NOT NULL CHECK (page > 0),
    price DECIMAL (15, 2) NOT NULL CHECK (price >= 0),
	pablish_date DATE NOT NULL CHECK (date(pablish_date) < sysdate()),
    author_id INT NOT NULL,
    theme_id INT NOT NULL,
    PRIMARY KEY (book_id),
    FOREIGN KEY (author_id) REFERENCES author (author_id),
	FOREIGN KEY (theme_id) REFERENCES theme (theme_id)
);

INSERT book VALUES
(1, 'learn Java', 192, 46.66, '2005.09.13', 1, 5),
(2, 'learn heard', 89, 46.96, '2003.12.17', 2, 4),
(3, 'kotlin in action', 550, 44.80, '2010.02.23', 2, 5),
(4, 'ni si vi bi', 3, 23.50, '2012.06.09', 4, 2),
(5, 'sapiens', 109, 35.44, '2016.03.19', 5, 3);

CREATE TABLE shop (
	shop_id INT NOT NULL AUTO_INCREMENT,
    name NVARCHAR (32) NOT NULL CHECK (name != ''),
    country_id INT NOT NULL,
    PRIMARY KEY (shop_id),
    FOREIGN KEY (country_id) REFERENCES country (country_id)
);

INSERT shop VALUES
(1, 'shop warm', 1),
(2, 'first book', 2),
(3, 'books', 3),
(4, 'your book', 4),
(5, 'ready to read', 5);

CREATE TABLE sale (
	sale_id INT NOT NULL AUTO_INCREMENT,
    price DECIMAL (15, 2) NOT NULL CHECK (price >= 0),
	quantity INT NOT NULL CHECK (quantity > 0),
	sale_date DATE NOT NULL CHECK (date(sale_date) < sysdate()) DEFAULT (sysdate()),
    book_id INT NOT NULL,
    shop_id INT NOT NULL,
    PRIMARY KEY (sale_id),
    FOREIGN KEY (book_id) REFERENCES book (book_id),
	FOREIGN KEY (shop_id) REFERENCES shop (shop_id)
);

INSERT sale VALUES
(1, 123.44, 22, '2020.02.11', 1, 2),
(2, 244.54, 12, '2020.02.03', 2, 1),
(3, 63.23, 34, '2019.01.12', 5, 4),
(4, 100.12, 35, '2020.02.02', 3, 3),
(5, 231.90, 3, '2019.11.11', 2, 5);

SELECT name, page, price, pablish_date FROM book
WHERE page > 500 AND page < 650;

SELECT name, page, price, pablish_date FROM book
WHERE name LIKE 'k%' OR name LIKE 'l%';

SELECT * FROM book AS b
JOIN theme AS t ON t.theme_id = b.theme_id
JOIN sale AS s ON s.book_id = b.book_id
WHERE t.name LIKE 'programming' AND s.quantity > 30;

SELECT * FROM book
WHERE name LIKE '%learn%' AND name NOT LIKE '%heard%';

SELECT b.name AS author, t.name AS theme, CONCAT(a.name, ' ', a.surname) AS fullname
FROM book AS b
JOIN theme AS t ON t.theme_id = b.theme_id
JOIN author AS a ON a.author_id = b.author_id
WHERE b.price / page < 0.65;

SELECT name, page, price, pablish_date FROM book
WHERE name LIKE '% % % %';

SELECT b.name AS book_name, t.name AS theme, CONCAT(a.name, a.surname) AS fullname, b.price AS price, s.quantity AS count, sh.name AS shop_name
FROM book AS b
JOIN theme AS t ON t.theme_id = b.theme_id
JOIN author AS a ON a.author_id = b.author_id
JOIN sale AS s ON s.book_id = b.book_id
JOIN shop AS sh ON sh.shop_id = s.shop_id
JOIN country AS c ON c.country_id = sh.country_id
WHERE b.name NOT LIKE '%s%'
AND t.name NOT LIKE 'programming'
AND CONCAT(a.name, ' ', a.surname) NOT LIKE 'Mark Twen'
AND b.price > 30 AND b.price < 50
AND s.quantity >= 8
AND c.name NOT LIKE 'Russia' AND c.name NOT LIKE 'Belgium';

SELECT 'Count of author:', COUNT(a.name) FROM author AS a
	UNION
SELECT 'Count of book:', SUM(s.quantity) FROM sale AS s
	UNION
SELECT 'Average price:', TRUNCATE(AVG(s.price), 2) FROM sale AS s
	UNION
SELECT 'Average count of pages:', TRUNCATE(AVG(b.page), 2) FROM book AS b;

SELECT t.name, SUM(b.page) FROM book AS b, theme AS t
WHERE t.theme_id = b.theme_id
GROUP BY t.name;

SELECT a.name, COUNT(b.author_id) AS count_book, SUM(b.page) FROM author AS a, book AS b
WHERE b.author_id = a.author_id
GROUP BY a.name;

SELECT MAX(b.page) FROM book AS b
JOIN theme AS t ON t.theme_id = b.theme_id
WHERE t.name LIKE 'programming';

SELECT t.name, AVG(SUM(b.page)) FROM book AS b, theme AS t
WHERE t.theme_id = b.theme_id
GROUP BY t.name;