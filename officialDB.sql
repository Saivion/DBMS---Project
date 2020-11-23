CREATE TABLE city( 
city_id int NOT NULL, 
city  varchar(20) NOT NULL CHECK (city not like '%[^0-9]%'), 
state  varchar(15) NOT NULL CHECK (state not like '%[^0-9]%'),
zip_code varchar(20) NOT NULL, 
PRIMARY KEY(city_id));

CREATE TABLE restaurant( 
restaurant_id int NOT NULL, 
restaurant_name varchar(25) NOT NULL, 
address  varchar(50) NOT NULL , 
city_id int NOT NULL, 
PRIMARY KEY(restaurant_id),
FOREIGN KEY (city_id) references city(city_id));

CREATE TABLE customer(
customer_id int NOT NULL,
customer_name varchar(255) NOT NULL,
city_id int NOT NULL,
address varchar(50) NOT NULL,
contact_phone varchar(25) NOT NULL,
email varchar(30) NOT NULL,
password varchar(20) NOT NULL,
PRIMARY KEY (customer_id),
FOREIGN KEY (city_id) REFERENCES city(city_id));

create table category(
category_id int NOT NULL,
category_name varchar(50),
PRIMARY KEY (category_id));

create table menu_item(
item_id int NOT NULL, 
item_name varchar(50) NOT NULL,
category_id int NOT NULL,
description text,
ingredients text NOT NULL,  
price decimal(3,2) NOT NULL,
active bool NOT NULL, -- whats this for?
PRIMARY KEY (item_id),
FOREIGN KEY (category_id) references category(category_id));

CREATE TABLE placed_order(
order_id int NOT NULL,
restarant_id int NOT NULL,
delivery_address varchar(50) NOT NULL,
customer_id int NOT NULL,
price decimal(3,2) NOT NULL CHECK (price >= 0),
discount decimal(3,2) NOT NULL CHECK (discount >= 0),
final_price decimal(3,2) NOT NULL CHECK (final_price >= 0),
comment text NULL,
PRIMARY KEY (order_id),
FOREIGN KEY (customer_id) REFERENCES customer(customer_id));

CREATE TABLE in_order(
id int NOT NULL, -- do we need an id for this?
placed_order_id int NOT NULL,
offer_id int NOT NULL,
menu_item_id int NOT NULL,
quantity int NOT NULL CHECK (quantity >= 0),
item_price decimal(3,2) NOT NULL CHECK (item_price >= 0),
price decimal(3,2) NOT NULL CHECK (price >= 0),
comment varchar(50) NULL,
PRIMARY KEY (id),
FOREIGN KEY (offer_id) REFERENCES in_offer(offer_id),
FOREIGN KEY (placed_order_id) REFERENCES placed_order(order_id),
FOREIGN KEY (menu_item_id) REFERENCES menu_item(item_id));


create table in_offer(
offer_id int NOT NULL,
menu_item_id int,
PRIMARY KEY (offer_id),
FOREIGN KEY (menu_item_id) references menu_item(item_id));											

-- what's this table for^

CREATE TABLE comment(
comment_id int NOT NULL,
placed_order_id int NOT NULL,
customer_id int NOT NULL,
comment_text text NOT NULL,
Is_complaint bool NULL, -- do we need this?
Is_praise bool NULL, -- do we need this?
PRIMARY KEY (comment_id),
FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
FOREIGN KEY (placed_order_id) REFERENCES placed_order(order_id));

CREATE TABLE status_catalog(
id int NOT NULL,
status_name varchar(20) NOT NULL CHECK (status_name IN('Preparing food', 'Food is ready', 'Food is on the way')),
PRIMARY KEY (id));

CREATE TABLE order_status(
id int NOT NULL,
placed_order_id int NOT NULL,
status_catalog_id int NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (placed_order_id) REFERENCES placed_order(order_id),
FOREIGN KEY (status_catalog_id) REFERENCES status_catalog(id));
