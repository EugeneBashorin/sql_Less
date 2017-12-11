USE productDb;

SELECT * FROM Products; --All columns

SELECT ProductName, Price FROM Products; --only important data from table

SELECT ProductName + ' (' + Manufacturer + ') ', Price, Price * ProductCount FROM Products; -- arithmetic output => (col.1)Iphone7(Apple) (col.2)32000 (col.3)192000 

SELECT
	ProductName +' (' + Manufacturer +') ' AS name_Brand, --AS ADD change output column name
	Price AS COST
	FROM Products;

SELECT DISTINCT Manufacturer FROM Products; -- SELECT UNIQUE Data from column without reapeat


SELECT ProductName + ' (' + Manufacturer + ')' AS ModelName, Price
		INTO ProductSummary												-- Will creat new empty table automaticaly, and write new Data
		FROM Products;													-- From Products
SELECT * FROM ProductSummary;


--In order to add some data to exist table should use INSERT with SELECT
 INSERT INTO ProductSummary
 SELECT ProductName + ' (' + Manufacturer + ')' AS ModelName, Price
 FROM Products;