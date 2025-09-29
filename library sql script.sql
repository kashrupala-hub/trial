--
-- File generated with SQLiteStudio v3.4.17 on Mon Sep 29 10:02:05 2025
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Authors
CREATE TABLE IF NOT EXISTS Authors (
    author_id      INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name     TEXT(50) NOT NULL,
    last_name      TEXT(50) NOT NULL
);
INSERT INTO Authors (author_id, first_name, last_name) VALUES (1, 'Gabriel', 'Garcia');
INSERT INTO Authors (author_id, first_name, last_name) VALUES (2, 'Chetan', 'Bhagat');
INSERT INTO Authors (author_id, first_name, last_name) VALUES (3, 'Amit', 'Tripathi');
INSERT INTO Authors (author_id, first_name, last_name) VALUES (4, 'Ruskin', 'Bond');
INSERT INTO Authors (author_id, first_name, last_name) VALUES (5, 'J.K.', 'Rowling');
INSERT INTO Authors (author_id, first_name, last_name) VALUES (6, 'Ernest', 'Hemingway');
INSERT INTO Authors (author_id, first_name, last_name) VALUES (7, 'Leo', 'Tolstoy');
INSERT INTO Authors (author_id, first_name, last_name) VALUES (8, 'Harper', 'Lee');
INSERT INTO Authors (author_id, first_name, last_name) VALUES (9, 'F. Scott', 'Fitzgerald');
INSERT INTO Authors (author_id, first_name, last_name) VALUES (10, 'Thomas H.', 'Cormen');
INSERT INTO Authors (author_id, first_name, last_name) VALUES (11, 'Charles E.', 'Leiserson');
INSERT INTO Authors (author_id, first_name, last_name) VALUES (12, 'Ronald L.', 'Rivest');
INSERT INTO Authors (author_id, first_name, last_name) VALUES (13, 'Clifford', 'Stein');

-- Table: BookAuthors
CREATE TABLE IF NOT EXISTS BookAuthors (
    book_id   INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);
INSERT INTO BookAuthors (book_id, author_id) VALUES (11, 10);
INSERT INTO BookAuthors (book_id, author_id) VALUES (11, 11);
INSERT INTO BookAuthors (book_id, author_id) VALUES (11, 12);
INSERT INTO BookAuthors (book_id, author_id) VALUES (11, 13);
INSERT INTO BookAuthors (book_id, author_id) VALUES (6, 1);
INSERT INTO BookAuthors (book_id, author_id) VALUES (7, 2);
INSERT INTO BookAuthors (book_id, author_id) VALUES (8, 3);
INSERT INTO BookAuthors (book_id, author_id) VALUES (9, 4);
INSERT INTO BookAuthors (book_id, author_id) VALUES (10, 5);
INSERT INTO BookAuthors (book_id, author_id) VALUES (1, 6);
INSERT INTO BookAuthors (book_id, author_id) VALUES (5, 7);

-- Table: BookCopies
CREATE TABLE IF NOT EXISTS BookCopies (copy_id INTEGER PRIMARY KEY AUTOINCREMENT, book_id INTEGER NOT NULL REFERENCES Books (book_id) ON UPDATE CASCADE, acquisition_date NUMBER, status TEXT (20) DEFAULT 'Available' CHECK (status IN ('available', 'issued', 'lost', 'damaged')), FOREIGN KEY (book_id) REFERENCES Books (book_id));
INSERT INTO BookCopies (copy_id, book_id, acquisition_date, status) VALUES (1, 1, 20220115, 'available');
INSERT INTO BookCopies (copy_id, book_id, acquisition_date, status) VALUES (2, 1, 20220310, 'issued');
INSERT INTO BookCopies (copy_id, book_id, acquisition_date, status) VALUES (3, 5, 20220405, 'damaged');
INSERT INTO BookCopies (copy_id, book_id, acquisition_date, status) VALUES (4, 6, 20220120, 'available');
INSERT INTO BookCopies (copy_id, book_id, acquisition_date, status) VALUES (5, 6, 20220225, 'available');
INSERT INTO BookCopies (copy_id, book_id, acquisition_date, status) VALUES (6, 7, 20220301, 'lost');
INSERT INTO BookCopies (copy_id, book_id, acquisition_date, status) VALUES (7, 8, 20220305, 'available');
INSERT INTO BookCopies (copy_id, book_id, acquisition_date, status) VALUES (8, 9, 20220110, 'available');
INSERT INTO BookCopies (copy_id, book_id, acquisition_date, status) VALUES (9, 9, 20220112, 'issued');
INSERT INTO BookCopies (copy_id, book_id, acquisition_date, status) VALUES (10, 10, 20220201, 'available');
INSERT INTO BookCopies (copy_id, book_id, acquisition_date, status) VALUES (11, 11, 20220401, 'available');
INSERT INTO BookCopies (copy_id, book_id, acquisition_date, status) VALUES (12, 11, 20220515, 'available');
INSERT INTO BookCopies (copy_id, book_id, acquisition_date, status) VALUES (13, 11, 20220520, 'issued');

