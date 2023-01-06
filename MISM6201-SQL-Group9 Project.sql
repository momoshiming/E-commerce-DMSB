DROP SCHEMA IF EXISTS Alibaba; 
CREATE SCHEMA Alibaba;
USE Alibaba;
/*
Drop table Vendor;
Drop table Products;
Drop table Category;
Drop table Option_;
Drop table User;
Drop table Payment;
Drop table Shopping_cart;
Drop table Orders;
Drop table Shipment;
Drop table Option_Added_Cart;
Drop table Vendor_Sell_Products;
Drop table Order_Madeof_Option;
Drop table Gift; */

CREATE TABLE Vendor
(Vendor_ID CHAR(4) NOT NULL,
Vendor_Name VARCHAR(25) NOT NULL,
Vendor_Phone VARCHAR(25) NOT NULL,
Vendor_Email VARCHAR(25) NOT NULL,
PRIMARY KEY (Vendor_ID) );

CREATE TABLE Category
(Category_ID CHAR(4) NOT NULL,
Category_Name VARCHAR(25) NOT NULL,
PRIMARY KEY (Category_ID) );

CREATE TABLE Products
(Product_ID CHAR(4) NOT NULL,
Category_ID CHAR(4) NOT NULL,
Product_Name VARCHAR(500) NOT NULL,
Descriptions VARCHAR(500) Not null,
PRIMARY KEY (Product_ID),
FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);

CREATE TABLE Option_
(Option_ID CHAR(4) NOT NULL,
Option_Name VARCHAR(500) NOT NULL,
Product_ID CHAR(4) NOT NULL,
On_Sale VARCHAR(25),
Inventory INT NOT NULL,
Price INT NOT NULL,
PRIMARY KEY (Option_ID),
FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
); 

CREATE TABLE User
(User_ID CHAR(3) NOT NULL,
FIRSTNAME VARCHAR(25) NOT NULL,
LASTNAME VARCHAR(25),
GENDER VARCHAR(25) NOT NULL,
USER_EMAIL VARCHAR(25) NOT NULL,
PHONE VARCHAR(25),
PRIMARY KEY (User_ID) );

CREATE TABLE Shopping_Cart
(Cart_ID CHAR(4) NOT NULL,
Date_Added DATE NOT NULL,
User_ID CHAR(3) NOT NULL,
PRIMARY KEY (Cart_ID),
FOREIGN KEY (User_ID) REFERENCES User(User_ID) );

CREATE TABLE Payment
(Payment_ID CHAR(3) NOT NULL,
User_ID CHAR(3),
Card_Number VARCHAR(25),
PRIMARY KEY (Payment_ID),
FOREIGN KEY (User_ID) REFERENCES Shopping_Cart(User_ID) );

CREATE TABLE Shipment
(Shipment_ID CHAR(4) NOT NULL,
User_ID CHAR(3),
Express_Name VARCHAR(25) NOT NULL,
Address VARCHAR(100) NOt Null, 
Zip_Code CHAR(25) NOT NULL,
Delivery_Date Date Not null,
PRIMARY KEY (Shipment_ID),
FOREIGN KEY (User_ID) REFERENCES User(User_ID) );

CREATE TABLE Orders
(Order_ID CHAR(4) NOT NULL,
Order_Date DATE NOT NULL,
Cart_ID CHAR(4) NOT NULL,
User_ID CHAR(3) NOT NULL,
Shipment_ID CHAR(4) Not null,
PRIMARY KEY (Order_ID),
FOREIGN KEY (Cart_ID) REFERENCES Shopping_Cart(Cart_ID),
FOREIGN KEY (User_ID) REFERENCES User(User_ID),
FOREIGN KEY (Shipment_ID) REFERENCES Shipment(Shipment_ID) );

####################################ALL_Relational_TABLES_BELOW
CREATE TABLE Option_Added_Cart
( Option_ID CHAR(4) NOT NULL,
Cart_ID CHAR(4) NOT NULL,
Quantity NUMERIC (9,2) NOT NULL,
FOREIGN KEY (Option_ID) REFERENCES Option_(Option_ID),
FOREIGN KEY (Cart_ID) REFERENCES Shopping_Cart(Cart_ID))
;

