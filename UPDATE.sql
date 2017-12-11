--UPDATE	=>To change existing rows in a table
USE productDb;

UPDATE Products
		SET Price = Price - 3000;

SELECT * FROM Products;

UPDATE Products
		SET Manufacturer = 'Xiaomi'
		WHERE Manufacturer = 'Xiaomi Inc';

SELECT * FROM Products;

--������� � ���� Manufacturer �������� "Apple" �� "Apple Inc." � ������ 2 �������
UPDATE Products
		SET Manufacturer = 'Apple Inc'
		FROM
		(SELECT TOP 2 * FROM Products WHERE Manufacturer = 'Apple') AS SELECTED
		WHERE Products.Id = SELECTED.Id;

SELECT * FROM Products;