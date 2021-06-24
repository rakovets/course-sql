SELECT a.name, b.title
FROM authors AS a
         JOIN books_authors AS ba ON ba.author_id = a.id
         JOIN books AS b ON ba.book_id = b.id;

SELECT b.title
FROM authors AS a
         JOIN books_authors AS ba ON ba.author_id = a.id
         JOIN books AS b ON ba.book_id = b.id
WHERE a.nationality = 'Француз';

SELECT b.title
FROM authors AS a
         JOIN books_authors AS ba ON ba.author_id = a.id
         JOIN books AS b ON ba.book_id = b.id
WHERE YEAR (a.birth_date) > 1798;

DELETE
FROM books_authors
WHERE book_id = 2;
DELETE
FROM books
WHERE id = 2;

SELECT a.name, a.nationality, a.birth_date, AVG(b.number_of_pages)
FROM authors AS a
         JOIN books_authors AS ba ON ba.author_id = a.id
         JOIN books AS b ON ba.book_id = b.id
GROUP BY a.name
ORDER BY YEAR (a.birth_date);

SELECT a.name, a.nationality, AVG(b.number_of_pages)
FROM authors AS a
         JOIN books_authors AS ba ON ba.author_id = a.id
         JOIN books AS b ON ba.book_id = b.id
GROUP BY a.name
HAVING AVG(b.number_of_pages) > 300;

SELECT a.name, AVG(b.number_of_pages)
FROM authors AS a
         JOIN books_authors AS ba ON ba.author_id = a.id
         JOIN books AS b ON ba.book_id = b.id
GROUP BY a.name
HAVING AVG(b.number_of_pages) > (SELECT AVG(number_of_pages) FROM books);