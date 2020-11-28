INSERT INTO city (city, state)
VALUES ('Houston', 'TX');
INSERT INTO city (city, state)
VALUES ('Richmond', 'TX');
INSERT INTO city (city, state)
VALUES ('Katy', 'TX');


INSERT INTO restaurant (restaurant_name, street_address, zip_code, city_id, date_joined)
VALUES ('Chick-fil-A', '5644 W Grand Pkwy S', 77406, 2, '2019-12-15');
INSERT INTO restaurant (restaurant_name, street_address, zip_code, city_id, date_joined)
VALUES ('Mastros Steakhouse', '1650 W Loop S, Houston', 77027, 1, '2020-01-11');
INSERT INTO restaurant (restaurant_name, street_address, zip_code, city_id, date_joined)
VALUES ('Whataburger', '23540 Westheimer Pkwy', 77494, 3, '2020-01-01');

INSERT INTO user (name, street_address, zip_code, city_id, email, phone, date_joined)
VALUES ('John AppleSeed', '6207 Katy-Gaston Rd', 77494, 3, 'jseed@email.com', '111-111-1111', '2020-01-14');
INSERT INTO user (name, street_address, zip_code, city_id, email, phone, date_joined)
VALUES ('Jenn Doe', '23600 Farm to Market 1093', 77406, 2, 'jdoe@email.com', '111-111-1112', '2019-12-31');
INSERT INTO user (name, street_address, zip_code, city_id, email, phone, date_joined)
VALUES ('Jay Son', '1234 Road Rd', 77001, 1, 'json@email.com', '111-111-1113', '2020-03-31');
INSERT INTO user (name, street_address, zip_code, city_id, email, phone, date_joined)
VALUES ('Kayla Kay' , '2224 Street St', 77002, 1, 'kkay@email.com', '211-111-1112', '2020-02-20');

INSERT INTO food_category (category_name)
VALUES ('American');
INSERT INTO food_category (category_name)
VALUES ('Healthy');
INSERT INTO food_category (category_name)
VALUES ('Fast Food');
INSERT INTO food_category (category_name)
VALUES ('Dessert');

INSERT INTO menu_item (restaurant_id, item_name, price, rating, category_id)
VALUES (1, 'Cobb Salad', 7.99, 4, 2);
INSERT INTO menu_item (restaurant_id, item_name, price, rating, category_id)
VALUES (1, 'Mac & Cheese', 3.99, 3, 1);
INSERT INTO menu_item (restaurant_id, item_name, price, rating, category_id)
VALUES (1, 'Spicy Chicken Sandwich', 3.99, 5, 3);

INSERT INTO menu_item (restaurant_id, item_name, price, rating, category_id)
VALUES (2, 'Signature Warm Butter Cake', 18.00, 5, 4);

INSERT INTO menu_item (restaurant_id, item_name, price, rating, category_id)
VALUES (3, 'Sweet Spicy Bacon Burger', 10.99, 5, 3);


INSERT INTO placed_order (restaurant_id, customer_id, delivery_address, price, final_price, date_ordered)
VALUES (1, 1, '25330 Kingsland Blvd',11.98 , 11.98, '2020-02-11');

INSERT INTO placed_order (restaurant_id, customer_id, delivery_address, price, final_price, date_ordered)
VALUES (1, 2, '23600 Farm to Market 1093',7.98 , 15.96, '2020-01-01');

INSERT INTO placed_order (restaurant_id, customer_id, delivery_address, price, final_price, date_ordered)
VALUES (2, 2, '23600 Farm to Market 1093',36.00, price, '2020-05-01');

INSERT INTO placed_order (restaurant_id, customer_id, delivery_address, price, final_price, date_ordered)
VALUES (3, 3, '1234 Road Rd',21.98 , price, '2020-11-27');

INSERT INTO placed_order (restaurant_id, customer_id, delivery_address, price, final_price, date_ordered)
VALUES (1, 3, '23600 Farm to Market 1093',7.98 , 15.96, '2020-01-01');

INSERT INTO placed_order (restaurant_id, customer_id, delivery_address, price, final_price, date_ordered)
VALUES (1, 3, '23600 Farm to Market 1093',7.98 , 15.96, '2020-01-01');

INSERT INTO placed_order (restaurant_id, customer_id, delivery_address, price, final_price, date_ordered)
VALUES (1, 3, '23600 Farm to Market 1093',7.98 , 15.96, '2020-01-01');

INSERT INTO placed_order (restaurant_id, customer_id, delivery_address, price, final_price, date_ordered)
SELECT (1, 2, u.address, r.total_price, r.total_price, '2020-01-11') from user u, in_order r where u.id = customer_id AND r.placed_order_id = order_id;

INSERT INTO in_order (placed_order_id, menu_item_id, quantity, item_price, total_price)
VALUES (1, 2, 1,3.99 , 3.99);
INSERT INTO in_order (placed_order_id, menu_item_id, quantity, item_price, total_price)
VALUES (1, 1, 1,7.99 , 7.99);
INSERT INTO in_order (placed_order_id, menu_item_id, quantity, item_price, total_price)
VALUES (2, 3, 2, 3.99, quantity * item_price);
INSERT INTO in_order (placed_order_id, menu_item_id, quantity, item_price, total_price)
VALUES (2, 2, 2,3.99 , quantity * item_price);

INSERT INTO in_order (placed_order_id, menu_item_id, quantity, item_price, total_price)
VALUES (3, 4, 2, 18.00, quantity * item_price);

INSERT INTO in_order (placed_order_id, menu_item_id, quantity, item_price, total_price)
VALUES (4, 5, 2, 10.99, quantity * item_price);

INSERT INTO in_order (placed_order_id, menu_item_id, quantity, item_price, total_price)
SELECT (3, 1, 1, m.price, quantity * item_price) from menu_item m where m.item_id =  menu_item_id;

INSERT INTO order_status (placed_order_id, order_status)
VALUES (1, 'Delivered');
INSERT INTO order_status (placed_order_id, order_status)
VALUES (2, 'Delivered');
INSERT INTO order_status (placed_order_id, order_status)
VALUES (3, 'Delivered');
INSERT INTO order_status (placed_order_id, order_status)
VALUES (4, 'Preparing food');




