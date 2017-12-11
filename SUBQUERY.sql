--SUBQUERY-подзапросы
USE productDb;

CREATE TABLE Products
(
    Id INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(30) NOT NULL,
    Manufacturer NVARCHAR(20) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price MONEY NOT NULL
);

CREATE TABLE Customers(
	Id INT IDENTITY PRIMARY KEY,
	FirstName NVARCHAR(30) NOT NULL
);

CREATE TABLE Orders(
	Id INT IDENTITY PRIMARY KEY,
	Productid INT NOT NULL REFERENCES Products(Id) ON DELETE CASCADE,
	CustomersId INT NOT NULL REFERENCES Customers(Id) ON DELETE CASCADE,
	CreatedAt DATE NOT NULL,
	ProductCount INT DEFAULT 1,
	Price MONEY NOT NULL
);

INSERT INTO Products 
	VALUES ('iPhone 6', 'Apple', 2, 36000),
			('iPhone 6S', 'Apple', 2, 41000),
			('iPhone 7', 'Apple', 5, 52000),
			('Galaxy S8', 'Samsung', 2, 46000),
			('Galaxy S8 Plus', 'Samsung', 1, 56000),
			('Mi 5X', 'Xiaomi', 2, 26000),
			('OnePlus 5', 'OnePlus', 6, 38000)

INSERT INTO Customers
	 VALUES ('Tom'),('Bob'),('Sam')

INSERT INTO Orders VALUES
(
		(SELECT Id FROM Products WHERE ProductName ='Galaxy S8'),
		(SELECT Id FROM Customers Where FirstName = 'TOM'),
		'2017-11-12',
		2,
		(SELECT Price FROM Products WHERE ProductName = 'Galaxy S8')
	),
(
		(SELECT Id FROM Products WHERE ProductName = 'iPhone 6'),
		(SELECT Id FROM Customers WHERE FirstName = 'TOM'),
		'2017-10-12',
		1,
		(SELECT Price FROM Products WHERE ProductName = 'iPhone 6')
	),
(
		(SELECT Id FROM Products WHERE ProductName = 'iPhone 6'),
		(SELECT Id FROM Customers WHERE FirstName = 'Bob'),
		'2017-11-12',
		1,
		(SELECT Price FROM Products WHERE ProductName = 'iPhone 6')
	)

--Min price
SELECT * FROM Products
		WHERE Price = (SELECT MIN(Price) FROM Products);

--Price > AVG
SELECT * FROM Products
		WHERE Price >(SELECT AVG(Price) FROM Products);

--КОРРЕЛИРУЮЩИЕ ПОДЗАПРОСЫ (correlated subquery) результаты которых зависят от строк, которые выбираются в основном запросе

--все заказы из таблицы Orders, добавив к ним информацию о товаре
SELECT CreatedAt, Price,
		(SELECT ProductName FROM Products
		WHERE Products.Id = Orders.Productid) AS Product
	FROM Orders;

--Коррелирующий подзапрос может выполняться и для той же таблицы, к которой выполняется основной запрос.
--Выбрать из таблицы Products товары, стоимость которых выше средней цены товаров для данного производителя

SELECT ProductName, Manufacturer, Price,
		(SELECT AVG(Price) FROM Products AS SubProds
		WHERE SubProds.Manufacturer = Prods.Manufacturer) AS AvgPrice
	FROM Products AS Prods
	WHERE Price >
		(SELECT AVG(Price) FROM Products AS SubProds
		WHERE SubProds.Manufacturer = Prods.Manufacturer)