CREATE TABLE Vendor_Sell_Products
( Vendor_ID CHAR(4) NOT NULL,
Product_ID CHAR(4) NOT NULL,
FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID),
FOREIGN KEY (Vendor_ID) REFERENCES Vendor(Vendor_ID))
;

CREATE TABLE Order_Madeof_Option
(Order_ID CHAR(4) NOT NULL,
Option_ID CHAR(4) NOT NULL,
Quantity NUMERIC (9,2) ,
FOREIGN KEY (Option_ID) REFERENCES Option_(Option_ID),
FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
 );

CREATE TABLE Gift
(Giver_ID CHAR(4) NOT NULL,
Receiver_ID CHAR(4) NOT NULL,
FOREIGN KEY (Giver_ID) REFERENCES User(User_ID),
FOREIGN KEY (Receiver_ID) REFERENCES User(User_ID)
 );
 
 ################### INSERTING_VALUES##################

#insert value into table Vendor 
INSERT INTO Vendor VALUES ('5000', 'Apple', '2569561656', 'apple@gmail.com');
INSERT INTO Vendor VALUES ('5100', 'Microsoft', '6165486561', 'microsoft@gmail.com');
INSERT INTO Vendor VALUES ('5200', 'Lenovo', '3215689466', 'lenovo@gmail.com');
INSERT INTO Vendor VALUES ('5300', 'Asus', '9568484613', 'asus@gmail.com');
INSERT INTO Vendor VALUES ('5400', 'Dell', '8465473132', 'dell@gmail.com');
INSERT INTO Vendor VALUES ('5500', 'Monoprice ', '3189831684', 'monoprice@gmail.com');
INSERT INTO Vendor VALUES ('5600', 'Sony', '4846531876', 'sony@gmail.com');
Select* from Vendor;

#insert value into table Category
INSERT INTO Category VALUES ('4000','Laptops');
INSERT INTO Category VALUES ('4100','Mobile phones');
INSERT INTO Category VALUES ('4200','Tablets');
INSERT INTO Category VALUES ('4300','Servers');
INSERT INTO Category VALUES ('4400','PC');
INSERT INTO Category VALUES ('4500','Cables');
INSERT INTO Category VALUES ('4600','Headphones');
Select* from Category;

##insert value into table Products
INSERT INTO Products VALUES ('1200','4000','Macbook Pro','The ultimate pro notebook. MacBook Pro features faster processors ;upgraded memory;the Apple T2 chip;and a Retina display with True Tone technology');
INSERT INTO Products VALUES ('1300','4000','Macbook Air','MacBook Air lasts up to an incredible 12 hours between charges So from your morning coffee till your evening commute;you can work unplugged. When itÌs time to kick back and relax;you can get up to 12 hours of iTunes movie playback');
INSERT INTO Products VALUES ('1400','4100','Iphone X','The iPhone X display is so immersive the device itself disappears into the experience.');
INSERT INTO Products VALUES ('1500','4100','Iphone 7', 'Great connectivity of this device includes Bluetooth 4.2 version with A2DP');
INSERT INTO Products VALUES ('1600','4100','Iphone 8','iPhone 8 introduces a glass design. The glass back enables easy wireless charging.');
INSERT INTO Products VALUES ('1700','4200','Ipad Air','4th gen The iPad Air is unbelievably thin and light. And yet it is so much more powerful and capable');
INSERT INTO Products VALUES ('1800','4200','Ipad Mini','3th gen Everything you love about iPad Û the beautiful screen and fast');
INSERT INTO Products VALUES ('1900','4300','ESC8000 G3', 'G3 High-density GPU server with hybrid computing power. ASUS-patented Adaptable Topology design.');
INSERT INTO Products VALUES ('2000','4300','ESC8000 G4', 'G4 High performance ASUS 2U server with hybrid-storage design and high power-efficiency');
INSERT INTO Products VALUES ('2100','4400','XPS 13 - 5080', 'Thinner and more powerful than ever the Dell XPS reinforces its lofty standing with an 8th Gen Intel Core processor immaculate 4K UHD display, and super-slim build.');
INSERT INTO Products VALUES ('2200','4400','XPS 15 - 5070', 'Ultra-thin and distinctly refined the stylish Dell Inspiron gives definitive elegance to a powerful and expansive PC experience.');
INSERT INTO Products VALUES ('2300','4500','Monoprice Ultra Slim Series High Speed HDMI Cable', 'Monoprice Commercial Cable supports the following HDMI features: 4K resolution at 24Hz. 3D video.');
INSERT INTO Products VALUES ('2400','4500','Monoprice Ultra Slim Series High Speed HDMI Cable - 4K','Avantree HT3189 Wireless Headphones for TV Watching & PC Gaming with Bluetooth');
INSERT INTO Products VALUES ('2500','4600','Avantree HT3189 Wireless Headphones', 'Active Noise Cancelling Headphone Bluetooth Headphones with Microphone Hi-Fi Deep Bass Wireless Headphones Over Ear 30H Playtime for Travel Work TV Computer Phone');
INSERT INTO Products VALUES ('2600','4600','COWIN E7 PRO', 'WHole lotta gang shit');
Select* from Products;

