--READ
--All books
SELECT * FROM books;

--books by title
SELECT * FROM books WHERE title = '1984';

--books by author
SELECT b.title, a.name FROM books b JOIN authors a ON b.author_id = a.id WHERE a.name = 'George Orwell';

--available books
SELECT title, published_year FROM books WHERE available = TRUE;

--Books by Id
SELECT * FROM books WHERE id = 1;

--UPDATE
--Book is borrowed
UPDATE books SET available = FALSE WHERE id = 1;

--add genre
UPDATE books SET genres = array_append(genres, 'Classic') WHERE id = 3; 

--Add a borrowed book to a patron’s record	
UPDATE patrons SET borrowed_books = array_append(borrowed_books, 10) WHERE id = 1; 

--Update book availability	
UPDATE books SET available = TRUE WHERE id = 1;

--DELETE
--Delete a book by title	
DELETE FROM books WHERE title = 'Moby-Dick';

--Delete an author by ID	
DELETE FROM authors WHERE id = 9;

--Advanced
--Find books published after 1950
SELECT title, published_year 
FROM books 
WHERE published_year > 1950;

--Find all American authors
SELECT name FROM authors WHERE nationality = 'American';

--Set all books as available
UPDATE books SET available = TRUE

--Find available books AND published after 1950
SELECT title FROM books WHERE available = TRUE AND published_year > 1950;

--Find authors whose names contain "George"
SELECT name FROM authors WHERE name LIKE '%George%';

--Increment the published year 1869 by 1
UPDATE books SET published_year = published_year + 1 WHERE published_year = 1869; -- Changes War and Peace year to 1870

--Increment the published year 1869 by 1.
SELECT name FROM patrons WHERE 1 = ANY(borrowed_books);
