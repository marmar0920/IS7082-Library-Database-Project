USE neighborhood_library;

-- -----------------------------------------------------
-- PART 1: BASIC SELECTS & FILTERS (5 Queries)
-- -----------------------------------------------------

-- 1. List all books in the library inventory
SELECT * FROM Books;

-- 2. List all registered members alphabetically
SELECT Name, Email FROM Members ORDER BY Name ASC;

-- 3. Find all books written by 'George Orwell'
SELECT Title FROM Books WHERE Author = 'George Orwell';

-- 4. List all genres available in the system
SELECT GenreName FROM Genres;

-- 5. Find loans that are due after February 20th, 2026
SELECT * FROM Loans WHERE DueDate > '2026-02-20';


-- -----------------------------------------------------
-- PART 2: JOINS (6 Queries)
-- -----------------------------------------------------

-- 6. Display Book Titles alongside their Genre Names
SELECT B.Title, G.GenreName 
FROM Books B 
JOIN Genres G ON B.GenreID = G.GenreID;

-- 7. Show which Member has checked out which Book (Current Loans)
SELECT M.Name, B.Title, L.DateOut 
FROM Loans L 
JOIN Members M ON L.MemberID = M.MemberID 
JOIN Books B ON L.BookID = B.BookID;

-- 8. Find all books currently checked out by 'Alice Smith'
SELECT B.Title, L.DateOut 
FROM Books B 
JOIN Loans L ON B.BookID = L.BookID 
JOIN Members M ON L.MemberID = M.MemberID 
WHERE M.Name = 'Alice Smith';

-- 9. List all Genres and the count of books in each (using JOIN)
SELECT G.GenreName, COUNT(B.BookID) AS BookCount
FROM Genres G
LEFT JOIN Books B ON G.GenreID = B.GenreID
GROUP BY G.GenreName;

-- 10. Identify books in the 'Fiction' genre using a Join
SELECT B.Title, B.Author 
FROM Books B 
JOIN Genres G ON B.GenreID = G.GenreID 
WHERE G.GenreName = 'Fiction';

-- 11. Show all Loan IDs with the specific Member Email for contact
SELECT L.LoanID, M.Email, B.Title 
FROM Loans L 
JOIN Members M ON L.MemberID = M.MemberID 
JOIN Books B ON L.BookID = B.BookID;


-- -----------------------------------------------------
-- PART 3: SQL FUNCTIONS & AGGREGATES (4 Queries)
-- -----------------------------------------------------

-- 12. Calculate the total number of books in the library
SELECT COUNT(*) AS TotalInventory FROM Books;

-- 13. Calculate how many days each loan is checked out for (Function: DATEDIFF)
SELECT LoanID, DATEDIFF(DueDate, DateOut) AS LoanDurationDays FROM Loans;

-- 14. Show Member names in all uppercase for mailing labels (Function: UPPER)
SELECT UPPER(Name) AS MemberNameCaps FROM Members;

-- 15. Find the average number of books per genre (Function: AVG)
-- Using a subquery to first count books by genre
SELECT AVG(BookCount) AS AverageBooksPerGenre 
FROM (SELECT COUNT(BookID) AS BookCount FROM Books GROUP BY GenreID) AS GenreCounts;

