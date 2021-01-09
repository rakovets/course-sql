CREATE DATABASE library;
USE library;

CREATE TABLE authors (id INT AUTO_INCREMENT, name VARCHAR(50), birth_date DATE, nationality VARCHAR(30), PRIMARY KEY(id));
CREATE TABLE books (id INT AUTO_INCREMENT, title VARCHAR(50), number_of_pages INT, genre VARCHAR(20), PRIMARY KEY(id));
CREATE TABLE books_authors (book_id INT, author_id INT, PRIMARY KEY(book_id, author_id),
			FOREIGN KEY (book_id) REFERENCES books(id),
            FOREIGN KEY (author_id) REFERENCES authors(id));
            
INSERT INTO authors (name, birth_date, nationality) VALUES ('Достоевский', '1821-11-11', 'Русский');
INSERT INTO authors (name, birth_date, nationality) VALUES ('Пушкин', '1799-06-06', 'Русский');
INSERT INTO authors (name, birth_date, nationality) VALUES ('Бальзак', '1799-05-20', 'Француз');

INSERT INTO books (title, number_of_pages, genre) VALUES ('Преступление и наказание', 500, 'Роман');
INSERT INTO books_authors (book_id, author_id) VALUES (1, 1);

INSERT INTO books (title, number_of_pages, genre) VALUES ('Отец Горио', 500, 'Роман');
INSERT INTO books_authors (book_id, author_id) VALUES (2, 3);

INSERT INTO books (title, number_of_pages, genre) VALUES ('Гобсек', 300, 'Роман');
INSERT INTO books_authors (book_id, author_id) VALUES (3, 3);

INSERT INTO books (title, number_of_pages, genre) VALUES ('Евгений Онегин', 80, 'Роман в стихах');
INSERT INTO books_authors (book_id, author_id) VALUES (4, 2);

INSERT INTO books (title, number_of_pages, genre) VALUES ('Сказка о рыбаке и рыбке', 40, 'Сказка');
INSERT INTO books_authors (book_id, author_id) VALUES (5, 2);

SELECT a.name, b.title FROM authors AS a
			JOIN books_authors AS ba ON ba.author_id = a.id
            JOIN books AS b ON ba.book_id = b.id;
            
SELECT b.title FROM 
			authors AS a
			JOIN books_authors AS ba ON ba.author_id = a.id
            JOIN books AS b ON ba.book_id = b.id
            WHERE a.nationality = 'Француз';
            
SELECT b.title FROM 
			authors AS a
			JOIN books_authors AS ba ON ba.author_id = a.id
            JOIN books AS b ON ba.book_id = b.id
            WHERE YEAR(a.birth_date) > 1798;

DELETE FROM books_authors WHERE book_id = 2;
DELETE FROM books WHERE id = 2;

SELECT a.name, a.nationality, a.birth_date, AVG(b.number_of_pages) FROM 
			authors AS a
			JOIN books_authors AS ba ON ba.author_id = a.id
            JOIN books AS b ON ba.book_id = b.id	
            GROUP BY a.name ORDER BY YEAR(a.birth_date);
            
SELECT a.name, a.nationality, AVG(b.number_of_pages) FROM 
			authors AS a
			JOIN books_authors AS ba ON ba.author_id = a.id
            JOIN books AS b ON ba.book_id = b.id	
            GROUP BY a.name HAVING AVG(b.number_of_pages) > 300;
            
SELECT a.name, AVG(b.number_of_pages) FROM 
			authors AS a
			JOIN books_authors AS ba ON ba.author_id = a.id
            JOIN books AS b ON ba.book_id = b.id
            GROUP BY a.name 
            HAVING AVG(b.number_of_pages) > (SELECT AVG(number_of_pages) FROM books);