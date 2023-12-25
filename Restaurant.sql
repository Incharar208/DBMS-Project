create database Restaurant;
use Restaurant;

CREATE TABLE customers (
    c_id INT PRIMARY KEY,
    c_name VARCHAR(50),
    c_phoneno VARCHAR(15)
);

CREATE TABLE employees (
    e_id INT PRIMARY KEY,
    e_name VARCHAR(50),
    e_phoneno VARCHAR(15),
    e_address VARCHAR(100),
    e_salary INT,
    e_role VARCHAR(30)
);

CREATE TABLE menu (
    f_id INT PRIMARY KEY,
    f_name VARCHAR(50),
    f_price INT
);

CREATE TABLE dining_tables (
    t_id INT PRIMARY KEY,
    t_capacity INT,
    t_reservation ENUM('yes', 'no'), 
    e_id INT,
    FOREIGN KEY (e_id) REFERENCES employees(e_id) 
);

CREATE TABLE reservation (
    b_time TIMESTAMP,
    c_id INT,
    t_id INT,
    PRIMARY KEY (c_id, t_id),
    FOREIGN KEY (c_id) REFERENCES customers(c_id) ON DELETE CASCADE,
    FOREIGN KEY (t_id) REFERENCES dining_tables(t_id) ON DELETE CASCADE
);



CREATE TABLE orders (
    o_id INT PRIMARY KEY,
    o_time TIMESTAMP,
    e_id INT,
    c_id INT,
    FOREIGN KEY (c_id) REFERENCES customers(c_id) ON DELETE CASCADE,
    FOREIGN KEY (e_id) REFERENCES employees(e_id) ON DELETE CASCADE
);


