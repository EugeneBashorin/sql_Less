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