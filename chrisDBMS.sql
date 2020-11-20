CREATE TABLE `placed_order`
(
`id` int,
`Restarant_id` int,
`Order_time` timestamp,
`Estimated_delivery_time` timestamp,
`Food ready` timestamp,
`Actual_delivery_time` timestamp,
`Delivery_address` varchar(50),
`Customer id` int,
`price` decimal(12,2),
`discount` decimal(12,2),
`final price` decimal(12,2),
`comment` text,
`ts` timestamp,
PRIMARY KEY (id),
FOREIGN KEY (`Customer id`) REFERENCES `customer:orders`(id)
);
CREATE TABLE `comment`
(
`id` int,
`Placed_order_id` int,
`Customer_id` int,
`Comment_text` text,
`ts` timestamp,
`Is_complaint` bool,
`Is_praise` bool,
PRIMARY KEY (id),
FOREIGN KEY (`Customer id`) REFERENCES `customer:orders`(id),
FOREIGN KEY (`Placed_order_id`) REFERENCES Placed_order(id)
);
CREATE TABLE `customer:orders`
(
`id` int,
`customer_name` varchar(30),
`city_id` int,
`address` varchar(50),
`contact_phone` varchar(25),
`email` varchar(35),
`confirmation_code` varchar(30),
`password` varchar(30),
`time_joined` timestamp,
PRIMARY KEY (id),
FOREIGN KEY (city_id) REFERENCES city(id)
);
CREATE TABLE `in_order`
(
`id` int,
`placed_order_id` int,
`offer_id` int,
`menu_item_id` int,
`quantity` int,
`item_price` decimal(12,2),
`price` decimal(12,2),
`comment` varchar(50),
PRIMARY KEY (id),
FOREIGN KEY (placed_order_id) REFERENCES placed_order(id),
FOREIGN KEY (offer_id) REFERENCES offer(id),
FOREIGN KEY (menu_item_id) REFERENCES menu_item(id)
);
CREATE TABLE `order_status`
(
`id` int,
`placed_order_id` int,
`status_catalog_id` int,
`ts` timestamp,
PRIMARY KEY (id),
FOREIGN KEY (placed_order_id) REFERENCES placed_order(id),
FOREIGN KEY (status_catalog_id) REFERENCES status_catalog(id)
);
CREATE TABLE `status_catalog`
(
`id` int,
`status_name` varchar(20),
PRIMARY KEY (id)
);
