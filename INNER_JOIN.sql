--INNER JOIN - ��� ������ ���������� ������ �� ���� ������ ����������� �������� JOIN.
--� ����������� ������� ��� ���������� ����������� ��������� ���� ������� ������� � ������� ���� ��������� �������
-- SELECT ������� FROM �������1
--			[INNER] JOIN �������2 ON �������1
--			[[INNER] JOIN �������3 ON �������2]

USE productDb;
--������� ��� ������ � ������� � ��� ���������� � �������;
SELECT Orders.CreatedAt, Orders.ProductCount, Products.ProductName
							FROM Orders
							INNER JOIN Products ON Products.Id = Orders.Productid;

--THE SAME BUT SHORTER
SELECT O.CreatedAt, O.ProductCount, P.ProductName
				FROM Orders AS O
				INNER JOIN Products AS P
						ON P.Id = O.Productid;

--������� � ������ ���������� � ���������� �� ������� Customers
SELECT O.CreatedAt, C.FirstName, P.ProductName
				FROM Orders AS O
					INNER JOIN Products AS P
						ON P.Id = O.Productid
					INNER JOIN Customers AS C 
						ON C.Id = O.CustomersId;

SELECT O.CreatedAt, C.FirstName, P.ProductName
				FROM Orders AS O
					INNER JOIN Products AS P
						ON P.Id = O.Productid
					INNER JOIN Customers AS C 
						ON C.Id = O.CustomersId
					WHERE P.Price > 27000
					ORDER BY C.FirstName;

SELECT O.CreatedAt, C.FirstName, P.ProductName
				FROM Orders AS O
					INNER JOIN Products AS P
						ON P.Id = O.Productid AND P.Manufacturer = 'Apple'
					INNER JOIN Customers AS C 
						ON C.Id = O.CustomersId
					ORDER BY C.FirstName;

--��� ������������� ��������� JOIN ������� ���������, ��� ������� ���������� ������ ����� ���� ������������,
--������� ��������� ������ �� �������, ������ �� ������� ������������� ����������.
-- ��� ������ ������ �����������, ��� ������ ��������� ������������������.