##insert value into table Option
INSERT INTO Option_ VALUES ('1201','Macbook Pro 13.3-inch', '1200','1','3','1299');
INSERT INTO Option_ VALUES ('1202','Macbook Pro 15.4-inch','1200','','2','1299');
INSERT INTO Option_ VALUES ('1301','Macbook Air 11.6-inch','1300','','1','999');
INSERT INTO Option_ VALUES ('1302','Macbook Air 13-inch','1300','1','4','1099');
INSERT INTO Option_ VALUES ('1401','Iphone X 128GB','1400','1','5','799');
INSERT INTO Option_ VALUES ('1402','Iphone X 256GB','1400','','7','899');
INSERT INTO Option_ VALUES ('1501','Iphone 7 64GB','1500','','8','399');
INSERT INTO Option_ VALUES ('1502','Iphone 7 32GB','1500','1','9','499');
INSERT INTO Option_ VALUES ('1601','Iphone 8 64GB','1600','','4','599');
INSERT INTO Option_ VALUES ('1602','Iphone 8 128GB','1600','1','7','699');
INSERT INTO Option_ VALUES ('1701','Ipad Air 9.7-inch','1700','1','20','899');
INSERT INTO Option_ VALUES ('1702','Ipad Air 12-inch','1700','','9','999');
INSERT INTO Option_ VALUES ('1801','Ipad Mini 7.9-inch','1800','1','40','499');
INSERT INTO Option_ VALUES ('1802','Ipad Mini 10-inch','1800','1','100','599');
INSERT INTO Option_ VALUES ('1901','ESC8000 G3 - 8 G Intel Xeon E5-1603 V4(2.80GHz,140W,L3:10M)','1900','1','4','650');
INSERT INTO Option_ VALUES ('1902','ESC8000 G3 - 8 G Intel Xeon E5-1620 v3 (3.5G,140W,L3:10M,4C,HT)','1900','0','6','750');
INSERT INTO Option_ VALUES ('2001','ESC8000 G4 - 8 G Intel Xeon E5-1603 v3 (3.5G,140W,L3:10M,4C,HT)','2000','','1','450');
INSERT INTO Option_ VALUES ('2002','ESC8000 G4 - 8 G Intel Xeon E5-1620 v3 (3.5G,140W,L3:10M,4C,HT)','2000','1','2','550');
INSERT INTO Option_ VALUES('2101',	'XPS 13 - 5080 8GB LPDDR3 1866MHz',	'2100',	'1',	'7',	'1250');
INSERT INTO Option_ VALUES('2102',	'XPS 13 - 5080 16GB LPDDR3 1866MHz',	'2100',	'',	1,	'1650');
INSERT INTO Option_ VALUES('2201',	'XPS 15- 5070 256GB PCIe Solid State Drive',	'2200',	'',	'10',	'600');
INSERT INTO Option_ VALUES('2202',	'XPS 15- 5070 500GB PCIe Solid State Drive',	'2200',	'1',	'50',	'700');
INSERT INTO Option_ VALUES ('2301','Monoprice Ultra Slim Series High Speed HDMI Cable - 4K - Length - 1ft','2300','','40','15');
INSERT INTO Option_ VALUES ('2302','Monoprice Ultra Slim Series High Speed HDMI Cable - 4K - Length - 1.5ft','2300','1','30','25');
INSERT INTO Option_ VALUES ('2401','Monoprice Ultra Slim Series High Speed HDMI Cable - 4K - Length - 3ft','2400','','1','10');
INSERT INTO Option_ VALUES ('2402','Monoprice Ultra Slim Series High Speed HDMI Cable - 4K - Length - 5ft','2400','','10','20');
INSERT INTO Option_ VALUES ('2501','COWIN E7 PRO - Black','2500','1','1','250');
INSERT INTO Option_ VALUES ('2502','COWIN E7 PRO - Red','2500','1','20','350');
INSERT INTO Option_ VALUES ('2601',	'COWIN E7 PRO - Pink',	'2600',	'', '9'	,'800');
INSERT INTO Option_ VALUES ('2602', 'COWIN E7 PRO - White',	'2600',	'1', '60',	'900');
select * from Option_;

