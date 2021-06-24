-- EXAMPLES
-- Добавление записи в таблицу

INSERT INTO months
VALUES (1, 'January', 31);

INSERT INTO months (id, name, days)
VALUES (2, 'February', 29);

-- Выборка записей из таблицы
-- Простая выборка

SELECT *
FROM characters;

SELECT name, weapon
FROM characters;

-- Выборка уникальных

SELECT DISTINCT name
FROM users;

SELECT DISTINCT name, age
FROM users;

SELECT COUNT(DISTINCT name)
FROM users;

-- Выборка с условием

SELECT *
FROM users
WHERE name = 'Tom';

-- AND
SELECT *
FROM users
WHERE gender = 'F'
  AND balance >= 1000;

-- OR
SELECT *
FROM users
WHERE balance = 1000
   OR age = 25;

-- NOT
SELECT *
FROM users
WHERE NOT age = 30;

-- AND OR NOT
SELECT *
FROM users
WHERE age = 30
  AND (balance > 1000 OR NOT name = 'Tom');

-- Выборка с сортировкой результата

SELECT *
FROM users
ORDER BY name;

SELECT *
FROM users
ORDER BY name ASC;

SELECT *
FROM users
ORDER BY name DESC;

-- Выборка с проверками на NULL

SELECT name, phone
FROM users
WHERE phone IS NULL;

SELECT name, phone
FROM users
WHERE phone IS NOT NULL;

-- Выборка с указанием количества записей в результате

SELECT *
FROM users
LIMIT 3;

SELECT *
FROM users
WHERE balance = 1000
LIMIT 5;

SELECT *
FROM users
LIMIT 2
OFFSET 2;

-- SQL:2008 Standard
SELECT *
FROM users
ORDER BY id DESC
FETCH NEXT 2 ROWS ONLY;

-- WARNING: Oracle Dialect
SELECT *
FROM users
WHERE ROWNUM <= 3;

-- WARNING: Oracle Dialect
SELECT TOP 3 *
FROM users;

-- WARNING: Oracle Dialect
SELECT TOP 25 PERCENT *
FROM users;

-- WARNING: Oracle Dialect
SELECT TOP 5 *
FROM users
WHERE balance = 1000;

-- WARNING: Oracle Dialect
SELECT *
FROM users
WHERE balance = 1000
  AND ROWNUM <= 5;

-- Выборка по заданному шаблону

SELECT *
FROM users
WHERE name LIKE '_o';

SELECT *
FROM users
WHERE name LIKE 'B_l_y';

-- WARNING: Oracle Dialect
SELECT *
FROM users
WHERE name LIKE '[ТРЕ]%';

-- WARNING: Oracle Dialect
SELECT *
FROM users
WHERE name LIKE '[Т-E]%';

-- WARNING: Oracle Dialect
SELECT *
FROM users
WHERE name LIKE '[!ТРЕ]%';

-- WARNING: Oracle Dialect
SELECT *
FROM users
WHERE name NOT LIKE '[ТРЕ]%';

-- Выборка с проверкой на вхождение в множество

SELECT *
FROM users
WHERE country IN ('Belarus', 'Spain', 'France');

SELECT *
FROM users
WHERE country NOT IN ('Belarus', 'Spain', 'France');

-- Выборка с проверкой на вхождение в диапазон

SELECT *
FROM products
WHERE price BETWEEN 5 AND 200;

SELECT *
FROM products
WHERE price NOT BETWEEN 5 AND 200;

SELECT *
FROM products
WHERE (price BETWEEN 5 AND 200)
  AND NOT category_id IN (1, 2);

SELECT *
FROM products
WHERE name BETWEEN 'Bike' AND 'PC'
ORDER BY name;

SELECT *
FROM products
WHERE name NOT BETWEEN 'Bike' AND 'PC'
ORDER BY name;

SELECT *
FROM products
WHERE manufacture_date BETWEEN '2021-02-01' AND '2021-04-01';

-- Псевдонимы

SELECT user_id AS id, name AS user
FROM users;

SELECT name AS user, country AS "User from Country"
FROM users;

SELECT u.name AS buyer, p.name as purchase, p.price
FROM users AS u,
     products AS p
WHERE u.name = 'Lily'
  AND u.user_id = p.user_id;

-- Обновление записей

SELECT *
FROM tv_serials;

UPDATE tv_serials
SET genre = 'drama'
WHERE name = 'Game of Thrones';

SELECT *
FROM tv_serials;

-- Удаление записей из таблицы

SELECT *
FROM tv_serials;

DELETE
FROM tv_serials
WHERE tv_serial_id = 3;

SELECT *
FROM tv_serials;

-- Unsafe query: 'Delete' statement without 'where' clears all data in the table
DELETE
FROM tv_serials;

SELECT *
FROM tv_serials;

DELETE
FROM tv_serials
WHERE tv_serial_id IS NOT NULL;

SELECT *
FROM tv_serials;
