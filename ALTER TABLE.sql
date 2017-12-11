Alter Table Customers
ADD Address NVARCHAR(50) NOT NULL Default'Undefinded';--Default nessessary 

Alter Table Customers
Add TempColumn NVARCHAR(50) not null;

Alter Table Customers
Drop column TempColumn;

ALTER TABLE Customers
ALTER COLUMN FirstName NVARCHAR(200);

ALTER TABLE Customers WITH NOCHECK --NOCHECK добавление св-ва без проверки на соответств(по умолч.пров.)
ADD CHECK(Age>21);

--Add primary key and attach second table
CREATE TABLE VIP_customers
(
    Id INT PRIMARY KEY IDENTITY,
    Age INT DEFAULT 18, 
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    Email VARCHAR(30) UNIQUE,
    Phone VARCHAR(20) UNIQUE
);
CREATE TABLE Luxury_orders
(
    Id INT IDENTITY,
    CustomerId INT,
    CreatedAt Date
);

ALTER TABLE Luxury_orders
ADD FOREIGN KEY (CustomerId) REFERENCES VIP_customers(Id);

ALTER TABLE Luxury_orders
ADD PRIMARY KEY(Id);

--добавление ограничений с именами
ALTER TABLE Luxury_orders
ADD CONSTRAINT PK_Orders_Id PRIMARY KEY(Id),
	CONSTRAINT FK_Orders_To_VIP_customers FOREIGN KEY(CustomerId) REFERENCES VIP_customers(Id);

ALTER TABLE VIP_customers
ADD CONSTRAINT CK_Age_Greater_That_Zero CHECK(Age>0);


