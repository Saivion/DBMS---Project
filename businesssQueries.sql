-- How many 5 star rating foods at () restaurant.
	SELECT COUNT(rating) AS five_star_foods FROM menu_item WHERE rating > 4 AND restaurant_id IN 
	(SELECT restaurant_id FROM restaurant WHERE restaurant_name = 'Chick-fil-A');

-- How many restaurants are subscribed to our delivery program.
	SELECT SUM(restaurant_id) AS our_fleet FROM restaurant;
	
-- Menu items in () restaurant.
-- Who was our very first user.
-- Who was our very first restaurant.
-- Lifetime orders by ()
-- Least purchased from restaurant.
-- Restaurant with most delivers.
-- Most valuable user(spent the most).
-- When was the very frist order placed on our platform.
