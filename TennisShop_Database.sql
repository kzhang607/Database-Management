CREATE DATABASE tennis;
USE tennis;

#----------------------------------------------------------------
#CREATING TABLES & RELATIONSHIPS
CREATE TABLE customer(
customer_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(45),
last_name VARCHAR(45),
address VARCHAR(45), 
phone_number VARCHAR(45),
email VARCHAR(45)
);

CREATE TABLE product(
product_id INT AUTO_INCREMENT PRIMARY KEY, 
type_of_product VARCHAR(45),
brand VARCHAR(45),
name_of_product VARCHAR(45),
price DOUBLE,
availability VARCHAR(45) 
);

CREATE TABLE feedback(
feedback_id INT AUTO_INCREMENT PRIMARY KEY,
score INT, 
comments VARCHAR(200),
date DATE,
fk_customer_id INT
);

ALTER TABLE feedback ADD FOREIGN KEY(fk_customer_id) REFERENCES customer(customer_id);

CREATE TABLE orders(
orders_id INT AUTO_INCREMENT PRIMARY KEY,
quantity INT,
total_price DOUBLE,
address VARCHAR(45),
payment_method VARCHAR(45),
date DATE,
fk_customer_id INT
);

ALTER TABLE orders ADD FOREIGN KEY(fk_customer_id) REFERENCES customer(customer_id);

CREATE TABLE employee(
employee_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(45),
last_name VARCHAR(45),
position VARCHAR(45),
email VARCHAR(45),
salary INT
);

CREATE TABLE orders_employee_junction(
orders_employee_junction_id INT AUTO_INCREMENT PRIMARY KEY,
fk_orders_id INT,
fk_employee_id INT
);

ALTER TABLE orders_employee_junction ADD FOREIGN KEY(fk_orders_id) REFERENCES orders(orders_id);
ALTER TABLE orders_employee_junction ADD FOREIGN KEY(fk_employee_id) REFERENCES employee(employee_id);

CREATE TABLE feedback_product_junction(
feedback_product_junction_id INT AUTO_INCREMENT PRIMARY KEY,
fk_feedback_id INT, 
fk_product_id INT
);

ALTER TABLE feedback_product_junction ADD FOREIGN KEY(fk_feedback_id) REFERENCES feedback(feedback_id);
ALTER TABLE feedback_product_junction ADD FOREIGN KEY(fk_product_id) REFERENCES product(product_id);

#---------------------------------------------------------------------------------------------------
#ADDING ROWS OF DATA
INSERT INTO customer(first_name, last_name, address, phone_number, email)
VALUES
('Jack', 'Smith', '1578 Windsor Street', '451-976-9382', 'jackysmitty@yahoo.com'),
('Matilda', 'Yun', '1329 Glen Circle', '329-842-1749', 'mattyyun@gmail.com'),
('Herbert', 'Tad', '1399 Maple Drive', '332-421-8539', 'tadpole@yahoo.com'),
('George', 'Jefferson', '2345 Fort Drive', '879-920-4428', 'gjefferson222@gmail.com'),
('James', 'Hill', '882 Town Drive', '822-910-2872', 'jhill88@gmail.com'),
('Jimmy', 'Turner', '121 Ship Road', '215-882-9991', 'jturner102@gmail.com'),
('JJ', 'Rola', '8732 Upper Street', '754-129-5372', 'jjrola212@gmail.com'),
('Patrick', 'Hopkins', '744 Dublin Circle', '321-876-9191', 'phops872@gmail.com'),
('Dwight', 'Thielen', '322 Lower Drive', '125-427-8909', 'dthielen124@gmail.com'),
('Paul', 'Brady', '399 Moreland Avenue', '563-234-4428', 'pbrady445@gmail.com');

INSERT INTO employee(first_name, last_name, position, email, salary)
VALUES
('Josh', 'Smith','Cashier', 'smittyjosh@gmail.com', 50000),
('Kait', 'Ford', 'Manager', 'kaitford@hotmail.com', 90000),
('Lauren', 'Huh', 'Cashier', 'pittypitt@yahoo.com', 45000),
('Isaiah', 'Thompson', 'Janitor', 'itthomp@gmail.com', 40000),
('Matthew', 'Park', 'Inventory Control Specialist', 'mattpark12@yahoo.com', 80000),
('Cameron', 'Roddick', 'Assistant Manager', 'camroddick321@gmail.com', 80000),
('Mark', 'Lee', 'Stringer', 'marklee445@yahoo.com', 30000),
('Kyle', 'Ball', 'Customer Service Representative', 'kyletheballer123@yahoo.com', 60000),
('Luke', 'Castelle', 'Sales Associate', 'lukecast385@yahoo.com', 70000),
('John', 'Evans', 'Display Assistant', 'jevans345@yahoo.com', 40000);