##insert value into table User
INSERT INTO User VALUES ('100','Simon','Addison','M', 'anna.addison@yahoo.com', '3841019535');
INSERT INTO User VALUES ('101','Carol','Campbell','F', 'carol.campbell@aol.com', '2548952651');
INSERT INTO User VALUES ('102','Julia','Jones','F', 'jolie.jones@msn.com', '3651469235');
INSERT INTO User VALUES ('103','Mars','Everly','M', 'irene.everly@gmail.com', '9859423698');
INSERT INTO User VALUES ('104','Rachel','Addison','F', 'rachel.rose@hotmail.com', '2945632543');
INSERT INTO User VALUES ('105','Sophie','Addison','F', 'sophie.sutton@yahoo.com', '5169525614');
INSERT INTO User VALUES ('106','Josh','Addison','M', 'wendy.west@gmail.com', '6645936156');
select * from User;

###insert value into table shopping cart
INSERT INTO Shopping_Cart VALUES ('3000','2018-10-17','100');
INSERT INTO Shopping_Cart VALUES ('3100','2018-10-15','101');
INSERT INTO Shopping_Cart VALUES ('3200','2018-10-14','102');
INSERT INTO Shopping_Cart VALUES ('3300','2018-10-12','103');
INSERT INTO Shopping_Cart VALUES ('3400','2018-10-16','104');
INSERT INTO Shopping_Cart VALUES ('3500','2018-10-13','105');
INSERT INTO Shopping_Cart VALUES ('3600','2018-10-21','106');
select * from Shopping_Cart;


###insert value into table payment
INSERT INTO Payment VALUES ('111','100','2.56E+15');
INSERT INTO Payment VALUES ('222','101','1.36E+15');
INSERT INTO Payment VALUES ('333','102','6.84E+15');
INSERT INTO Payment VALUES ('444','103','3.19E+15');
INSERT INTO Payment VALUES ('555','104','3.57E+15');
INSERT INTO Payment VALUES ('666','105','6.53E+15');
INSERT INTO Payment VALUES ('777','106','1.35E+15');
select * from Payment;

###insert value into table shipment 
INSERT INTO Shipment VALUES ('1111','100','USPS','1325 Candy Rd, San Francisco, CA 96123','96123','2018-10-20');
INSERT INTO Shipment VALUES ('2222','101','FedEx','1931 Brown St, Gainesville, FL 85321','85321','2018-10-18');
INSERT INTO Shipment VALUES ('3333','102','USPS','1622 Seaside St, Seattle, WA 32569','32569','2018-10-17');
INSERT INTO Shipment VALUES ('4444','103','UPS','1756 East Dr, Houston, TX 28562','28562','2018-10-15');
INSERT INTO Shipment VALUES ('5555','104','FedEX','1465 River Dr, Boston, MA 43625','43625','2018-10-19');
INSERT INTO Shipment VALUES ('6666','105','USPS','1896 West Dr, Portland, OR 65842','65842','2018-10-16');
INSERT INTO Shipment VALUES ('7777','106','UPS','1252 Vine St, Chicago, IL 73215','73215','2018-10-24');
select * from Shipment;