-- Table: Books
CREATE TABLE IF NOT EXISTS Books (book_id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT (200) NOT NULL, isbn TEXT (20) UNIQUE, publisher TEXT (100), published_year INTEGER, category_id INTEGER, price REAL, FOREIGN KEY (category_id) REFERENCES Categories (category_id));
INSERT INTO Books (book_id, title, isbn, publisher, published_year, category_id, price) VALUES (1, 'The Alchemist', '9780061122415', 'HarperCollins', 1993, 1, 500.0);
INSERT INTO Books (book_id, title, isbn, publisher, published_year, category_id, price) VALUES (5, 'Mrs Dalloway', '9780156628709', 'Hogarth Press', 1925, 5, 640.0);
INSERT INTO Books (book_id, title, isbn, publisher, published_year, category_id, price) VALUES (6, 'One Hundred Years of Solitude', '9780060883287', 'Harper & Row', 1967, 5, 720.0);
INSERT INTO Books (book_id, title, isbn, publisher, published_year, category_id, price) VALUES (7, 'Five Point Someone', '9788129104595', 'Rupa Publications', 2004, 1, 1200.0);
INSERT INTO Books (book_id, title, isbn, publisher, published_year, category_id, price) VALUES (8, 'The Immortals of Meluha', '9789380658742', 'Westland Press', 2010, 4, 1100.0);
INSERT INTO Books (book_id, title, isbn, publisher, published_year, category_id, price) VALUES (9, 'The Room on the Roof', '9780143333387', 'Andre Deutsch', 1956, 5, 890.0);
INSERT INTO Books (book_id, title, isbn, publisher, published_year, category_id, price) VALUES (10, 'Harry Potter and the Philosopher''s Stone', '9780747532699', 'Bloomsbury', 1997, 4, 450.0);
INSERT INTO Books (book_id, title, isbn, publisher, published_year, category_id, price) VALUES (11, 'Introduction to Algorithms', '9780262033848', 'MIT Press', 2009, 2, 300.0);

-- Table: Categories
CREATE TABLE IF NOT EXISTS Categories (
    category_id    INTEGER PRIMARY KEY AUTOINCREMENT,
    category_name  TEXT(100) NOT NULL UNIQUE);
INSERT INTO Categories (category_id, category_name) VALUES (1, ' non fiction');
INSERT INTO Categories (category_id, category_name) VALUES (2, 'fiction');
INSERT INTO Categories (category_id, category_name) VALUES (3, 'Science & Technology');
INSERT INTO Categories (category_id, category_name) VALUES (4, 'History & Culture');
INSERT INTO Categories (category_id, category_name) VALUES (5, 'classic');

-- Table: Fines
CREATE TABLE IF NOT EXISTS Fines (fine_id INTEGER PRIMARY KEY, loan_id INTEGER NOT NULL UNIQUE, fine_amount REAL NOT NULL, paid_status TEXT (20) CHECK (paid_status IN ('Paid', 'Unpaid')), FOREIGN KEY (loan_id) REFERENCES Loans (loan_id));
INSERT INTO Fines (fine_id, loan_id, fine_amount, paid_status) VALUES (1, 3, 50.0, 'Unpaid');
INSERT INTO Fines (fine_id, loan_id, fine_amount, paid_status) VALUES (2, 6, 70.0, 'Paid');
INSERT INTO Fines (fine_id, loan_id, fine_amount, paid_status) VALUES (3, 1, 80.0, 'Paid');
INSERT INTO Fines (fine_id, loan_id, fine_amount, paid_status) VALUES (4, 5, 65.0, 'Paid');
INSERT INTO Fines (fine_id, loan_id, fine_amount, paid_status) VALUES (5, 2, 100.0, 'Unpaid');

