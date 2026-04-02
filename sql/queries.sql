-- 1. Insertar la cabecera de la orden
INSERT INTO orders (customer_id, order_date, total) 
VALUES (1, CURRENT_TIMESTAMP, 0); -- El total se actualizará al final

-- 2. Insertar el detalle del producto (ID 3, cantidad 2, precio 500)
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES (currval('orders_id_seq'), 3, 2, 500.00);

-- 3. Descontar stock del producto vendido
UPDATE products 
SET stock = stock - 2 
WHERE id = 3;

-- 4. Recalcular el total de la orden
UPDATE orders 
SET total = (SELECT SUM(quantity * unit_price) FROM order_items WHERE order_id = currval('orders_id_seq'))
WHERE id = currval('orders_id_seq');


-- Query's

SELECT * FROM products WHERE name ILIKE '%Laptop%';

SELECT * FROM products WHERE category_id = 1;

SELECT * FROM products WHERE price BETWEEN 100 AND 500;

SELECT * FROM products WHERE stock > 0;

SELECT * FROM categories ORDER BY name ASC;

SELECT AVG(total) FROM orders;

SELECT p.name, SUM(oi.quantity * oi.unit_price) AS total FROM products p JOIN order_items oi ON p.id = oi.product_id GROUP BY p.name ORDER BY total DESC LIMIT 5;

SELECT TO_CHAR(order_date, 'YYYY-MM') AS mes, SUM(total) FROM orders GROUP BY mes;

SELECT customer_id, COUNT(*) FROM orders GROUP BY customer_id;

SELECT c.name, SUM(oi.quantity * oi.unit_price) FROM categories c JOIN products p ON c.id = p.category_id JOIN order_items oi ON p.id = oi.product_id GROUP BY c.name;

ELECT customer_id FROM orders GROUP BY customer_id HAVING COUNT(*) >= 3;

SELECT name, stock FROM products WHERE stock < 5;

SELECT name FROM products WHERE id NOT IN (SELECT product_id FROM order_items);

SELECT * FROM orders ORDER BY order_date DESC LIMIT 10;

SELECT * FROM customers WHERE created_at >= date_trunc('month', CURRENT_DATE);

SELECT o.id, c.name, p.name, oi.quantity FROM orders o JOIN customers c ON o.customer_id = c.id JOIN order_items oi ON o.id = oi.order_id JOIN products p ON oi.product_id = p.id WHERE o.id = 1;

SELECT c.name, AVG(p.price) FROM categories c JOIN products p ON c.id = p.category_id GROUP BY c.name;

SELECT c.name, MAX(p.price) FROM categories c JOIN products p ON c.id = p.category_id GROUP BY c.name;

SELECT DISTINCT order_id FROM order_items WHERE product_id = 10;

SELECT c.name, COALESCE(SUM(o.total), 0) FROM customers c LEFT JOIN orders o ON c.id = o.customer_id GROUP BY c.name;

SELECT EXTRACT(DOW FROM order_date) AS dia, COUNT(*) FROM orders GROUP BY dia ORDER BY COUNT(*) DESC LIMIT 1;

SELECT c.name, COUNT(p.id) FROM categories c LEFT JOIN products p ON c.id = p.category_id GROUP BY c.name;

SELECT * FROM orders WHERE order_date >= '2026-01-01' AND order_date <= '2026-03-31';

SELECT AVG(item_count) FROM (SELECT COUNT(*) AS item_count FROM order_items GROUP BY order_id) AS sub;

SELECT SUM(stock * price) FROM products;