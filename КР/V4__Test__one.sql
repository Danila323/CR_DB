CREATE TABLE Books (
    BookID SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255),
    PublicationDate DATE,
    Price DECIMAL(10, 2) NOT NULL,
    Category VARCHAR(50),
    ISBN VARCHAR(20) UNIQUE
);

CREATE TABLE Readers (
    ReaderID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthDate DATE,
    Email VARCHAR(100) UNIQUE,
    City VARCHAR(100),
    RegistrationDate TIMESTAMP
);

CREATE TABLE BookLoans (
    LoanID SERIAL PRIMARY KEY,
    BookID INT,
    ReaderID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (ReaderID) REFERENCES Readers(ReaderID),
    CHECK (LoanDate < ReturnDate)
);

INSERT INTO Books (BookID, Title, Author, PublicationDate, Price, Category, ISBN)
VALUES
    (1, 'The Great Gatsby', 'F. Scott Fitzgerald', '1925-04-10', 12.99, 'Classic', '978-0743273565'),
    (2, 'To Kill a Mockingbird', 'Harper Lee', '1960-07-11', 14.99, 'Fiction', '978-0061120084'),
    (3, '1984', 'George Orwell', '1949-06-08', 9.99, 'Dystopian', '978-0451524935'),
    (4, 'Pride and Prejudice', 'Jane Austen', '1813-01-28', 11.99, 'Classic', '978-0679783268'),
    (5, 'The Hobbit', 'J.R.R. Tolkien', '1937-09-21', 15.99, 'Fantasy', '978-0345339683');

INSERT INTO Readers (ReaderID, FirstName, LastName, BirthDate, Email, City, RegistrationDate)
VALUES
    (1, 'John', 'Smith', '1990-03-15', 'john.smith@email.com', 'New York', '2023-01-20 09:30:00'),
    (2, 'Alice', 'Johnson', '1985-06-02', 'alice.johnson@email.com', 'Los Angeles', '2023-02-10 15:45:00'),
    (3, 'Robert', 'Davis', '1997-11-18', 'robert.davis@email.com', 'Chicago', '2023-03-05 14:20:00'),
    (4, 'Emily', 'Wilson', '1988-09-30', 'emily.wilson@email.com', 'Houston', '2023-03-15 10:10:00'),
    (5, 'Michael', 'Brown', '1992-04-25', 'michael.brown@email.com', 'Miami', '2023-04-02 11:55:00');

INSERT INTO BookLoans (LoanID, BookID, ReaderID, LoanDate, ReturnDate)
VALUES
    (1, 1, 1, '2023-04-01', '2023-04-15'),
    (2, 2, 2, '2023-03-10', '2023-04-05'),
    (3, 3, 3, '2023-02-20', '2023-03-10'),
    (4, 4, 4, '2023-01-15', '2023-02-05'),
    (5, 5, 5, '2023-03-25', '2023-04-20');