CREATE TABLE items (
    o_id INT,
    f_id INT,
    quantity INT,
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (o_id) REFERENCES orders(o_id) ON DELETE CASCADE,
    FOREIGN KEY (f_id) REFERENCES menu(f_id) ON DELETE CASCADE
);
CREATE TABLE delivery (
    d_id INT PRIMARY KEY,
    d_option VARCHAR(20) CHECK (d_option IN ('dine-in', 'takeaway')),
    o_id INT,
    FOREIGN KEY (o_id) REFERENCES orders(o_id)
);
 CREATE TABLE bill (
    b_id INT PRIMARY KEY,
    o_id INT,
    e_id INT,
    amount INT,
    item_id INT,
    d_id INT,
    FOREIGN KEY (o_id) REFERENCES orders(o_id) ON DELETE CASCADE,
    FOREIGN KEY (e_id) REFERENCES employees(e_id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES items(item_id) ON DELETE CASCADE,
    FOREIGN KEY (d_id) REFERENCES delivery(d_id) ON DELETE CASCADE
);

 -- Insert into customers table
INSERT INTO customers (c_id, c_name, c_phoneno) VALUES
(201, 'Rahul Pandit', '9834514668'),
(202, 'Jane Smith', '9876543210'),
(203, 'Aditi Solanki', '9551234567'),
(204, 'Riya Sharma', '7893216540'),
(205, 'Ravi Kumar', '8912423863'),
(206, 'Mohammed Fasal', '6241785640'),
(207, 'Priyanka Gupta', '8451667783'),
(208, 'Raksha Nayar', '7341879354'),
(209, 'Eva Davis', '8625893390'),
(210, 'Subramanya Iyengar', '7835167889');

INSERT INTO employees (e_id, e_name, e_phoneno, e_address, e_salary, e_role) VALUES
(101, 'Shwetha S', '9562346719', 'Kuvempunagar, Mysuru', 60000, 'Manager'),
(102, 'Sangeetha B','7451846586', 'Siddhartha Nagar, Mysuru', 25000, 'Receptionist'),
(103, 'Murali K ', '8344167784', 'Hunsur, Mysuru', 20000, 'Chef'),
(104, 'Sathish S', '9845178790', 'Vijaynagar, Mysuru', 20000, 'Chef'),
(105, 'Prasad T', '9845178790', 'Jaynagar, Mysuru', 20000, 'Chef'),
(106, 'Yashraj K', '9900545789', 'Bogadi, Mysuru', 15000 ,'Waiter'),
(107, 'Mahesh U', '8561437568', 'Saraswathipuram, Mysuru', 15000, 'Waiter'),
(108, 'Prathik N', '64517485964', 'K G Koppal, Mysuru', 15000, 'Waiter'),
(109, 'Punith Y', '9872545564', 'Niveditha Nagar, Mysuru', 15000, 'Waiter'),
(110, 'Manjunath S', '7563856687', 'Sharadadevi Nagar, Mysuru', 15000, 'Waiter');
 
INSERT INTO menu (f_id, f_name, f_price) VALUES
(501, 'Tomato Soup', 120),
(502, 'Babycorn Manchurian', 180),
(503, 'Butter Roti', 35),
(504, 'Paneer Butter Masala', 200),
(505, 'Biriyani', 250),
(506, 'Margherita Pizza', 350),
(507, 'Pepperoni Pizza', 325),
(508, 'White Sauce Pasta', 240),
(509, 'Veg Noodles', 220),
(510, 'Gulab Jamoon', 60);

INSERT INTO dining_tables (t_id, t_capacity, t_reservation, e_id) VALUES
(1, 4, 'no', 107),
(2, 6, 'yes', 110),
(3, 2, 'no', 108),
(4, 8, 'yes', 109),
(5, 4, 'yes', 106),
(6, 2, 'no', 109),
(7, 6, 'yes', 107),
(8, 10, 'no', 108),
(9, 5, 'no', 110),
(10, 4, 'yes', 106);


-- Insert into reservation table
INSERT INTO reservation (b_time, c_id, t_id) VALUES
('2023-12-10 18:30:00', 201, 3),
('2023-12-10 19:00:00', 202, 2),
('2023-12-10 20:00:00', 203, 10),
('2023-12-10 18:45:00', 204, 4),
('2023-12-10 17:30:00', 205, 6),
('2023-12-11 16:30:00', 206, 1),
('2023-12-11 19:45:00', 207, 8),
('2023-12-11 19:30:00', 208, 7),
('2023-12-11 19:00:00', 209, 5),
('2023-12-11 17:15:00', 210, 9); 

-- Insert into orders table
INSERT INTO orders (o_id, o_time, e_id, c_id) VALUES
(301, '2023-12-10 18:30:00', 106, 201),
(302, '2023-12-10 19:00:00', 107, 202),
(303, '2023-12-10 20:00:00', 108, 203),
(304, '2023-12-10 18:45:00', 109, 204),
(305, '2023-12-10 17:30:00', 110, 205),
(306, '2023-12-11 16:30:00', 106, 206),
(307, '2023-12-11 19:45:00', 107, 207),
(308, '2023-12-11 19:30:00', 108, 208),
(309, '2023-12-11 19:00:00', 109, 209),
(310, '2023-12-11 17:15:00', 110, 210);

INSERT INTO items (o_id, f_id, quantity) VALUES
(301, 501, 2),
(301, 502, 1),
(301, 503, 3),
(302, 501, 1),
(302, 505, 2),
(303, 502, 6),
(303, 507, 7),
(304, 508, 1),
(305, 506, 4),
(305, 510, 4),
(306, 501, 2),
(306, 508, 1),
(306, 502, 3),
(307, 505, 1),
(308, 503, 2),
(308, 509, 2),
(309, 507, 5),
(309, 508, 1),
(310, 509, 4),
(310, 510, 3);

INSERT INTO delivery (d_id, d_option, o_id) VALUES
(401, 'dine-in', 301),
(402, 'takeaway', 302),
(403, 'dine-in', 303),
(404, 'takeaway', 303),
(405, 'dine-in', 304),
(406, 'dine-in', 305),
(407, 'dine-in', 306),
(408, 'dine-in', 307),
(409, 'takeaway', 308),
(410, 'dine-in', 309);

-- Insert into bill table
INSERT INTO bill (b_id, o_id, e_id, item_id, d_id) VALUES
(601, 301, 106, 1, 401),
(602, 302, 107, 2, 402),
(603, 303, 108, 3, 403),
(604, 304, 109, 4, 404),
(605, 305, 110, 5, 405), 
(606, 306, 106, 6, 406),
(607, 307, 107, 7, 407),
(608, 308, 108, 8, 408),
(609, 309, 109, 9, 409),
(610, 310, 110, 10, 410);







