USE productDb;
CREATE TABLE Products
(
Id INT IDENTITY PRIMARY KEY,
ProductName NVARCHAR(30) NOT NULL,
Manufacturer NVARCHAR(20) NOT NULL,
ProductCount INT DEFAULT 0,
Price MONEY NOT NULL 
)

INSERT Products VALUES ('iPhone7','Apple', 6, 32000)

INSERT INTO Products(ProductName, Manufacturer, Price) VALUES ('iPhone6Splus','Apple',23000)

INSERT INTO Products VALUES
						('iPhone6','Apple',3,15000),
						('Galaxy S8','Sumsung',2,20000),
						('Galaxy S8 Plus', 'Samsung', 1, 25000)

INSERT INTO Products(ProductName, Manufacturer, ProductCount, Price) VALUES
						('Mi6','Xiaomi',DEFAULT, 12000)