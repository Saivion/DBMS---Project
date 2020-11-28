drop table restaurant;

drop table customer;

drop table city;

drop table food_category;

drop table menu_item;

drop table placed_order;

drop table in_order;

drop table order_status;




alter table restaurant drop  foreign key restaurant_ibfk_1;

alter table customer drop  foreign key customer_ibfk_1;


alter table placed_order add  foreign key (customer_id) REFERENCES customer(customer_id);

alter table placed_order drop  foreign key placed_order_ibfk_1;


alter table menu_item drop foreign key menu_item_ibfk_1;

alter table in_order drop foreign key in_order_ibfk_2;


alter table order_status drop foreign key in_order_ibfk_2;




alter table customer add column street_address  varchar(50) NOT NULL;

select*from customer;

select*from restaurant;

select*from city;

select*from food_category;

select*from menu_item;

select*from placed_order;

select*from in_order;




Error Code: 3730. Cannot drop table 'customer' referenced by a foreign key constraint 'placed_order_ibfk_1' on table 'placed_order'.

Error Code: 3730. Cannot drop table 'city' referenced by a foreign key constraint 'restaurant_ibfk_1' on table 'restaurant'.

Error Code: 3730. Cannot drop table 'city' referenced by a foreign key constraint 'customer_ibfk_1' on table 'customer'.

Error Code: 3730. Cannot drop table 'food_category' referenced by a foreign key constraint 'menu_item_ibfk_1' on table 'menu_item'.

Error Code: 3730. Cannot drop table 'menu_item' referenced by a foreign key constraint 'in_order_ibfk_2' on table 'in_order'.

Error Code: 3730. Cannot drop table 'placed_order' referenced by a foreign key constraint 'in_order_ibfk_1' on table 'in_order'.

Error Code: 3730. Cannot drop table 'placed_order' referenced by a foreign key constraint 'order_status_ibfk_1' on table 'order_status'.

Error Code: 3813. Column check constraint 'in_order_chk_3' references other column.

Error Code: 3730. Cannot drop table 'menu_item' referenced by a foreign key constraint 'in_order_ibfk_2' on table 'in_order'.

Error Code: 1091. Can't DROP 'in_order_ibfk_2'; check that column/key exists




