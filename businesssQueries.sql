-- How many 5 star rating foods at () restaurant.
	SELECT COUNT(rating) AS five_star_foods FROM menu_item WHERE rating > 4 AND restaurant_id IN 
	(SELECT restaurant_id FROM restaurant WHERE restaurant_name = 'Chick-fil-A');

-- How many restaurants are subscribed to our delivery program.
	SELECT SUM(restaurant_id) AS our_fleet FROM restaurant;
	
-- List all menu items in () restaurant.
	SELECT item_name FROM menu_item WHERE restaurant_id IN 
    (SELECT restaurant_id FROM restaurant WHERE restaurant_name = 'Chick-fil-A');
    
-- Who was our very first user.
	SELECT name,  MIN(date_joined) as date_joined FROM user
    GROUP BY name;
    
-- Who was our very first restaurant.
	SELECT restaurant_name,  MIN(date_joined) as date_joined FROM restaurant
    GROUP BY restaurant_name;

-- Lifetime orders by each user
	SELECT u.name, SUM(order_id) AS lifetime_orders FROM user u, placed_order p
    WHERE p.customer_id = u.user_id
    GROUP BY name;
    
-- Most valuable user(spent the most).
	SELECT u.name, SUM(final_price) AS lifetime_purchase_value FROM user u, placed_order p
    WHERE p.customer_id = u.user_id
    GROUP BY name;

-- List restaurants from most profitable to least profitable.
	SELECT r.restaurant_name, SUM(final_price) AS restaurant_revenue FROM restaurant r, placed_order p
    WHERE p.restaurant_id = r.restaurant_id
    GROUP BY restaurant_name
    ORDER BY restaurant_revenue;
    
-- When was the very frist order placed on our platform.
	SELECT MIN(date_ordered) as first_order FROM placed_order;

-- Restaurant with most delivers.
	SELECT r.restaurant_name, SUM(status_id) AS num_deliveries FROM restaurant r, placed_order p, order_status o
    WHERE p.restaurant_id = r.restaurant_id AND o.order_status = 'Delivered'
    GROUP BY restaurant_name
    ORDER BY num_deliveries;
	