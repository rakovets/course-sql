-- * Uncomment the line for your RDBMS OR you need to manually set the schema to execute the script
-- * For MariaDB
-- USE multi_tabular_databases;
-- * For PostgreSQL
-- SET SEARCH_PATH TO multi_tabular_databases;

-- * NOTE:
-- * `IF EXISTS` - is PostgreSQL/MariaDB dialect

CREATE TABLE authors
(
    author_id   INTEGER,
    name        VARCHAR(50),
    birth_date  DATE,
    nationality VARCHAR(30),
    PRIMARY KEY (author_id)
);

CREATE TABLE books
(
    book_id         INTEGER,
    title           VARCHAR(50),
    number_of_pages INTEGER,
    genre           VARCHAR(20),
    PRIMARY KEY (book_id)
);

CREATE TABLE books_authors
(
    book_id   INTEGER,
    author_id INTEGER,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books (book_id),
    FOREIGN KEY (author_id) REFERENCES authors (author_id)
);

INSERT INTO authors (author_id, name, birth_date, nationality)
VALUES (1, 'Достоевский', '1821-11-11', 'Русский'),
       (2, 'Пушкин', '1799-06-06', 'Русский'),
       (3, 'Бальзак', '1799-05-20', 'Француз');

INSERT INTO books (book_id, title, number_of_pages, genre)
VALUES (1, 'Преступление и наказание', 500, 'Роман'),
       (2, 'Отец Горио', 500, 'Роман'),
       (3, 'Гобсек', 300, 'Роман'),
       (4, 'Евгений Онегин', 80, 'Роман в стихах'),
       (5, 'Сказка о рыбаке и рыбке', 40, 'Сказка');

INSERT INTO books_authors (book_id, author_id)
VALUES (1, 1),
       (2, 3),
       (3, 3),
       (4, 2),
       (5, 2);