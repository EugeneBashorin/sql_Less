--GROUP BY-Specifies how rows will be grouped together 
--HAVING- Determines which groups will be included in the output,(it filters groups)

--WHERE для фильтрации строк/ HAVING - для фильтрации групп

--SELECT столбцы
--FROM таблица
--[WHERE условие_фильтрации_строк]
--[GROUP BY столбцы_для_группировки]
--[HAVING условие_фильтрации_групп]
--[ORDER BY столбцы_для_сортировки]

--!!! GROUP BY должно идти после выражения WHERE, но до выражения ORDER BY!!!

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
--найдем все группы товаров по производителям, для которых определено более 1 модели
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

