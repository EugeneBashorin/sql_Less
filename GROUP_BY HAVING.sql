--GROUP BY-Specifies how rows will be grouped together 
--HAVING- Determines which groups will be included in the output,(it filters groups)

--WHERE ��� ���������� �����/ HAVING - ��� ���������� �����

--SELECT �������
--FROM �������
--[WHERE �������_����������_�����]
--[GROUP BY �������_���_�����������]
--[HAVING �������_����������_�����]
--[ORDER BY �������_���_����������]

--!!! GROUP BY ������ ���� ����� ��������� WHERE, �� �� ��������� ORDER BY!!!

USE productDb;
--count rows in column
SELECT Manufacturer, COUNT(*) AS ModelCount FROM Products
		GROUP BY Manufacturer;

--SELECT Manufacturer, COUNT(*) AS ModelsCount FROM Products	doesn't work because, expression doesn't consist GROUP BY

--group by quantity of goods
SELECT Manufacturer, ProductCount,COUNT(*) AS ModelsCount FROM Products
		GROUP BY Manufacturer, ProductCount;

SELECT Manufacturer, COUNT(*) AS ModelsCount FROM Products
		WHERE Price > 25000
		GROUP BY Manufacturer
		ORDER BY ModelsCount DESC;

--HAVING
--������ ��� ������ ������� �� ��������������, ��� ������� ���������� ����� 1 ������
SELECT Manufacturer,COUNT(*) AS ModelsCount
		FROM Products
		GROUP BY Manufacturer
		HAVING COUNT(*) > 1;

SELECT Manufacturer, COUNT(*) AS Models, SUM(ProductCount) AS Units FROM Products
		WHERE Price*ProductCount > 30000
		GROUP BY Manufacturer
		HAVING SUM(ProductCount)>2
		ORDER BY Units DESC;

SELECT * FROM Products;

