CREATE TABLE `placed_order`
(
`id` int NOT NULL,
`Restarant_id` int NOT NULL,
`Delivery_address` varchar(50) NOT NULL,
`Customer id` int NOT NULL,
`price` decimal(12,2) NOT NULL CHECK (price >= 0),
`discount` decimal(12,2) NOT NULL CHECK (discount >= 0),
`final price` decimal(12,2) NOT NULL CHECK (`final_price` >= 0),
`comment` text NULL,
PRIMARY KEY (id),
FOREIGN KEY (`Customer id`) REFERENCES `Customer`(id)
);
CREATE TABLE `comment`
(
`id` int NOT NULL,
`Placed_order_id` int NOT NULL,
`Customer_id` int NOT NULL,
`Comment_text` text NOT NULL,
`Is_complaint` bool NULL,
`Is_praise` bool NULL,
PRIMARY KEY (id),
FOREIGN KEY (`Customer id`) REFERENCES `Customer`(id),
FOREIGN KEY (`Placed_order_id`) REFERENCES Placed_order(id)
);
CREATE TABLE `Customer`
(
`id` int NOT NULL,
`customer_name` varchar(30) NOT NULL,
`city_id` int NOT NULL,
`address` varchar(50) NOT NULL,
`contact_phone` varchar(25) NOT NULL,
`email` varchar(35) NOT NULL,
`password` varchar(30) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (city_id) REFERENCES City(cityID)
);
CREATE TABLE `in_order`
(
`id` int NOT NULL,
`placed_order_id` int NOT NULL,
`offer_id` int NOT NULL,
`menu_item_id` int NOT NULL,
`quantity` int NOT NULL CHECK (quantity >= 0),
`item_price` decimal(12,2) NOT NULL CHECK (item_price >= 0),
`price` decimal(12,2) NOT NULL CHECK (price >= 0),
`comment` varchar(50) NULL,
PRIMARY KEY (id),
FOREIGN KEY (placed_order_id) REFERENCES placed_order(id),
FOREIGN KEY (offer_id) REFERENCES offer(id),
FOREIGN KEY (menu_item_id) REFERENCES menu_item(id)
);
CREATE TABLE `order_status`
(
`id` int NOT NULL,
`placed_order_id` int NOT NULL,
`status_catalog_id` int NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (placed_order_id) REFERENCES placed_order(id),
FOREIGN KEY (status_catalog_id) REFERENCES status_catalog(id)
);
CREATE TABLE `status_catalog`
(
`id` int NOT NULL,
`status_name` varchar(20) NOT NULL CHECK (status_name IN('Preparing food', 'Food is ready', 'Food is on the way')),
PRIMARY KEY (id)
);
