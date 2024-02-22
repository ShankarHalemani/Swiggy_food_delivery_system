DROP DATABASE IF EXISTS SWIGGY;
CREATE DATABASE SWIGGY;
USE SWIGGY;

-- Table names and their attributes are considered in lower case even if they are written in upper case

DROP TABLE IF EXISTS MENU;
DROP TABLE IF EXISTS ORDER_DETAILS;
DROP TABLE IF EXISTS ORDERS;
DROP TABLE IF EXISTS DELIVARY_PARTNER;
DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS RESTAURANT;
DROP TABLE IF EXISTS FOOD;


CREATE TABLE USERS (
user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
user_name VARCHAR(50),
email_id VARCHAR(200),
user_password VARCHAR(50)
);

CREATE TABLE RESTAURANT (
r_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
r_name VARCHAR(50),
cuisine VARCHAR(50)
);

CREATE TABLE DELIVARY_PARTNER(
partner_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
partner_name VARCHAR(50)
);

CREATE TABLE FOOD(
f_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
f_name VARCHAR(50),
type_f VARCHAR(50)
);

CREATE TABLE ORDERS (
order_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
user_id INT,
r_id INT,
amount INT,
date_ordered DATE,
partner_id INT,
delivary_time INT,
delivary_rating INT,
restaurant_rating INT,
FOREIGN KEY(user_id) REFERENCES USERS(user_id) ON DELETE CASCADE,
FOREIGN KEY(r_id) REFERENCES RESTAURANT(r_id) ON DELETE CASCADE,
FOREIGN KEY(partner_id) REFERENCES DELIVARY_PARTNER(partner_id) ON DELETE CASCADE
);

CREATE TABLE ORDER_DETAILS(
order_det_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
order_id INT,
f_id INT,
FOREIGN KEY(order_id) REFERENCES ORDERS(order_id) ON DELETE CASCADE,
FOREIGN KEY(f_id) REFERENCES FOOD(f_id) ON DELETE CASCADE
);

CREATE TABLE MENU(
menu_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
r_id INT,
f_id INT,
price INT,
FOREIGN KEY(r_id) REFERENCES RESTAURANT(r_id) ON DELETE CASCADE,
FOREIGN KEY(f_id) REFERENCES FOOD(f_id) ON DELETE CASCADE
);

INSERT INTO USERS
(user_id, user_name, email_id, user_password) VALUES
(1	, "Nitish",	"nitish@gmail.com",	"p252h"),
(2	, "Khushboo", "khushboo@gmail.com",	"hxn9b"),
(3,	"Vartika",	"vartika@gmail.com",	"9hu7j"),
(4,	"Ankit",	"ankit@gmail.com",	"lkko3"),
(5,	"Neha",	"neha@gmail.com",	"3i7qm"),
(6,	"Anupama",	"anupama@gmail.com",	"46rdw2"),
(7,	"Rishabh",	"rishabh@gmail.com",	"4sw123");

-- SELECT group_concat(user_name) FROM USERS; 

INSERT INTO RESTAURANT
(r_id, r_name, cuisine) VALUES
(1,	"dominos",	"Italian"),
(2,	"kfc",	"American"),
(3,	"box8",	"North Indian"),
(4,	"Dosa Plaza",	"South Indian"),
(5,	"China Town",	"Chinese");

INSERT INTO DELIVARY_PARTNER
(partner_id, partner_name) VALUES
(1,	"Suresh"),
(2,	"Amit"),
(3,	"Lokesh"),
(4,	"Kartik"),
(5,	"Gyandeep");

INSERT INTO FOOD
(f_id, f_name, type_f) VALUES
(1,	"Non-veg Pizza",	"Non-veg"),
(2, "Veg Pizza",	"Veg"),
(3,	"Choco Lava cake",	"Veg"),
(4,	"Chicken Wings",	"Non-veg"),
(5,	"Chicken Popcorn",	"Non-veg"),
(6,	"Rice Meal",	"Veg"),
(7,	"Roti meal",	"Veg"),
(8,	'Masala Dosa',	'Veg'),
(9,	'Rava Idli',	'Veg'),
(10,	'Schezwan Noodles',	'Veg'),
(11,	"Veg Manchurian",	'Veg');

