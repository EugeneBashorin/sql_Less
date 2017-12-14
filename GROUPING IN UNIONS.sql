--����������� � �����������
USE productDb;
--������� ��� ������� ������������ ���������� �������, ������� �� ������
SELECT FirstName, COUNT(Orders.Id)
			FROM Customers
			INNER JOIN Orders ON Orders.CustomersId = Customers.Id
			GROUP BY Customers.Id, Customers.FirstName;

--To ADD customers without orders use OUTER JOIN
SELECT FirstName, COUNT(Orders.Id)
			FROM Customers
			LEFT OUTER JOIN Orders ON Orders.CustomersId = Customers.Id
			GROUP BY Customers.Id, Customers.FirstName;

--������� ������ � ����� ������ ��������� �������
SELECT Products.ProductName, Products.Manufacturer, SUM(Orders.Price * Orders.ProductCount) AS UNITS
							FROM Products
							LEFT OUTER JOIN Orders ON Orders.Productid = Products.Id
							GROUP BY Products.Id, Products.ProductName, Products.Manufacturer;