CREATE TABLE months
(
    month_id INTEGER,
    name     VARCHAR(32),
    days     INTEGER
);

CREATE TABLE characters
(
    character_id INTEGER,
    name         VARCHAR(32),
    weapon       VARCHAR(32)
);

INSERT INTO characters
VALUES (1, 'Tom', 'Axe'),
       (2, 'Jack', 'Knife');

CREATE TABLE users
(
    user_id INTEGER,
    name    VARCHAR(32),
    gender  VARCHAR(1),
    balance SMALLINT,
    age     SMALLINT,
    phone   VARCHAR(32),
    country VARCHAR(32)
);

INSERT INTO users
VALUES (1, 'Lily', 'F', 1000, 19, '+375991234567', 'Belarus'),
       (2, 'Tom', 'M', 1100, 25, '', 'Germany'),
       (3, 'Jack', 'M', 1500, 23, '  ', 'Italy'),
       (4, 'Jack', 'M', 1600, 23, '         ', 'Belarus'),
       (5, 'Leff', 'M', 1000, 67, NULL, 'Spain'),
       (6, 'Billy', 'F', 600, 30, NULL, 'Spain');

CREATE TABLE products
(
    product_id       INTEGER,
    name             VARCHAR(32),
    price            DECIMAL(10, 2),
    manufacture_date DATE,
    category_id      INTEGER,
    user_id          INTEGER
);

INSERT INTO products
VALUES (1, 'Book', 25.25, '2021-01-21', 4, 1),
       (2, 'Bike', 2000.0, '2021-02-16', 2, 2),
       (3, 'PC', 1500.15, '2021-03-11', 3, 3),
       (4, 'Water Bottle', 1.25, '2021-04-06', 1, 4);

CREATE TABLE tv_serials
(
    tv_serial_id INTEGER,
    name         VARCHAR(64),
    genre        VARCHAR(32)
);

INSERT INTO tv_serials
VALUES (1, 'Game of Thrones', 'comedy'),
       (2, 'Wildwest', 'drama'),
       (3, 'Misfits', 'comedy');