-- Table: Loans
CREATE TABLE IF NOT EXISTS Loans (loan_id INTEGER PRIMARY KEY, member_id INTEGER NOT NULL, copy_id INTEGER NOT NULL, issue_date NUMBER NOT NULL, due_date NUMBER NOT NULL, return_date NUMBER, status TEXT (20) CHECK (status IN ('Issued', 'Returned', 'Overdue')), FOREIGN KEY (member_id) REFERENCES Members (member_id), FOREIGN KEY (copy_id) REFERENCES BookCopies (copy_id));
INSERT INTO Loans (loan_id, member_id, copy_id, issue_date, due_date, return_date, status) VALUES (1, 1, 2, 20250901, 20250915, 20250914, 'Returned');
INSERT INTO Loans (loan_id, member_id, copy_id, issue_date, due_date, return_date, status) VALUES (2, 2, 5, 20250910, 20250924, NULL, 'Issued');
INSERT INTO Loans (loan_id, member_id, copy_id, issue_date, due_date, return_date, status) VALUES (3, 3, 6, 20250405, 20250319, 20250921, 'Overdue');
INSERT INTO Loans (loan_id, member_id, copy_id, issue_date, due_date, return_date, status) VALUES (4, 1, 8, 20250912, 20250926, NULL, 'Issued');
INSERT INTO Loans (loan_id, member_id, copy_id, issue_date, due_date, return_date, status) VALUES (5, 4, 1, 20250901, 20250915, 20250915, 'Returned');
INSERT INTO Loans (loan_id, member_id, copy_id, issue_date, due_date, return_date, status) VALUES (6, 5, 3, 20250307, 20250421, NULL, 'Overdue');

-- Table: Members
CREATE TABLE IF NOT EXISTS Members (member_id INTEGER PRIMARY KEY, first_name TEXT (50) NOT NULL, last_name TEXT (50) NOT NULL, email TEXT (100) UNIQUE, phone TEXT (20), address TEXT, membership_date NUMERIC NOT NULL, status TEXT (20) CHECK (status IN ('active', 'expired', 'suspended')), membership_type text check (membership_type in('student','staff','basic','premium')), membership_fee REAL);
INSERT INTO Members (member_id, first_name, last_name, email, phone, address, membership_date, status, membership_type, membership_fee) VALUES (1, 'Kashmeeraben', 'Rupala', 'kashmeeraben@example.com', '9876543210', 'Ahmedabad, Gujarat', '2025-09-23', 'active', 'staff', 0.0);
INSERT INTO Members (member_id, first_name, last_name, email, phone, address, membership_date, status, membership_type, membership_fee) VALUES (2, 'Amit', 'Shah', 'amit.shah@example.com', '9123456780', 'Rajkot, Gujarat', '2025-08-15', 'active', 'basic', 1500.0);
INSERT INTO Members (member_id, first_name, last_name, email, phone, address, membership_date, status, membership_type, membership_fee) VALUES (3, 'Neha', 'Patel', 'neha.patel@example.com', '9988776655', 'Puna, Maharastra', '2024-12-10', 'expired', 'staff', 0.0);
INSERT INTO Members (member_id, first_name, last_name, email, phone, address, membership_date, status, membership_type, membership_fee) VALUES (4, 'Ravi', 'Mehta', 'ravi.mehta@example.com', '9876501234', 'Rajkot, Gujarat', '2025-01-20', 'active', 'premium', 2500.0);
INSERT INTO Members (member_id, first_name, last_name, email, phone, address, membership_date, status, membership_type, membership_fee) VALUES (5, 'Sonal', 'Kapadia', 'sonal.kapadia@example.com', '9876123456', 'Gandhinagar, Gujarat', '2025-09-01', 'active', 'student', 1000.0);
INSERT INTO Members (member_id, first_name, last_name, email, phone, address, membership_date, status, membership_type, membership_fee) VALUES (6, 'Neha', 'kalaria', 'neha@google.com', '2345684', 'Bombay,Maharastra', '2025-09-23', 'suspended', 'student', 1000.0);
INSERT INTO Members (member_id, first_name, last_name, email, phone, address, membership_date, status, membership_type, membership_fee) VALUES (7, 'Neha', 'bhupatani', 'neha@example.com', NULL, 'Ahmedabad', '2025-09-23', 'suspended', 'student', 1000.0);

-- Table: Staff
CREATE TABLE IF NOT EXISTS Staff (staff_id INTEGER PRIMARY KEY AUTOINCREMENT, first_name TEXT (50) NOT NULL, last_name TEXT (50) NOT NULL, role TEXT (30) CHECK (role IN ('Librarian', 'Assistant', 'Admin')), email TEXT (100) UNIQUE, phone TEXT (20), hire_date NUMERIC, salary REAL);
INSERT INTO Staff (staff_id, first_name, last_name, role, email, phone, hire_date, salary) VALUES (1, 'Priya', 'Desai', 'Librarian', 'priya.desai@library.com', '9876543211', '2024-03-12', 20000.0);
INSERT INTO Staff (staff_id, first_name, last_name, role, email, phone, hire_date, salary) VALUES (2, 'Rohit', 'Sharma', 'Assistant', 'rohit.sharma@library.com', '9123456789', '2025-04-10', 10000.0);
INSERT INTO Staff (staff_id, first_name, last_name, role, email, phone, hire_date, salary) VALUES (3, 'Neha', 'Joshi', 'Admin', 'neha.joshi@library.com', '9988776650', '2022-01-01', 30000.0);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;