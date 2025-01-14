-- Criar a base de dados
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Tabela: Authors
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

-- Tabela: Books
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT,
    publication_year YEAR,
    genre VARCHAR(50),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Tabela: Users
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    registered_date DATE NOT NULL
);

-- Tabela: BorrowedBooks
CREATE TABLE BorrowedBooks (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Inserir dados em Authors
INSERT INTO Authors (name, country) VALUES
('J.K. Rowling', 'United Kingdom'),
('George R.R. Martin', 'United States'),
('J.R.R. Tolkien', 'United Kingdom');

-- Inserir dados em Books
INSERT INTO Books (title, author_id, publication_year, genre) VALUES
('Harry Potter and the Sorcerer\'s Stone', 1, 1997, 'Fantasy'),
('A Game of Thrones', 2, 1996, 'Fantasy'),
('The Lord of the Rings', 3, 1954, 'Fantasy');

-- Inserir dados em Users
INSERT INTO Users (name, email, registered_date) VALUES
('Alice Johnson', 'alice@example.com', '2025-01-01'),
('Bob Smith', 'bob@example.com', '2025-01-02');

-- Inserir dados em BorrowedBooks
INSERT INTO BorrowedBooks (book_id, user_id, borrow_date, return_date) VALUES
(1, 1, '2025-01-05', NULL),
(2, 2, '2025-01-06', '2025-01-10');
