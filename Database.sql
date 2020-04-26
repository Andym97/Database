-- PC SORT DB --

CREATE SCHEMA IF NOT EXISTS `pcdb` DEFAULT CHARACTER SET utf8mb4 ;
USE `pcdb` ;


-- Product: "Parent" table --
CREATE TABLE  product (
  productID INT NOT NULL,
  price INT NOT NULL,
  brand VARCHAR(45) NULL,
  PRIMARY KEY (productID, price))
ENGINE = InnoDB;

-- Computer --
CREATE TABLE  computer (
  computerID  INT NOT NULL,
  rating VARCHAR(45) NULL,
  storage VARCHAR(45) NULL,
  ram INT NULL,
  cpu VARCHAR(45) NULL,
  os VARCHAR(45) NULL,
  productID INT NULL,
  PRIMARY KEY (computerID),
    FOREIGN KEY (productID)
    REFERENCES pcdb.product (productID)
    ON DELETE Set NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- Laptop --
CREATE TABLE  laptop (
  laptopID INT NOT NULL,
  laptopName VARCHAR(45) NULL,
  weight VARCHAR(45) NULL,
  screensize int NULL,
  productID INT NULL,
  computerID INT NULL,
  PRIMARY KEY (laptopID),
  CONSTRAINT laptop_IS_computer
    FOREIGN KEY (computerID)
    REFERENCES pcdb.computer(computerID),
    FOREIGN KEY (productID)
    REFERENCES pcdb.product(productID)
    ON DELETE Set NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;

 -- Tablet --
CREATE TABLE tablet (
  tabletID INT NOT NULL,
  tabletName VARCHAR(45) NULL,
  weight VARCHAR(45) NULL,
  screensize VARCHAR(45) NULL,
  battery VARCHAR(45) NULL,
  productID INT NULL,
  computerID INT NULL,
  PRIMARY KEY (tabletID),
  CONSTRAINT tablet_IS_computer
    FOREIGN KEY (computerID)
    REFERENCES pcdb.computer(computerID),
    FOREIGN KEY (productID)
    REFERENCES pcdb.product(productID)
    ON DELETE Set NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- Desktop --
CREATE TABLE  desktop (
  desktopID INT NOT NULL,
  desktopName VARCHAR(45) NULL,
  desktop_memory VARCHAR(45) NULL,
  desktop_storage VARCHAR(45) NULL,
  productID INT NULL,
  computerID INT NULL,
  PRIMARY KEY (desktopID),
  CONSTRAINT desktop_IS_computer
  FOREIGN KEY (computerID)
    REFERENCES pcdb.computer(computerID),
    FOREIGN KEY (productID)
    REFERENCES pcdb.product(productID)
    ON DELETE Set NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;




-- Monitor --
CREATE TABLE  monitor (
  monitorID INT NOT NULL,
  monitorSize VARCHAR(45) NULL,
  displayType VARCHAR(45) NULL,
  maxResolution  VARCHAR(45) NULL,
  productID INT NULL,
  PRIMARY KEY (monitorID),
 --  CONSTRAINT screen_IS_accessory    --			Do we need this line ? 
    FOREIGN KEY (productID)
     REFERENCES pcdb.product (productID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- Bundles (Can have some accessory and some PC) -- 
CREATE TABLE  bundle (
  bundleID INT NOT NULL,
  bundle_memory VARCHAR(45) NULL,
  bundle_storage VARCHAR(45) NULL,
  productID INT NULL,
  computerID INT NULL,
  PRIMARY KEY (bundleID),
  CONSTRAINT bundle_HAS_computer
    FOREIGN KEY (computerID)
    REFERENCES pcdb.computer(computerID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



								-- PRODUCT QUERIES - -
								--   1-5 = Computer, 6-10 = Laptop, 11-15 Desktop 16-20 Tablets
                                --  21-25 Screens,	 26-30 Bundles	
		-- Products --
insert into product(productID,price,brand)
value (1,1000,'APPLE');
insert into product(productID,price,brand)
value (2,1500,'DELL');
insert into product(productID,price,brand)
value (3,2000,'ASUS');
insert into product(productID,price,brand)
value (4,2500,'ACER');
insert into product(productID,price,brand)
value (5,3000,'APPLE');

		-- Laptops --
insert into product(productID,price,brand)
value (6,1399,'APPLE');
insert into product(productID,price,brand)
value (7,1299,'WINDOWS');
insert into product(productID,price,brand)
value (8,1599,'APPLE');
insert into product(productID,price,brand)
value (9,1799,'APPLE');
insert into product(productID,price,brand)
value (10,1599,'WINDOWS');

		-- Desktop --
insert into product(productID,price,brand)
value (11,1399,'HP');
insert into product(productID,price,brand)
value (12,1299,'LENOVO');
insert into product(productID,price,brand)
value (13,1599,'DELL');
insert into product(productID,price,brand)
value (14,1799,'ALIENWARE');
insert into product(productID,price,brand)
value (15,1599,'ASUS');

		-- Tablets --
insert into product(productID,price,brand)
value (16,400,'APPLE');
insert into product(productID,price,brand)
value (17,300,'APPLE');
insert into product(productID,price,brand)
value (18,350,'APPLE');
insert into product(productID,price,brand)
value (19,550,'SAMSUNG');
insert into product(productID,price,brand)
value (20,400,'SAMSUNG');

		-- MONITOR --
insert into product(productID,price,brand)
value (21, 169.99 ,'LG');
insert into product(productID,price,brand)
value (22,  259.99, 'DELL');
insert into product(productID,price,brand)
value (23,  299.99, 'ACER');
insert into product(productID,price,brand)
value (24, 349.99, 'SAMSUNG');
insert into product(productID,price,brand)
value (25, 499.99, 'ASUS');

		-- BUNDLES --
insert into product(productID,price,brand)
value (26, 1099.99 ,'APPLE');
insert into product(productID,price,brand)
value (27,  259.99, 'LENOVO');
insert into product(productID,price,brand)
value (28,  299.99, 'HP');
insert into product(productID,price,brand)
value (29, 349.99, 'DELL');
insert into product(productID,price,brand)
value (30, 499.99, 'ASUS');


-- ---------------------------------------------------------------------------------------------------- --
								
                                -- COMPUTER QUERIES - 

Insert into computer(computerID, rating, storage, ram, cpu, os, productID)
VALUE (1001, 1, '16', 16, 'CPU1001', 'MAC1001', 1);
Insert into computer(computerID, rating, storage, ram, cpu, os, productID)
VALUE (1002,  2, '32', 64, 'CPU1002', 'MAC1002', 2);
Insert into computer(computerID, rating, storage, ram, cpu, os, productID)
VALUE (1003, 3, '64', 32, 'CPU1003', 'MAC1003', 3);
Insert into computer(computerID, rating, storage, ram, cpu, os, productID)
VALUE (1004, 4, '128', 16, 'CPU1004', 'MAC1004', 4);
Insert into computer(computerID, rating, storage, ram, cpu, os, productID)
VALUE (1005, 5, '256', 32, 'CPU10005', 'MAC1005', 5);

								-- LAPTOP QUERIES - -
Insert into laptop (laptopID, laptopName, weight, screensize, productID, computerId)
VALUES (2001,'Macbook Air', '10pounds', 15, 6, 1001);
Insert into laptop (laptopID, laptopName, weight, screensize, productID, computerId)
VALUES (2002,'MSI GS65', '11pounds', 14, 7, 1002);
Insert into laptop (laptopID, laptopName, weight, screensize, productID, computerId)
VALUES (2003,'Macbook Pro', '12pounds', 16, 8, 1003);
Insert into laptop (laptopID, laptopName, weight, screensize, productID, computerId)
VALUES (2004,'Macbook Pro', '13pounds', 17, 9, 1004);
Insert into laptop (laptopID, laptopName, weight, screensize, productID, computerId)
VALUES (2005,'Dell XPS',' 14pounds', 18, 10, 1005);

								-- DESKTOP QUERIES --
insert into desktop(desktopID, desktopName,  desktop_memory,  desktop_storage, productID, computerId)
VALUE (3001, 'HP Pavillion Desktop', '16GB', '1TB', 11, 1006);
insert into desktop(desktopID, desktopName,  desktop_memory,  desktop_storage, productID, computerId)
VALUE (3002, 'Dell Inspiron Desktop','8GB ', '1TB', 12 , 1007);
insert into desktop(desktopID, desktopName,  desktop_memory,  desktop_storage, productID, computerId)
VALUE (3003, 'Levono IdeaCentre 310S Desktop', '4GB ', '1TB', 13,  1008);
insert into desktop(desktopID, desktopName,  desktop_memory,  desktop_storage, productID, computerId)
VALUE (3004, 'Aliennware Gaming Desktop', '12GB ', '256GB', 14, 1009);
insert into desktop(desktopID, desktopName,  desktop_memory,  desktop_storage, productID, computerId)
VALUE (3005, 'ASUS Gaming Desktop', '16 GB ', '1TB',15, 1010);

 
								-- TABLET QUERIES --
Insert into tablet(tabletID, tabletName, weight, screensize, battery, productID, computerID)
VALUE (4001, 'iPad', '1.5lb', '7in', '8GHZ', 16, 1011);
Insert into tablet(tabletID, tabletName, weight, screensize, battery, productID, computerID)
VALUE (4002, 'iPad', '1.2lb', '8in', '32GHZ', 17 ,1012);
Insert into tablet(tabletID, tabletName, weight, screensize, battery, productID, computerID)
VALUE (4003, 'iPad', '0.75lb', '7.5in', '32GHZ', 18, 1013);
Insert into tablet(tabletID, tabletName, weight, screensize, battery, productID, computerID)
VALUE (4004, 'Samsung', '1.0lb', '7in', '32GHZ', 19, 1014);
Insert into tablet(tabletID, tabletName, weight, screensize, battery, productID, computerID)
VALUE (4005, 'Samsung', '1.3lb', '9in', '16GHZ', 20, 1015);


								-- MONITOR QUERIES --
Insert into monitor( monitorID, monitorSize, displayType, maxResolution, productID) 
VALUE ( 5001 , 24 , 'LED',  '2560 x 1440', 21); 
Insert into monitor( monitorID, monitorSize, displayType, maxResolution, productID) 
VALUE ( 5002 , 27 , 'LCD',  '3840 x 2160', 22); 
Insert into monitor( monitorID, monitorSize, displayType, maxResolution, productID) 
VALUE ( 5003 , 20.7 , 'LED',  '1920 x 1080', 23); 
Insert into monitor( monitorID, monitorSize, displayType, maxResolution, productID) 
VALUE ( 5004 , 23.8 , 'LCD',  '2560 x 1440', 24); 
Insert into monitor( monitorID, monitorSize, displayType, maxResolution, productID) 
VALUE ( 5005 , 24 , 'LED',  '5120 x 2880', 25); 

      								-- BUNDLE QUERIES --
Insert into bundle(bundleID, bundle_memory, bundle_storage, productID, computerID)
 VALUE ( 6001, '16GB' , '1TB', 26, 1016);
Insert into bundle(bundleID, bundle_memory, bundle_storage, productID, computerID)
 VALUE ( 6002, '12GB', '512GB', 27, 1017) ;
Insert into bundle(bundleID, bundle_memory, bundle_storage, productID, computerID)
 VALUE ( 6003, '16GB', '256GB', 28, 1018) ;
Insert into bundle(bundleID, bundle_memory, bundle_storage, productID, computerID)
 VALUE ( 6004, '16GB', '1TB', 29, 1019) ;
Insert into bundle(bundleID, bundle_memory, bundle_storage, productID, computerID)
 VALUE ( 6005, '8GB', '256GB', 30 , 1020) ;
 
-- ---------------------------------------------------------------------------------------------------- --





		-- Alter Table: Laptop: Add "BATTERY" Column --
        
Alter table Laptop
ADD battery VARCHAR(45) DEFAULT '16GHz';
		
        -- Update a Specific Laptop's Battery Capacity --
Update laptop
set battery = '32GHZ' where  laptopID = 3002;

  -- Gets laptops from COMPUTER TABLE --
select *  
from laptop 
inner join Computer
on laptop.computerID = computer.computerID;


select *  
from desktop;
		--				--

	-- Gets laptops from PRODUCT table
select *  
from laptop 
inner join product
on laptop.productID = product.productID
order by price DESC;

/* returns matching product ID in desktop order by RAM" */
select *  
from desktop 
inner join computer
on desktop.computerID = computer.computerID
order by RAM DESC ;

		-- Get Laptop Brand, Name, Sort by Price -- 
        
select brand, laptopName, price
From product
inner join laptop on laptop.productID = product.productID
order by price ASC;


		-- Find tablets with battery capacity equivalent to a laptop --

select distinct t.tabletName, l.laptopName, t.battery, l.battery
from tablet t left outer join laptop l ON t.battery = l.battery
order by l.battery DESC;

		-- Order all laptops by battery capacity --
select *
From laptop
order by battery DESC;
		
        -- Select items from Desktop + Laptop where Battery exists --
select *
from laptop 
left outer join desktop
on laptop.computerID = desktop.desktopID;

		-- Select from laptops, where brand is APPLE and screensize > 15 --
select *
from(
select brand, laptopID, laptopName, screensize
From laptop
right outer join product on laptop.productID = product.productID
where product.brand = "APPLE") AS Apple_laptops
where screensize > 15;


create view Win_laptops AS
select brand, laptopID, laptopName, screensize
From laptop
right outer join product on laptop.productID = product.productID
where product.brand = "WINDOWS";


select * from Win_laptops;

							-- DROP TABLE QUERIES FOR TESTING --
                            
drop view Win_laptops;
drop table laptop;
drop table tablet;
drop table desktop;
drop table bundle;
drop table monitor;
drop table computer;
drop table product;
DROP DATABASE IF EXISTS `pcdb` ;

/* returns matching product ID in both tables order by price" 
select desktop.name
from desktop inner join laptop
on desktop.computerID = computer.productID
order by price DESC ;
