--OUTER JOIN
--���������� ��� ������ ����� ��� ���� ������, ������� ��������� � ����������
--LEFT: ������� ����� ��������� ��� ������ �� ������ ��� ����� �������
--RIGHT: ������� ����� ��������� ��� ������ �� ������ ��� ������ �������
--FULL: ������� ����� ��������� ��� ������ �� ����� ������
--Cross: ������� ����� �����, ��� ������ ������ �� ����� ������� ����������� � ������ ������� �� ������ �������

--SELECT ������� FROM �������1
    --{LEFT|RIGHT|FULL} [OUTER] JOIN �������2 ON �������1
    --[{LEFT|RIGHT|FULL} [OUTER] JOIN �������3 ON �������2]...

--�������� ������� Orders � Customers
SELECT FirstName, CreatedAt, ProductCount, Price, Productid		--=>LEFT OUTER JOIN
					FROM Orders
					LEFT OUTER JOIN Customers
					ON Orders.CustomersId = Customers.Id;

SELECT FirstName, CreatedAt, ProductCount, Price, Productid		--=>RIGHT OUTER JOIN
					FROM Orders
					RIGHT OUTER JOIN Customers
					ON Orders.CustomersId = Customers.Id;

SELECT FirstName, CreatedAt, ProductCount, Price, Productid		--=>FULL OUTER JOIN
					FROM Orders
					FULL OUTER JOIN Customers
					ON Orders.CustomersId = Customers.Id;

SELECT FirstName, CreatedAt, ProductCount, Price, Productid		--=>INNER JOIN
					FROM Orders
					INNER JOIN Customers
					ON Orders.CustomersId = Customers.Id;

--���������� ������������� ���������� ��� ���������� � ������� ���������� � ������������� � �������
SELECT Customers.FirstName, Orders.CreatedAt, Products.ProductName, Products.Manufacturer
			FROM Orders
			LEFT OUTER JOIN Customers ON Orders.CustomersId = Customers.Id
			LEFT OUTER JOIN Products ON Orders.Productid = Products.Id
			WHERE Products.Price > 30000
			ORDER BY Orders.CreatedAt;

--������� ���� ������������� �� Customers, � ������� ��� ������� � ������� Orders:
SELECT FirstName FROM Customers
			LEFT OUTER JOIN Orders ON Customers.Id = Orders.CustomersId
			WHERE Orders.CustomersId IS NULL;

--COMBINE INNER JOIN / OUTER JOIN
SELECT Customers.FirstName, Orders.CreatedAt, Products.ProductName, Products.Manufacturer, Products.Price
							FROM Orders 
							JOIN Products ON Orders.ProductId = Products.Id AND Products.Price < 40000
							LEFT JOIN Customers ON Orders.CustomersId = Customers.Id
							ORDER BY Orders.CreatedAt;

--Cross Join
-- ������� ������� Orders � ������� ����������� Customers
SELECT * FROM Orders CROSS JOIN Customers;