###insert value into table orders
INSERT INTO Orders VALUES ('1000','2018-10-17','3000','100','1111');
INSERT INTO Orders VALUES ('1001','2018-10-15','3100','101','2222');
INSERT INTO Orders VALUES ('1002','2018-10-14','3200','102','3333');
INSERT INTO Orders VALUES ('1003','2018-10-12','3300','103','4444');
INSERT INTO Orders VALUES ('1004','2018-10-16','3400','104','5555');
INSERT INTO Orders VALUES ('1005','2018-10-13','3500','105','6666');
INSERT INTO Orders VALUES ('1006','2018-10-21','3600','106','7777');
select * from Orders;

###insert value into table gift
INSERT INTO Gift VALUES ('100','106');
INSERT INTO Gift VALUES ('101','106');
INSERT INTO Gift VALUES ('102','104');
INSERT INTO Gift VALUES ('103','104');
INSERT INTO Gift VALUES ('104','101');
INSERT INTO Gift VALUES ('105','101');
INSERT INTO Gift VALUES ('106','101');
select * from Gift;

###insert value into table Vendor_Sell_Products
INSERT INTO Vendor_Sell_Products VALUES ('5000','1200');
INSERT INTO Vendor_Sell_Products VALUES ('5000','1300');
INSERT INTO Vendor_Sell_Products VALUES ('5100','1400');
INSERT INTO Vendor_Sell_Products VALUES ('5100','1500');
INSERT INTO Vendor_Sell_Products VALUES ('5100','1600');
INSERT INTO Vendor_Sell_Products VALUES ('5200','1700');
INSERT INTO Vendor_Sell_Products VALUES ('5200','1800');
INSERT INTO Vendor_Sell_Products VALUES ('5300','1900');
INSERT INTO Vendor_Sell_Products VALUES ('5300','2000');
INSERT INTO Vendor_Sell_Products VALUES ('5400','2100');
INSERT INTO Vendor_Sell_Products VALUES ('5400','2200');
INSERT INTO Vendor_Sell_Products VALUES ('5500','2300');
INSERT INTO Vendor_Sell_Products VALUES ('5500','2400');
INSERT INTO Vendor_Sell_Products VALUES ('5600','2500');
INSERT INTO Vendor_Sell_Products VALUES ('5600','2600');
select * from Vendor_Sell_Products; 

###insert value into table Order_Madeof_Option
INSERT INTO Order_Madeof_Option VALUES ('1000','1201','1');
INSERT INTO Order_Madeof_Option VALUES ('1000','1202','1');
INSERT INTO Order_Madeof_Option VALUES ('1000','1301','3');
INSERT INTO Order_Madeof_Option VALUES ('1000','1302','1');
INSERT INTO Order_Madeof_Option VALUES ('1001','1401','1');
INSERT INTO Order_Madeof_Option VALUES ('1001','1402','2');
INSERT INTO Order_Madeof_Option VALUES ('1001','1501','3');
INSERT INTO Order_Madeof_Option VALUES ('1001','1502','3');
INSERT INTO Order_Madeof_Option VALUES ('1002','1601','1');
INSERT INTO Order_Madeof_Option VALUES ('1002','1602','3');
INSERT INTO Order_Madeof_Option VALUES ('1002','1701','1');
INSERT INTO Order_Madeof_Option VALUES ('1002','1702','2');
INSERT INTO Order_Madeof_Option VALUES ('1003','1801','3');
INSERT INTO Order_Madeof_Option VALUES ('1003','1802','1');
INSERT INTO Order_Madeof_Option VALUES ('1003','1901','3');
INSERT INTO Order_Madeof_Option VALUES ('1003','1902','3');
INSERT INTO Order_Madeof_Option VALUES ('1004','2001','3');
INSERT INTO Order_Madeof_Option VALUES ('1004','2002','2');
INSERT INTO Order_Madeof_Option VALUES ('1004','2101','1');
INSERT INTO Order_Madeof_Option VALUES ('1004','2102','1');
INSERT INTO Order_Madeof_Option VALUES ('1004','2201','2');
INSERT INTO Order_Madeof_Option VALUES ('1005','2301','3');
INSERT INTO Order_Madeof_Option VALUES ('1005','2302','1');
INSERT INTO Order_Madeof_Option VALUES ('1005','2401','3');
INSERT INTO Order_Madeof_Option VALUES ('1006','2402','1');
INSERT INTO Order_Madeof_Option VALUES ('1006','2501','2');
INSERT INTO Order_Madeof_Option VALUES ('1006','2502','1');
select * from Order_Madeof_Option;

