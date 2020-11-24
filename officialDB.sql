CREATE TABLE city( 
city_id int NOT NULL AUTO_INCREMENT,
city  varchar(50) NOT NULL CHECK (city not like '%[^0-9]%'), 
state  varchar(15) NOT NULL CHECK (state not like '%[^0-9]%'), 
PRIMARY KEY(city_id));

CREATE TABLE restaurant( 
restaurant_id int NOT NULL AUTO_INCREMENT, 
restaurant_name varchar(50) NOT NULL, 
street_address  varchar(50) NOT NULL, 
zip_code int NOT NULL, 
city_id int,
PRIMARY KEY(restaurant_id),
FOREIGN KEY (city_id) references city(city_id)); 

CREATE TABLE customer(
customer_id int NOT NULL AUTO_INCREMENT,
customer_name varchar(255) NOT NULL,
street_address varchar(50) NOT NULL,
zip_code int NOT NULL,
city_id int,
email varchar(30) NOT NULL,
phone varchar(25) NOT NULL,
date_joined date NOT NULL,
PRIMARY KEY (customer_id),
FOREIGN KEY (city_id) REFERENCES city(city_id));

create table food_category(
category_id int NOT NULL AUTO_INCREMENT,
category_name varchar(50) NOT NULL,
PRIMARY KEY (category_id));

create table menu_item(
restaurant_id int,
item_id int NOT NULL AUTO_INCREMENT, 
item_name varchar(50) NOT NULL,
description text NULL,
price decimal(3,2) NOT NULL,
rating int NULL,
category_id int,
PRIMARY KEY (item_id),
FOREIGN KEY (restaurant_id) references restaurant(restaurant_id),
FOREIGN KEY (category_id) references food_category(category_id));

CREATE TABLE placed_order(
order_id int NOT NULL AUTO_INCREMENT,
restaurant_id int,
customer_id int,
delivery_address varchar(50) NOT NULL,
price decimal(5,2) NOT NULL CHECK (price >= 0),
discount decimal(5,2) NULL,
final_price decimal(5,2) NOT NULL CHECK (final_price >= 0),
date_ordered date,
comment text  NULL,
PRIMARY KEY (order_id),
FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id));

CREATE TABLE in_order(
placed_order_id int,
menu_item_id int,
quantity int NOT NULL CHECK (quantity >= 0),
item_price decimal(3,2) NOT NULL CHECK (item_price >= 0),
total_price decimal(5,2) NOT NULL CHECK (total_price >= 0),
comment text  NULL,
FOREIGN KEY (placed_order_id) REFERENCES placed_order(order_id),
FOREIGN KEY (menu_item_id) REFERENCES menu_item(item_id));

CREATE TABLE order_status(
status_id int NOT NULL AUTO_INCREMENT,
placed_order_id int,
order_status varchar(20) NOT NULL CHECK (order_status IN('Preparing food', 'Food is ready', 'Food is on the way', 'Delivered')),
PRIMARY KEY (status_id),
FOREIGN KEY (placed_order_id) REFERENCES placed_order(order_id));

CREATE VIEW American AS
SELECT f.item_id, f.item_name, c.category_name
FROM menu_item AS f INNER JOIN catagory AS c
WHERE category_name ='American';
