/*
CREATE TABLE `placed_order`
(
`Id` int,
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
`ts` timestamp
);
*/
/*
CREATE TABLE `comment`
(
`Id` int,
`Placed_order_id` int,
`Customer_id` int,
`Comment_text` text,
`ts` timestamp,
`Is_complaint` bool,
`Is_praise` bool
);
*/
/*
CREATE TABLE `customer:orders`
(
`Id` int,
`customer_name` varchar(30),
`city_id` int,
`address` varchar(50),
`contact_phone` varchar(25),
`email` varchar(35),
`confirmation_code` varchar(30),
`password` varchar(30),
`time_joined` timestamp
);
*/
/*
CREATE TABLE `in_order`
(
`Id` int,
`placed_order_id` int,
`offer-id` int,
`menu_item_id` int,
`quantity` int,
`item_price` decimal(12,2),
`price` decimal(12,2),
`comment` varchar(50)
);
*/
/*
CREATE TABLE `order_status`
(
`Id` int,
`placed_order_id` int,
`status_catalog_id` int,
`ts` timestamp
);
*/
/*
CREATE TABLE `status_catalog`
(
`Id` int,
`status_name` varchar(20)
);
*/

