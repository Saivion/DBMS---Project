INSERT INTO city (city, state)
VALUES ('Richmond', 'TX');
INSERT INTO city (city, state)
VALUES ('Prairie View', 'TX');
INSERT INTO city (city, state)
VALUES ('Houston', 'TX');
INSERT INTO city (city, state)
VALUES ('Katy', 'TX');

INSERT INTO restaurant (restaurant_name, street_address, zip_code, city_id)
VALUES ('Chick-fil-A', '5644 W Grand Pkwy S', 77406, 2);

INSERT INTO customer (customer_name, street_address, zip_code, city_id, email, phone, date_joined)
VALUES ('John AppleSeed', '6207 Katy-Gaston Rd', 77494, 3, 'jseed@email.com', '111-111-1111', '2020-01-14');

INSERT INTO food_category (category_name)
VALUES ('American');
INSERT INTO food_category (category_name)
VALUES ('Healthy');

INSERT INTO menu_item (item_name, price, rating, category_id)
VALUES ('Cobb Salad', 7.99, 4, 2);
INSERT INTO menu_item (item_name, price, rating, category_id)
VALUES ('Mac & Cheese', 3.99, 3, 1);

INSERT INTO placed_order (restaurant_id, customer_id, delivery_address, price, final_price, date_ordered)
VALUES (1, 2, '25330 Kingsland Blvd',11.98 , 11.98, '2020-02-11');

INSERT INTO in_order (placed_order_id, menu_item_id, quantity, item_price, total_price)
VALUES (1, 2, 1,3.99 , 3.99);
INSERT INTO in_order (placed_order_id, menu_item_id, quantity, item_price, total_price)
VALUES (1, 1, 1,7.99 , 7.99);


INSERT INTO order_status (placed_order_id, order_status)
VALUES (1, 'Delivered');
