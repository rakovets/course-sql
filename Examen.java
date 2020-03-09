package com.rakovets.java.solid;

public class Examen {
    DROP DATABASE IF EXISTS book_shop;
    CREATE DATABASE book_shop;
    USE book_shop;

    DROP TABLE IF EXISTS country;
    CREATE TABLE country(
            country_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
            name NVARCHAR(50) NOT NULL UNIQUE CHECK(name <> '')
            );

    INSERT country
    VALUES
            (1, 'Англия'),
    (2, 'США'),
            (3, 'Франция'),
            (4, 'Россия'),
            (5, 'Канада');

    SELECT * FROM country;

    DROP TABLE IF EXISTS author;
    CREATE TABLE author(
            author_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
            name NVARCHAR(64) NOT NULL CHECK(name <> ''),
    surname NVARCHAR(64) NOT NULL CHECK(surname <> ''),
    country_id INT NOT NULL,
    FOREIGN KEY(country_id) REFERENCES country (country_id)
            );

    INSERT author
    VALUES
            (1, 'Адитья', 'Бхаргава', 1),
    (2, 'Берт', 'Бейтс', 2),
            (3, 'Джон,','Дакетт,',3),
            (4, 'Алексей,','Васильев,', 4),
            (5, 'Пол','Бэрри', 5);


    SELECT * FROM author;

    DROP TABLE IF EXISTS theme;
    CREATE TABLE theme(
            theme_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
            name NVARCHAR(64) NOT NULL UNIQUE CHECK(name <> '')
            );

    INSERT theme
    VALUES
            (1, ' IT-Алгоритмы'),
    (2, 'IT-Программирование JAVA'),
            (3, 'Разработка'),
            (4, 'Программирование С++'),
            (5, 'Руководство');


    SELECT * FROM theme;

    DROP TABLE IF EXISTS books;
    CREATE TABLE books(
            books_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
            name NVARCHAR(64) NOT NULL CHECK(name <> ''),
    pages INT NOT NULL CHECK(pages <> 0),
    price DECIMAL(15, 2) NOT NULL CHECK(price >= 0),
    publish_date DATE NOT NULL CHECK(publish_date <= NOW()),
    author_id INT NOT NULL,
    theme_id INT NOT NULL,
    FOREIGN KEY(author_id) REFERENCES author (author_id),
    FOREIGN KEY(theme_id) REFERENCES theme (theme_id)
            );

    INSERT books
    VALUES
            (1, 'АГрокаем алгоритмы', 288 ,32.81 , '2019-10-20', 1, 1),
    (2, 'Изучаем Java', 720 , 46.66, '2015-05-05', 2, 2),
            (3, 'HTML и CSS', 480, 52.74 , '2014-02-22', 3, 3),
            (4, 'Программирование алгоритмы на C++', 550, 22.37 , '2018-04-06', 4, 4),
            (5, 'Minecraft', 352, 31.10 , '2017-07-10', 5, 5);

    SELECT * FROM books;

    DROP TABLE IF EXISTS shop;
    CREATE TABLE shop(
            shop_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
            name NVARCHAR(64) NOT NULL CHECK(name <> ''),
    country_id INT NOT NULL,
    FOREIGN KEY(country_id) REFERENCES country (country_id)
            );


    INSERT shop
    VALUES
            (1, 'brit_book', 1),
    (2, 'US_book', 2),
            (3, 'france_book',3),
            (4, 'rus_book', 4),
            (5, 'can_book', 5);

    SELECT * FROM shop;


    DROP TABLE IF EXISTS sale;
    CREATE TABLE sale(
            sale_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
            price DECIMAL(15, 2) NOT NULL CHECK(price >= 0),
    quantity INT NOT NULL CHECK(price > 0),
    -- sale_date DATE NOT NULL DEFAULT NOW() CHECK(sale_date <= NOW()),
    books_id INT NOT NULL,
    shop_id INT NOT NULL,
    FOREIGN KEY(books_id) REFERENCES books (books_id),
    FOREIGN KEY(shop_id) REFERENCES shop (shop_id)
            );

    INSERT sale
    VALUES
            (1, 32.81 , 50,  1, 1),
    (2, 46.66, 170,  2, 2),
            (3, 52.74 , 80,  3, 3),
            (4, 22.37 , 300,  4, 4),
            (5, 31.10 , 1500, 5, 5);

    SELECT * FROM sale;

-- task1
    SELECT * FROM books WHERE pages >= 500 AND pages <=650;

-- task2
    SELECT * FROM books WHERE name LIKE 'А%' OR 'З%';

-- task3
    SELECT * FROM books
    JOIN theme ON theme.theme_id = books.theme_id
    JOIN sale ON sale.books_id = books.books_id
    WHERE theme.name = 'IT-Программирование JAVA' AND sale.quantity >=170;

-- task4
    SELECT * FROM books
    WHERE name LIKE '%алгоритмы%' AND name NOT LIKE '%Программирование%';


-- task5
    SELECT CONCAT(books.name, theme.name, author.name, author.surname) AS all_column
    FROM books
    JOIN theme ON theme.theme_id = books.theme_id
    JOIN author ON author.author_id = books.author_id
    WHERE price / pages >= 0.65;

-- task6
    SELECT *
    FROM books
    WHERE name LIKE '% % % %';

-- task7
    SELECT books.name, theme.name, author.name, author.surname, books.price, sale.quantity, shop.name
    FROM books
    JOIN theme ON theme.theme_id = books.theme_id
    JOIN author ON author.author_id = books.author_id
    JOIN  ON
    JOIN country ON country.country_id =

            -- task8
    ;
    SELECT COUNT(name) FROM author



}
