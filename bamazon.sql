DROP DATABASE IF EXISTS bamazon_db;

CREATE DATABASE bamazon_db;

USE bamazon_db;



CREATE TABLE products (
item_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(255) NOT NULL,
department_name VARCHAR(255) NOT NULL,
price DECIMAL (10,2),
stock_quantity INT
);

SELECT * FROM products;

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES("iRobot", "Electronics", 600.00, 200);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES("Cabernet Wine Case", "Alcohol", 50.00, 150);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES("Sonos Speaker", "Electronics", 500.00, 50);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES("Body Wash", "Health and Beauty", 20.00, 300);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES("Clorox Wipes", "Cleaning Products", 15.25, 100);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES("Mac Desktop Computer", "Electronics", 2500.00, 220);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES("Soda Stream", "Kitchen", 250.00, 100);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES("Coconut Oil", "Kitchen", 13.50, 200);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES("Plate Set", "Kitchen", 65.00, 85);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES("Paper Towels", "Cleaning Products", 8.00, 500);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES("White Wine Case", "Alcohol", 45.00, 200);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES("Jacket and Pants Set", "Clothing", 130.00, 20);



SELECT COUNT(*) FROM products;





