CREATE TABLE City ( cityID int NOT NULL, 
									 city  varchar(255) NOT NULL CHECK (city not like '%[^0-9]%') , 
									 state  varchar(255) NOT NULL CHECK (state not like '%[^0-9]%'),
									 zipCode varchar(255) NOT NULL, 
									 PRIMARY KEY(cityID));
                                                
CREATE TABLE Restaurant ( restaurantID int NOT NULL, 
												restaurantName varchar(255) NOT NULL, 
												address  varchar(255) NOT NULL , 
                                                cityID int NOT NULL, 
                                                PRIMARY KEY(restaurantID),
                                                FOREIGN KEY (cityID) references City(cityID));
                                                


drop table Restaurant
