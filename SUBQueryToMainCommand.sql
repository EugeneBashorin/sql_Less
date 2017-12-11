--���������� � �������� �������� SQL

--� SELECT ����� ������� ���������� ���������:
--������������ � ������� � ��������� WHERE
--������������ � ������� � ��������� HAVING
--������������ � �������� ������� ��� ������� � ��������� FROM
--������������ � �������� ������������ ������� � ��������� SELECT
USE productDb;
--������� ��� ������, � ������� ���� ���� �������
SELECT * FROM Products
		WHERE Price > (SELECT AVG(Price) FROM Products);

--������� ���� ����������� �� ������� Customers, � ������� ��� ������� � ������� Orders
SELECT * FROM Customers
		WHERE Id NOT IN (SELECT CustomersId FROM Orders);

		--����� ��������
--� ���������� ��������� ���������� ������ ���������� ���� ��������� ��������.
--����� ��� ������������� � ���������� ��������� ��������� ��� ���������� ����� ��������,
-- ����� ��� ���������� ������������ ���� �� ����������: ALL, SOME, ANY.
--ALL => ������� � �������� ��������� ������ ���� ����� ��� ���� ��������, ������� ������������ �����������
--ANY/SOME =>������� � �������� ��������� ������ ���� �������� ��� ���� �� ������ �� ��������,
		-- ������������ �����������. �� �������� ����������, ����� ��������� ����� �� ���

--������ ��� ������, ���� ������� ������ ��� � ������ ������ ����� Apple
SELECT * FROM Products
		WHERE Price < ALL(SELECT MIN(Price) FROM Products
											 WHERE ProductName = 'Apple');
--WHERE Price < val1 AND Price < val2 AND Price < val3
SELECT * FROM Products
		WHERE Price < (SELECT MIN(Price) FROM Products
											 WHERE ProductName = 'Apple');

--������� ������, ������� ����� ������ ������ ������ ������ �������� Apple
SELECT * FROM Products
		WHERE Price < ANY(SELECT Price FROM Products WHERE Manufacturer = 'Apple');
--The Same
SELECT * FROM Products
		WHERE Price < (SELECT MAX(Price) FROM Products WHERE Manufacturer = 'Apple');

--��������� ��� ������������ �������

--��������� ���������� ����� ������������ ��������� ������� � �������.
--������� ��� ������ � ������� � ��� ���������� � �������� ������
SELECT *,
	(SELECT ProductName FROM Products WHERE Id = Orders.Productid ) AS Product
	 FROM Orders;

--			INSERT
--� ������� INSERT ���������� ����� ����������� ��� ����������� ��������,
-- ������� ����������� � ���� �� ��������:
INSERT INTO Orders(Productid, CustomersId, CreatedAt, ProductCount, Price) VALUES(
(SELECT Id FROM Products WHERE ProductName='Galaxy S8'),
(SELECT Id FROM Customers WHERE FirstName = 'Tom'),
'2017-11-12',
2,
(SELECT Price FROM Products WHERE ProductName = 'Galaxy S8')
);

--			UPDATE
--� UPDATE ���������� �����������:
--� �������� ���������������� �������� ����� ��������� SET
--��� ����� ������� � ��������� WHERE

--�������� ���������� ��������� ������� �� 2 � ��� �������, ��� ���������� ��m.
UPDATE Orders
		SET ProductCount = ProductCount + 2 
		WHERE CustomersId = (SELECT Id FROM Customers WHERE FirstName = 'Tom');

--��������� ��� ������ ���� ������, ���������� � ���������� ����������
UPDATE Orders
		SET Price = (SELECT Price FROM Products WHERE Id = Orders.Productid)+2000
		WHERE Id = 1;

--			DELETE
--������ ��� ������ �� Galaxy S8, ������� ������ Bob
DELETE FROM Orders 
		WHERE Productid = (SELECT Id FROM Products WHERE ProductName = 'Galaxy S8')
		AND CustomersId = (SELECT Id FROM Customers WHERE FirstName = 'Bob');
