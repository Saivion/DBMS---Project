CREATE TABLE city( 
city  varchar(20) NOT NULL CHECK (city not like '%[^0-9]%'), 
state  varchar(15) NOT NULL CHECK (state not like '%[^0-9]%'),
zip_code int NOT NULL, 
PRIMARY KEY(zip_code));

CREATE TABLE restaurant( 
restaurant_id int NOT NULL, 
restaurant_name varchar(25) NOT NULL, 
address  varchar(50) NOT NULL , 
zip_code int, 
PRIMARY KEY(restaurant_id),
FOREIGN KEY (zip_code) references city(zip_code)); 

CREATE TABLE customer(
customer_id int NOT NULL,
customer_name varchar(255) NOT NULL,
zip_code int,
address varchar(50) NOT NULL,
contact_phone varchar(25) NOT NULL,
email varchar(30) NOT NULL,
date_joined date,
password varchar(20) NOT NULL,
PRIMARY KEY (customer_id),
FOREIGN KEY (zip_code) REFERENCES city(zip_code));

create table food_category(
category_id int NOT NULL,
category_name varchar(50),
PRIMARY KEY (category_id));

create table menu_item(
item_id int NOT NULL, 
item_name varchar(50) NOT NULL,
category_id int NOT NULL,
description text,
price decimal(3,2) NOT NULL,
rating int,
PRIMARY KEY (item_id),
FOREIGN KEY (category_id) references food_category(category_id));

CREATE TABLE placed_order(
order_id int NOT NULL,
restarant_id int NOT NULL,
delivery_address varchar(50) NOT NULL,
customer_id int NOT NULL,
price decimal(3,2) NOT NULL CHECK (price >= 0),
discount decimal(3,2) CHECK (discount >= 0),
final_price decimal(3,2) NOT NULL CHECK (final_price >= 0),
comment text NULL,
date_ordered date,
comment_text text NOT NULL,
PRIMARY KEY (order_id),
FOREIGN KEY (customer_id) REFERENCES customer(customer_id));

CREATE TABLE in_order(
placed_order_id int,
menu_item_id int NOT NULL,
quantity int NOT NULL CHECK (quantity >= 0),
item_price decimal(3,2) NOT NULL CHECK (item_price >= 0),
price decimal(3,2) NOT NULL CHECK (price >= 0),
comment varchar(50) NULL,
FOREIGN KEY (placed_order_id) REFERENCES placed_order(order_id),
FOREIGN KEY (menu_item_id) REFERENCES menu_item(item_id));

CREATE TABLE order_status(
status_id int NOT NULL,
placed_order_id int NOT NULL,
status_name varchar(20) NOT NULL CHECK (status_name IN('Preparing food', 'Food is ready', 'Food is on the way')),
PRIMARY KEY (status_id),
FOREIGN KEY (placed_order_id) REFERENCES placed_order(order_id));