###insert value into table Option_Added_Cart
INSERT INTO Option_Added_Cart VALUES ('1201','3000','2');
INSERT INTO Option_Added_Cart VALUES ('1202','3000','1');
INSERT INTO Option_Added_Cart VALUES ('1301','3000','3');
INSERT INTO Option_Added_Cart VALUES ('1302','3000','2');
INSERT INTO Option_Added_Cart VALUES ('1401','3100','1');
INSERT INTO Option_Added_Cart VALUES ('1402','3100','1');
INSERT INTO Option_Added_Cart VALUES ('1501','3100','2');
INSERT INTO Option_Added_Cart VALUES ('1502','3200','3');
INSERT INTO Option_Added_Cart VALUES ('1601','3200','2');
INSERT INTO Option_Added_Cart VALUES ('1601','3200','1');
INSERT INTO Option_Added_Cart VALUES ('1701','3200','1');
INSERT INTO Option_Added_Cart VALUES ('1701','3200','3');
INSERT INTO Option_Added_Cart VALUES ('1801','3300','2');
INSERT INTO Option_Added_Cart VALUES ('1802','3300','3');
INSERT INTO Option_Added_Cart VALUES ('1901','3300','3');
INSERT INTO Option_Added_Cart VALUES ('1902','3300','1');
INSERT INTO Option_Added_Cart VALUES ('2001','3400','1');
INSERT INTO Option_Added_Cart VALUES ('2002','3400','2');
INSERT INTO Option_Added_Cart VALUES ('2101','3400','1');
INSERT INTO Option_Added_Cart VALUES ('2201','3400','2');
INSERT INTO Option_Added_Cart VALUES ('2202','3400','1');
INSERT INTO Option_Added_Cart VALUES ('2301','3400','3');
INSERT INTO Option_Added_Cart VALUES ('2302','3400','1');
INSERT INTO Option_Added_Cart VALUES ('2401','3500','3');
INSERT INTO Option_Added_Cart VALUES ('2402','3500','1');
INSERT INTO Option_Added_Cart VALUES ('2501','3600','3');
INSERT INTO Option_Added_Cart VALUES ('2601','3600','2');
INSERT INTO Option_Added_Cart VALUES ('2602','3600','1');
Select * from Option_Added_Cart;

######################SQL QUERIES and SOLUTIONS################################
###################################################################

##############################Vendor
#1. How many goods does each Vendor has?  
Select V.Vendor_ID, Vendor_Name, sum(O.Inventory) as Total_amounts
From Vendor V, Vendor_Sell_Products VSP,  Products P, Option_ O, Order_Madeof_Option OMO
Where V.Vendor_ID = VSP.Vendor_ID and VSP.Product_ID = P.Product_ID and P.Product_ID = O.Product_ID
and O.Option_ID = OMO.Option_ID
Group by V.Vendor_ID, Vendor_Name
order by total_amounts desc;

#2. Which vendor has the highest number of on_sale Options? 
SELECT Vendor.Vendor_Name,  COUNT(Option_.Product_ID) AS ProductOnSale
FROM Vendor JOIN Vendor_Sell_Products ON Vendor.Vendor_ID = Vendor_Sell_Products.Vendor_ID
JOIN Products ON Vendor_Sell_Products.Product_ID = Products.Product_ID
JOIN Option_ ON Products.Product_ID = Option_.Product_ID
WHERE Option_.On_Sale = 1
GROUP BY Vendor.Vendor_ID
ORDER BY ProductOnSale DESC;

#3. what is the inventory turnover rate?(total products added in carts/ total inventory)
Select OAC.Option_ID, sum(OAC.Quantity) sell_products, sum(Inventory) total_inventory, 
		round(100*(sum(OAC.Quantity)/sum(Inventory)),2) Inventory_turnover_rate
from Shopping_Cart SC left join Option_Added_Cart OAC on OAC.Cart_ID = SC.Cart_ID
     left join Option_ O on O.Option_ID = OAC.Option_ID
group by OAC.Option_ID;

