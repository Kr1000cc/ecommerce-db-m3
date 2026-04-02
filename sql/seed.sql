-- 1. Insertar Categorías
INSERT INTO categories (name) VALUES 
('Electrónica'), 
('Hogar y Muebles'), 
('Deportes'), 
('Libros'), 
('Computación');

-- 2. Insertar Clientes 
INSERT INTO customers (name, email) VALUES 
('Carlos Alburquenque', 'carlos.a@mail.cl'),
('Ana María Rojas', 'ana.rojas@puc.cl'),
('Juan Pérez', 'juan.p@gmail.com'),
('María Ignacia', 'm.ignacia@outlook.com'),
('Diego Troncoso', 'd.troncoso@constructora.cl'),
('Sofía Valenzuela', 'sofia.v@uach.cl'),
('Lucas Martínez', 'l.martinez@gmail.com'),
('Valentina Paz', 'v.paz@temuco.cl'),
('Roberto Soto', 'r.soto@empresa.com'),
('Elena Retamal', 'e.retamal@gmail.com');

-- 3. Insertar Productos
INSERT INTO products (category_id, name, price, stock) VALUES 
(5, 'Laptop Gaming Pro', 1200.00, 15),
(5, 'Mouse Inalámbrico', 25.00, 50),
(1, 'Smartphone X10', 850.00, 10),
(1, 'Audífonos Bluetooth', 60.00, 5), 
(2, 'Escritorio Madera', 150.00, 8),
(2, 'Silla Ergonómica', 200.00, 12),
(3, 'Mancuernas 10kg', 45.00, 20),
(3, 'Mat de Yoga', 15.00, 30),
(4, 'Clean Code - Robert C. Martin', 35.00, 25),
(4, 'Patrones de Diseño', 40.00, 18),
(1, 'Monitor 4K 27"', 350.00, 4), 
(5, 'Teclado Mecánico Sofle', 180.00, 0), 
(5, 'Cámara Web 1080p', 55.00, 22),
(2, 'Lámpara de Escritorio', 30.00, 40),
(3, 'Bicicleta Estática', 500.00, 3);

-- 4. Insertar Órdenes
INSERT INTO orders (customer_id, order_date, total) VALUES 
(1, '2026-01-15 10:30:00', 1225.00),
(2, '2026-01-20 15:45:00', 60.00),
(3, '2026-02-05 09:00:00', 350.00),
(1, '2026-02-12 18:20:00', 40.00),
(5, '2026-03-01 11:10:00', 500.00),
(1, '2026-03-10 14:00:00', 850.00),
(8, '2026-03-15 20:00:00', 150.00),
(4, '2026-03-25 12:00:00', 25.00),
(10, '2026-03-28 16:30:00', 35.00);

-- 5. Insertar Ítems de las Órdenes
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
(1, 1, 1, 1200.00),
(1, 2, 1, 25.00),
(2, 4, 1, 60.00),
(3, 11, 1, 350.00),
(4, 10, 1, 40.00),
(5, 15, 1, 500.00),
(6, 3, 1, 850.00),
(7, 5, 1, 150.00),
(8, 2, 1, 25.00),
(9, 9, 1, 35.00);