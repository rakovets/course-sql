CREATE DATABASE music_store;

USE music_store;

DROP TABLE artists;

CREATE TABLE artists (id INT AUTO_INCREMENT, name VARCHAR(40), country VARCHAR(20), age INT, song_count INT, PRIMARY KEY (id));

INSERT INTO artists (name, country, age, song_count) VALUES ('Bon Jovi', 'GB', 50, 120);
INSERT INTO artists (name, country, age, song_count) VALUES ('Sting', 'GB', 60, 120);
INSERT INTO artists (name, country, age, song_count) VALUES ('GunsNRoses', 'USA', 60, 70);
INSERT INTO artists (name, country, age, song_count) VALUES ('ZZTop', 'USA', 70, 50);
INSERT INTO artists (name, country, age, song_count) VALUES ('ACDC', 'Australia', 70, 150);

SELECT SUM(age) FROM (SELECT age FROM artists ORDER BY age LIMIT 2) as a;


SELECT * FROM artists;
SELECT * FROM artists LIMIT 2 OFFSET 4;
SELECT * FROM artists ORDER BY age ASC;
SELECT DISTINCT country FROM artists;
SELECT * FROM artists WHERE age > 60 AND song_count > 100;

SELECT COUNT(*) AS number_of_artists FROM artists;
SELECT AVG(age) AS average_age FROM artists;

SELECT SUM(age) FROM (SELECT age FROM artists ORDER BY age LIMIT 2) as a;

SELECT name AS artist_name, country AS artist_country FROM artists;

UPDATE artists SET name = 'Jon Bon Jovi' WHERE name = 'Bon Jovi';

DELETE FROM artists WHERE name = 'ACDC';

ALTER TABLE artists ADD CONSTRAINT PRIMARY KEY (id);

CREATE TABLE songs (id INT AUTO_INCREMENT, title VARCHAR(60) UNIQUE NOT NULL, artist_id INT, 
PRIMARY KEY (id), FOREIGN KEY (artist_id) REFERENCES artists(id));

INSERT INTO songs (title, artist_id) VALUES ('Have a nice day', 1);

SELECT * FROM songs;
/* Don't do this at home */
SELECT artists.name, songs.title FROM songs, artists WHERE songs.artist_id = artists.id;

DELETE from artists WHERE age = (SELECT max_age FROM (SELECT MAX(age) as max_age from artists as m1) as m2);