#4. What is GMV(Gross Merchasdise Value) for each vendor
with t1 as (
select V.vendor_ID, inventory*Price price
from vendor V, Vendor_sell_products VSP, products P, option_ O
where V.vendor_ID = VSP.vendor_ID and  VSP.product_ID = P.product_ID and P.product_ID = O.product_ID)
select Vendor_ID, sum(price) GMV 
from t1
group by vendor_ID
order by GMV desc; 

######################################For customer:
#1. What is the convertion ratio of order in cart? 
select a.Cart_ID, total_cart_quantity, total_order_quantity, 
	   round(100*(total_order_quantity/total_cart_quantity),0) conversion_rate
from 
(#total quantity in each cart
Select SC.Cart_ID, sum(quantity) total_cart_quantity
from Shopping_Cart SC left join Option_Added_Cart OAC on OAC.Cart_ID = SC.Cart_ID
     left join Option_ O on O.Option_ID = OAC.Option_ID
     left join Orders on SC.Cart_ID = Orders.Cart_ID 
group by SC.Cart_ID) a ,
(Select SC.Cart_ID, sum(quantity) total_order_quantity
from Shopping_Cart SC left join Option_Added_Cart OAC on OAC.Cart_ID = SC.Cart_ID
     left join Option_ O on O.Option_ID = OAC.Option_ID
     left join Orders on SC.Cart_ID = Orders.Cart_ID 
where Orders.order_ID is not null
group by SC.Cart_ID) b 
where a.cart_ID = b.cart_ID;

#2. What is total price for each order made by each customers?
SELECT CONCAT(User.FIRSTNAME, User.LASTNAME) AS CustomerName, Order_Madeof_Option.Order_ID, SUM(Option_.Price * Order_Madeof_Option.Quantity) AS TotalPrice
FROM User join Orders ON User.User_ID = Orders.User_ID
JOIN Order_Madeof_Option ON Orders.Order_ID = Order_Madeof_Option.Order_ID
JOIN Option_ ON Option_.Option_ID = Order_Madeof_Option.Option_ID
GROUP BY Order_Madeof_Option.Order_ID
ORDER BY TotalPrice DESC;

#3. What is total items in each customer's Cart? 
select u.user_ID, sum(quantity) total_quantity_in_cart
from User U, Shopping_cart SC, Option_added_cart OAC, option_ O
where U.user_ID = SC.user_ID and SC.cart_ID = OAC.cart_ID and oac.option_ID = o.option_ID
group by u.user_ID;

#4. What is average time interval between the time goods added into the cart and the time goods checked out?
select SC.User_ID, round(avg(Order_Date - Date_Added),0) Time_Interval 
from Orders O, shopping_cart SC
where O.cart_ID = SC.cart_ID
group by SC.User_ID;

#####################################For Platform:
#1. How many items are sold in each date?(order);
SELECT Orders.Order_Date, SUM(Order_Madeof_Option.Quantity) AS TotalSold
FROM Order_Madeof_Option JOIN Orders 
ON Order_Madeof_Option.Order_ID = Orders.Order_ID
#WHERE Orders.Order_Date BETWEEN '2018-10-11 00:00:00' AND '2018-10-12 00:00:00'
GROUP BY Orders.Order_Date
ORDER BY TotalSold DESC;

#2. Which gender would like to buy more products? 
SELECT User.GENDER, round(SUM(Order_Madeof_Option.Quantity),2) AS TotalSold
FROM Order_Madeof_Option JOIN Orders ON Order_Madeof_Option.Order_ID = Orders.Order_ID 
JOIN User ON Orders.User_ID = User.User_ID
GROUP BY User.GENDER
ORDER BY TotalSold DESC;

#3. Which express company has the longest average shipping period?
SELECT Shipment.Express_Name, AVG(Shipment.Delivery_Date - Orders.Order_Date) AS 'ShippingPeriod'
FROM Shipment JOIN Orders ON Shipment.Shipment_ID = Orders.Shipment_ID
GROUP BY Shipment.Express_Name
ORDER BY ShippingPeriod DESC;

#4. How many options are in each category?
Select category_name, sum(inventory) Total_amounts
From category C, Products P, Option_ O
where C.category_ID = P.category_ID and O.Product_ID = P.Product_ID
Group by category_name;