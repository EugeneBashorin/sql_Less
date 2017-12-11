--DELETE
USE productDb;

DELETE Products
		WHERE Id = 9;

DELETE Products
		WHERE Manufacturer='Huawei' AND Price > 30000;

SELECT * FROM Products;

--удалим первые два товара, у которых производитель - Apple	
DELETE Products
		FROM(SELECT TOP 1 * FROM Products WHERE Manufacturer = 'Apple') AS SELECTED
		WHERE Products.Id = SELECTED.Id;

SELECT * FROM Products;