INSERT INTO ORDERS
(order_id, user_id, r_id, amount, date_ordered, partner_id, delivary_time, delivary_rating, restaurant_rating) VALUES
(1001,	1,	1,	550,	'2022-05-10',	1,	25,	5,	3),
(1002,	1,	2,	415,	'2022-05-26',	1,	19,	5,	2),
(1003,	1,	3,	240,	'2022-06-15',	5,	29,	4, NULL),	
(1004,	1,	3,	240,	'2022-06-29',	4,	42,	3,	5),
(1005,	1,	3,	220,	'2022-07-10',	1,	58,	1,	4),
(1006,	2,	1,	950,	'2022-06-10',	2,	16,	5, NULL),	
(1007,	2,	2,	530,	'2022-06-23',	3,	60,	1,	5),
(1008,	2,	3,	240,	'2022-07-07',	5,	33,	4,	5),
(1009,	2,	4,	300,	'2022-07-17',	4,	41,	1, NULL),	
(1010,	2,	5,	650,	'2022-07-31',	1,	67,	1,	4),
(1011,	3,	1,	450,	'2022-05-10',	2,	25,	3,	1),
(1012, 3, 4, 180, '2022-05-20', 5, 33, 4, 1),
(1013, 3, 2, 230, '2022-05-30', 4, 45, 3, NULL),
(1014, 3, 2, 230, '2022-06-11', 2, 55, 1, 2),
(1015, 3, 2, 230, '2022-06-22', 3, 21, 5, NULL),
(1016, 4, 4, 300, '2022-05-15', 3, 31, 5, 5),
(1017, 4, 4, 300, '2022-05-30', 1, 50, 1, NULL),
(1018, 4, 4, 400, '2022-06-15', 2, 40, 3, 5),
(1019, 4, 5, 400, '2022-06-30', 1, 70, 2, 4),
(1020, 4, 5, 400, '2022-07-15', 3, 26, 5, 3),
(1021, 5, 1, 550, '2022-07-01', 5, 22, 2, NULL),
(1022, 5, 1, 550, '2022-07-08', 1, 34, 5, 1),
(1023, 5, 2, 645, '2022-07-15', 4, 38, 5, 1),
(1024, 5, 2, 645, '2022-07-21', 2, 58, 2, 1),
(1025, 5, 2, 645, '2022-07-28', 2, 44, 4, NULL);

-- SELECT COUNT(DISTINCT restaurant_rating) FROM ORDERS;
SELECT DISTINCT restaurant_rating FROM ORDERS;

INSERT INTO ORDER_DETAILS
(order_det_id, order_id, f_id) VALUES
(1, 1001, 1),
(2, 1001, 3),
(3, 1002, 4),
(4, 1002, 3),
(5, 1003, 6),
(6, 1003, 3),
(7, 1004, 6),
(8, 1004, 3),
(9, 1005, 7),
(10, 1005, 3),
(11, 1006, 1),
(12, 1006, 2),
(13, 1006, 3),
(14, 1007, 4),
(15, 1007, 3),
(16, 1008, 6),
(17, 1008, 3),
(18, 1009, 8),
(19, 1009, 9),
(20, 1010, 10),
(21, 1010, 11),
(22, 1010, 6),
(23, 1011, 1),
(24, 1012, 8),
(25, 1013, 4),
(26, 1014, 4),
(27, 1015, 4),
(28, 1016, 8),
(29, 1016, 9),
(30, 1017, 8),
(31, 1017, 9),
(32, 1018, 10),
(33, 1018, 11),
(34, 1019, 10),
(35, 1019, 11),
(36, 1020, 10),
(37, 1020, 11),
(38, 1021, 1),
(39, 1021, 3),
(40, 1022, 1),
(41, 1022, 3),
(42, 1023, 3),
(43, 1023, 4),
(44, 1023, 5),
(45, 1024, 3),
(46, 1024, 4),
(47, 1024, 5),
(48, 1025, 3),
(49, 1025, 4),
(50, 1025, 5);

INSERT INTO MENU
(menu_id, r_id, f_id, price) VALUES
(1, 1, 1, 450),
(2, 1, 2, 400),
(3, 1, 3, 100),
(4, 2, 3, 115),
(5, 2, 4, 230),
(6, 2, 5, 300),
(7, 3, 3, 80),
(8, 3, 6, 160),
(9, 3, 7, 140),
(10, 4, 6, 230),
(11, 4, 8, 180),
(12, 4, 9, 120),
(13, 5, 6, 250),
(14, 5, 10, 220),
(15, 5, 11, 180);


SELECT * FROM USERS;
SELECT * FROM RESTAURANT;
SELECT * FROM ORDERS;
SELECT * FROM FOOD;


-- 1) Find the customers who have never ordered 
SELECT user_name FROM users WHERE user_id NOT IN (SELECT user_id FROM orders);

-- 2) Find the average price of every food item (consider same food item is present in two restaurant u hav to consider price from both restaurants and find avg)
SELECT food.f_name, food.type_f, AVG(price) AS 'Avg Price'
FROM menu JOIN food
ON menu.f_id=food.f_id
GROUP BY menu.f_id
ORDER BY AVG(price);  -- if they asked to sort fod items from low price to high price

-- 3) Find top restaurant in terms of number of orders in a given month
SELECT r.r_name, COUNT(*) AS 'Number of Orders per month'
FROM orders o 
JOIN restaurant r
ON o.r_id = r.r_id
WHERE MONTHNAME(o.date_ordered) LIKE 'May' 
GROUP BY o.r_id
ORDER BY COUNT(*) DESC LIMIT 1;

-- 4) Display all the restaurants whose monthly revenue is greater than X (X can any number 0, 1, 2, 3 .....N)
SELECT r.r_name, SUM(o.amount) AS 'Revenue'
FROM orders o
JOIN restaurant r
ON o.r_id=r.r_id
WHERE MONTHNAME(o.date_ordered) LIKE 'June'
GROUP BY o.r_id
HAVING Revenue > 500;

-- 5) Generate montlhy revenue for a particular restaurant
SELECT r.r_name, MONTHNAME(o.date_ordered), SUM(o.amount) AS 'Revenue'
FROM orders o
JOIN restaurant r
ON o.r_id=r.r_id
WHERE o.r_id=1
GROUP BY MONTHNAME(o.date_ordered);

-- 6) Show all the orders with order details for a particular customer in a particular date range





