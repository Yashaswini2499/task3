-- Task 3: Data Extraction
USE LibraryDB;

------------------------------------------------------------
-- 1. SELECT * and specific columns
------------------------------------------------------------
-- All columns from Members
SELECT * FROM Members;

-- Specific columns: show only name and email of members
SELECT name, email FROM Members;

-- All Books with only title and available_copies
SELECT title, available_copies FROM Books;

------------------------------------------------------------
-- 2. Apply WHERE, AND, OR, LIKE, BETWEEN
------------------------------------------------------------
-- Members who joined today
SELECT * FROM Members
WHERE join_date = CURDATE();

-- Books published between 1995 and 2000
SELECT * FROM Books
WHERE published_year BETWEEN 1995 AND 2000;

-- Authors from UK OR with country unknown
SELECT * FROM Authors
WHERE country = 'UK' OR country IS NULL;

-- Find members whose name starts with 'A'
SELECT * FROM Members
WHERE name LIKE 'A%';

-- Borrowings where book is not yet returned
SELECT * FROM Borrowings
WHERE return_date IS NULL;

-- Books with available copies >= 3 AND published after 1995
SELECT * FROM Books
WHERE available_copies >= 3 AND published_year > 1995;

------------------------------------------------------------
-- 3. Sort with ORDER BY
------------------------------------------------------------
-- Sort members by join date (latest first)
SELECT * FROM Members
ORDER BY join_date DESC;

-- Sort books alphabetically by title
SELECT * FROM Books
ORDER BY title ASC;

-- List authors by country, then name
SELECT * FROM Authors
ORDER BY country, name;

------------------------------------------------------------
-- 4. LIMIT (restrict rows)
------------------------------------------------------------
-- First 2 members
SELECT * FROM Members
LIMIT 2;

-- Top 2 most recently published books
SELECT * FROM Books
ORDER BY published_year DESC
LIMIT 2;

------------------------------------------------------------
-- BONUS: Join Example (Optional)
------------------------------------------------------------
-- List borrowed books with member names
SELECT b.borrow_id, m.name AS member_name, bk.title AS book_title, b.borrow_date, b.return_date
FROM Borrowings b
JOIN Members m ON b.member_id = m.member_id
JOIN Books bk ON b.book_id = bk.book_id;
