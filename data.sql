-- data.sql
-- This file inserts sample data into the bookstore database.

USE bookstore;

-- Insert authors
INSERT INTO authors (name, bio)
VALUES
('George R. R. Martin', 'Author of the "A Song of Ice and Fire" series'),
('J.K. Rowling', 'Author of the "Harry Potter" series'),
('J.R.R. Tolkien', 'Author of "The Lord of the Rings"'),
('Harper Lee', 'Author of "To Kill a Mockingbird"');

-- Insert books
INSERT INTO books (author_id, title, published_date, price, stock)
VALUES
(1, 'A Game of Thrones', '1996-08-06', 9.99, 10),
(1, 'A Clash of Kings', '1998-11-16', 11.99, 5),
(2, 'Harry Potter and the Philosopher''s Stone', '1997-06-26', 7.99, 15),
(2, 'Harry Potter and the Chamber of Secrets', '1998-07-02', 8.99, 12),
(3, 'The Fellowship of the Ring', '1954-07-29', 10.50, 7),
(3, 'The Two Towers', '1954-11-11', 10.50, 8),
(4, 'To Kill a Mockingbird', '1960-07-11', 6.99, 20);

-- Insert orders
INSERT INTO orders (customer_name, order_date)
VALUES
('Alice Johnson', '2023-09-01'),
('Bob Smith', '2023-09-02'),
('Charlie Brown', '2023-09-03');

-- Insert order items
INSERT INTO order_items (order_id, book_id, quantity)
VALUES
(1, 1, 2),  -- Alice orders 2 copies of 'A Game of Thrones'
(1, 3, 1),  -- Alice also orders 1 copy of 'Harry Potter and the Philosopher's Stone'
(2, 4, 2),  -- Bob orders 2 copies of 'Harry Potter and the Chamber of Secrets'
(2, 7, 1),  -- Bob also orders 1 copy of 'To Kill a Mockingbird'
(3, 5, 1),  -- Charlie orders 1 copy of 'The Fellowship of the Ring'
(3, 6, 1);  -- Charlie also orders 1 copy of 'The Two Towers'
