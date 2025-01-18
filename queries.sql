-- queries.sql
-- Example queries to showcase different SQL operations.

USE bookstore;

-- 1. Retrieve all books along with the author name
SELECT 
    b.book_id,
    b.title,
    a.name AS author_name,
    b.price,
    b.stock
FROM books b
JOIN authors a ON b.author_id = a.author_id
ORDER BY b.book_id;

-- 2. Find the total number of orders placed
SELECT COUNT(*) AS total_orders
FROM orders;

-- 3. Get the total quantity of each book sold (join orders -> order_items -> books)
SELECT 
    b.title,
    SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN books b ON oi.book_id = b.book_id
GROUP BY b.title
ORDER BY total_sold DESC;

-- 4. List all orders with the total price (assuming no discounts/taxes)
--    For each order, we sum (book price * quantity).
SELECT 
    o.order_id,
    o.customer_name,
    o.order_date,
    SUM(b.price * oi.quantity) AS order_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN books b ON oi.book_id = b.book_id
GROUP BY o.order_id, o.customer_name, o.order_date
ORDER BY o.order_id;

-- 5. Find authors who have more than one book in stock
SELECT 
    a.name,
    COUNT(b.book_id) AS books_in_stock
FROM books b
JOIN authors a ON b.author_id = a.author_id
WHERE b.stock > 0
GROUP BY a.name
HAVING COUNT(b.book_id) > 1;

-- 6. Display the average book price for each author
SELECT 
    a.name,
    AVG(b.price) AS average_price
FROM authors a
JOIN books b ON a.author_id = b.author_id
GROUP BY a.name;
