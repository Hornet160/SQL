Create Database BikeshopAndServicing

Create Table BikeDetail(
	
	BikeModel varchar(25) primary key,
	BikeCC int not null,
	BikeCompany varchar(15) not null,
	BikePrice int not null,
	ManufacturingYear Date not null,
	Quantity int not null
	);

Create Table SellsPerson(
	SellerId int identity(1,1) primary key,
	SellerName varchar(30) not null,
	SellerRank varchar (30) not null,
	SellerSalary int not null,
	JobStartTime date not null
	);
Create Table SellingData(
	ReciptNo int Identity(1000,1) primary key,
	CustomerID int not null,
	CustomerName varchar(30) not null,
	SellerId int not null,
	SellerName varchar(30) not null,
	BikeModel varchar(25) not null,
	ManufacturingYear Date not null,
	BikePrice int not null,
	PurchaseDate date not null
	);
--Customer table
Create Table CustomerDetails(
	CustomerID int identity(500,1) primary key,
	CustomerName varchar(30) not null,
	CustomerPhoneNo int,
	CustomerAddresse varchar(255)
	);
Insert into BikeDetail Values('FZ-s',150,'Yamaha',239000,'2021-01-20',2),
('Hornet',160,'Honda',189900,'2020-05-12',3),('Xblade',160,'Honda',179900,'2021-05-15',7),
('Pulsar',160,'Bajal',199900,'2019-10-05',2),('Apache 4V',160,'TVS',183000,'2019-06-19',10),
('Gixxer',155,'Suzuki',239000,'2021-01-15',5)

Select * from BikeDetail;
--Drop table BikeDetail;

Insert Into SellsPerson values('Mehrab','CEO',1,'2019-05-01'),
('Nafiz','Manager',50000,'2019-05-01'),
('jobayed','Engine Mechanic',30000,'2019-05-01'),
('Omar','Security Guard',25000,'2019-05-01'),
('Riaz','Sales Executive',20000,'2019-08-01'),
('Rayhan','SalesMan',15000,'2020-06-01'),
('Mamun','Tea Boy',10000,'2021-01-01')

Select * from SellsPerson
--Drop Table SellsPerson

Insert into CustomerDetails values('Rafat',01789456123,'Bashundhara R/A'),
('Raiyyan',01789432153,'Old Dhaka'),
('Sifat',01485456945,'Khulna'),
('Rayna',0158545325,'Dhanmondi'),('Bayzid',0195545565,'Rangpur')

Select * from CustomerDetails
--Drop Table CustomerDetails


Insert into SellingData Values(500,'Rafat',2,'Nafiz','FZ-s','2021-01-20',239000,'2021-05-31'),
(501,'Raiyyan',5,'Riaz','Gixxer','2021-01-15',239000,'2021-01-20'),
(502,'Sifat',6,'Rayhan','Hornet','2020-05-12',189900,'2021-05-31'),
(503,'Rayna',5,'Riaz','Pulsar','2019-10-05',199900,'2020-07-18')

Select * from SellingData
--Drop Table SellingData

--Where Greater than
SELECT * FROM BikeDetail WHERE Bikeprice>200000;
--Where Less than
SELECT * FROM BikeDetail WHERE Bikeprice<200000;
--WHERE AND
SELECT * FROM BikeDetail WHERE (BikeCC = 160 AND BikePrice<190000)
--WHERE OR
SELECT * FROM BikeDetail WHERE (BikeCC <= 155 OR BikePrice>200000)
--Ascending Order
SELECT * FROM BikeDetail ORDER BY BikePrice;
--Descending Order
SELECT * FROM BikeDetail ORDER BY BikePrice desc;

--MiniMumn
Select Min(BikePrice) As MinimumPrice
From BikeDetail 
--Maximum
Select Max(BikePrice) As MaximumPrice
From BikeDetail 

--Sum
SELECT Sum(Quantity) As TotalBike
FROM BikeDetail

--Count
SELECT Count(ReciptNo) as TotalSale
FROM SellingData

--Average
SELECT AVG(BikePrice) As AvgPrice
FROM BikeDetail

--Group by
SELECT COUNT(BikeModel) AS Total,BikeCC 
FROM BikeDetail
GROUP BY BikeCC

--First Have Like
select * from CustomerDetails where CustomerName like 'R%';

--Last Have Like
select * from CustomerDetails where CustomerName like '%t';

--not like
select * from CustomerDetails where CustomerName Not like '%a';

-- IN operation

SELECT * FROM CustomerDetails
WHERE CustomerAddresse IN ('Khulna', 'Old Dhaka');

SELECT * FROM CustomerDetails
WHERE CustomerID IN (SELECT CustomerID FROM  SellingData Where BikePrice>200000 );

--Between

SELECT * FROM BikeDetail
WHERE BikePrice Between 190000 AND 250000;

--Having
----------------------------------------------------------------------------------------------------------
SELECT COUNT(ReciptNo) As TotalSale,BikePrice
FROM SellingData
GROUP BY BikePrice
HAVING BikePrice > 190000;

--INNER Join
----------------------------------------------------------------------------------------------------------
SELECT *
FROM SellingData
INNER JOIN CustomerDetails
ON SellingData.CustomerID = CustomerDetails.CustomerID;

--Left Join
SELECT *
FROM SellingData
Left JOIN CustomerDetails
ON SellingData.CustomerID = CustomerDetails.CustomerID;

--Right Join
SELECT *
FROM SellingData
Right JOIN CustomerDetails
ON SellingData.CustomerID = CustomerDetails.CustomerID;

--Full Join
SELECT *
FROM SellingData
Full Outer JOIN CustomerDetails
ON SellingData.CustomerID = CustomerDetails.CustomerID;
