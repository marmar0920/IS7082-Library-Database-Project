- DATABASE SETUP
CREATE DATABASE IF NOT EXISTS neighborhood_library;
USE neighborhood_library;

-- DROP TABLES (In case you need to re-run the script to start over)
DROP TABLE IF EXISTS Loans;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Members;
DROP TABLE IF EXISTS Genres;

-- CREATE TABLES
CREATE TABLE Genres (
    GenreID INT PRIMARY KEY AUTO_INCREMENT, 
    GenreName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT, 
    Name VARCHAR(100) NOT NULL, 
    Email VARCHAR(100)
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT, 
    Title VARCHAR(100) NOT NULL, 
    Author VARCHAR(100), 
    GenreID INT, 
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY AUTO_INCREMENT, 
    BookID INT, 
    MemberID INT, 
    DateOut DATE, 
    DueDate DATE, 
    FOREIGN KEY (BookID) REFERENCES Books(BookID), 
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- SAMPLE DATA
INSERT INTO Genres (GenreName) VALUES ('Fiction'), ('Science'), ('History'), ('Mystery');

INSERT INTO Members (Name, Email) VALUES ('Alice Smith', 'alice@email.com'), ('Bob Jones', 'bob@email.com'), ('Charlie Brown', 'charli@email.com'), ('Diana Prince', 'diana@email.com');

INSERT INTO Books (Title, Author, GenreID) VALUES ('The Great Gatsby', 'F. Scott Fitzgerald', 1), ('A Brief History of Time', 'Stephen Hawking', 2), ('The Silent Patient', 'Alex Michaelides', 4), ('The Art of War', 'Sun Tzu', 3), ('1984', 'George Orwell', 1);

INSERT INTO Loans (BookID, MemberID, DateOut, DueDate) VALUES (1, 1, '2026-02-01', '2026-02-15'), (2, 2, '2026-02-05', '2026-02-19'), (3, 3, '2026-02-10', '2026-02-24'), (5, 1, '2026-02-12', '2026-02-26');