INSERT INTO product(type_of_product, brand, name_of_product, price, availability)
VALUES
('Racquet', 'Babolat', 'Babolat Pure Strike', 199.99, 'Available'),
('Bag', 'Wilson', 'Wilson Tennis Bag', 39.99, 'Available'),
('Racquet', 'Head', 'Head Speed MP', 229.95, 'Available'),
('Shoes', 'Nike', 'Nike Zoom Vapor', 99.95, 'Not Available'),
('Shoes', 'Nike', 'Nike Vapor Cage', 130.99, 'Available'),
('Overgrip', 'Head', 'Head Super Comp Grip', 5.00, 'Available'),
('Overgrip', 'Head', 'Head Prime Pro Overgrip', 9.95, 'Not Available'),
('String', 'Luxilon', 'Luxilon Alu Power Roland Garros 16', 17.95, 'Available'),
('String', 'Prince', 'Prince Perfection 16 Gauge', 6.95, 'Not Available'),
('Racquet', 'Wilson', 'Wilson Pro Staff 97', 200.00, 'Available');

INSERT INTO feedback(score, comments, date, fk_customer_id)
VALUES
(5, 'The delivery was great but the packing was slightly damaged. The product was not damaged though so everything turned out okay. Love the new racquet!', '2020-04-22', 24),
(3, 'The shipping took much longer than the expected date. The strings I bought were great but it should not have taken this long', '2020-02-11', 25),
(1, 'Both the packing and the product were damaged. I bought a racquet and the grip was already falling off. Do not come here!', '2020-03-05', 28),
(5, 'Everything about this was great. No complaints!', '2020-06-07', 26),
(4, 'Everything turned out well but it did take a while for my things to ship.', '2020-07-11', 29),
(5, 'Best shop in the area! Best customer service!', '2020-06-23', 30),
(5, 'Great shoes! They feel so lightweight and breathable. Def recommend!', '2020-08-19', 31),
(2, 'I am disgusted by how long this took to ship. The website said only 4-5 days but this took over a week!', '2020-09-09', 27),
(5, 'Came here before and was satisfied then. Still satisfied even now! Come here for all your tennis needs!', '2020-10-10', 24),
(5, '10/10 customer service! So nice and friendly.', '2020-06-21', 32);

INSERT INTO orders(quantity, total_price, address, payment_method, date, fk_customer_id)
VALUES
(2, '113.65', '1578 Windsor Street', 'Card', '2020-04-19', 24),
(1, '76.54', '1329 Glen Circle', 'Card', '2020-04-19', 25),
(1, '15.42', '1399 Maple Drive', 'Card', '2020-04-19', 26),
(3, '240.54', '322 Lower Drive', 'Card', '2020-04-19', 32),
(1, '199.99', '8732 Upper Street', 'Card', '2020-04-19', 30),
(2, '210.42', '121 Ship Road', 'Card', '2020-04-19', 29),
(1, '8.84', '8732 Upper Street', 'Card', '2020-04-19', 30),
(1, '19.99', '744 Dublin Circle', 'Card', '2020-04-19', 31),
(3, '80.72', '882 Town Drive', 'Card', '2020-04-19', 28),
(4, '290.52', '2345 Fort Drive', 'Card', '2020-04-19', 27);

INSERT INTO feedback_product_junction(fk_feedback_id, fk_product_id)
VALUES
(1, 1),
(2, 2),
(3, 3), 
(4, 4), 
(5, 5), 
(6, 6), 
(7, 7), 
(8, 8), 
(9, 9), 
(10, 10);

INSERT INTO orders_employee_junction(fk_orders_id, fk_employee_id)
VALUES
(1, 1),
(2, 2),
(3, 3), 
(4, 4), 
(5, 5), 
(6, 6), 
(7, 7), 
(8, 8), 
(9, 9), 
(10, 10);
#----------------------------------------------------------------------------------------------------
#SQL STATEMENTS

#Single Table Select
#What is the most expensive product?
SELECT name_of_product, MAX(price) 
FROM product;

#Inner Join
#What is the name of the customer who had an order of 4 items?
SELECT CONCAT(last_name, ', ', first_name) as Name
FROM customer INNER JOIN orders
ON customer.customer_id = orders.fk_customer_id
WHERE quantity = 4;

#Left Join
#What is the feedback of the customer "George Jefferson"
SELECT feedback.comments, feedback.score
FROM customer LEFT JOIN feedback
ON customer.customer_id = feedback.fk_customer_id
WHERE first_name = 'George' AND last_name = 'Jefferson';

#Aggregate Function Query: Min
#What is the lowest feedback score the shop has received?
SELECT min(score)
FROM feedback;

#Aggregate Function Query: Max
#What is the address of the customer who purchased the most expensive order?
SELECT MAX(total_price), address
FROM orders;

#GROUP BY
#What are all of the different type of products this shop has to offer?
SELECT type_of_product, brand, name_of_product
FROM product
GROUP BY type_of_product;

#HAVING 
#Who is one customer that bought only one item
SELECT customer.first_name, customer.last_name
FROM customer INNER JOIN orders
on customer.customer_id = orders.fk_customer_id
GROUP BY quantity
HAVING quantity = 1;

#ORDER BY
#Who are the highest paid employees to the lowest paid employees
SELECT first_name, last_name, salary, position
FROM employee
ORDER BY salary
DESC LIMIT 10;

#LIMIT
#Who is the highest paid employee and what is their position?
SELECT first_name, last_name, position, MAX(salary)
FROM employee
WHERE salary = 90000
LIMIT 1;

#Subquery
#What are the names of the customers who earn between 30,000 and 50,000? These customers will receive a raise
(SELECT first_name, last_name, salary FROM employee 
WHERE salary BETWEEN  30000 AND 50000);