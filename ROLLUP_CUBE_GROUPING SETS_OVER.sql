--ROLLUP - добавляет суммирующую строку в результирующий набор
--CUBE - похож на ROLLUP за тем исключением, что CUBE добавляет суммирующие строки для каждой комбинации групп.
--GROUPING SETS - аналогично ROLLUP и CUBE добавляет суммирующую строку для групп. Но при этом он не включает сами группам
--OVER - позволяет суммировать данные, при этом возвращая те строки, которые использовались для получения суммированных данных
USE productDb;


SELECT Manufacturer, COUNT(*) AS Model, SUM(ProductCount) AS Units
			FROM Products
			GROUP BY Manufacturer WITH ROLLUP; --GROUP BY ROLLUP(Manufacturer)The same
--   Manufacturer Model Units
-- 1	Apple		2	3
-- 2	OnePlus		1	6
-- 3	Samsung		2	3
-- 4	Xiaomi		1	0
-- 5	NULL		6	12

SELECT Manufacturer, COUNT(*) AS Model, SUM(ProductCount) AS Units FROM Products
		GROUP BY Manufacturer,ProductCount WITH ROLLUP;
--   Manufacturer Model Units
--1  Apple			1	0
--2  Apple			1	3
--3  Apple			2	3	<= TOTAL
--4  OnePlus		1	6
--5  OnePlus		1	6	<= TOTAL
--6  Samsung		1	1
--7  Samsung		1	2
--8  Samsung		2	3	<= TOTAL
--9  Xiaomi			1	0
--10 Xiaomi			1	0	<= TOTAL
-- 		NULL		6	12	<= TOTAL


SELECT Manufacturer, COUNT(*) AS Model, SUM(ProductCount) AS Units FROM Products 
		GROUP BY Manufacturer, ProductCount WITH CUBE;
--   Manufacturer Model Units
--1  Samsung		1	1
--2  NULL			1	1	<= TOTAL
--3  Samsung		1	2
--4  NULL			1	2	<= TOTAL
--5  Apple			1	3
--6  NULL			1	3	<= TOTAL
--7  OnePlus		1	6
--8  NULL			1	6	<= TOTAL
--9  NULL			6	12	<= TOTAL
--10 Apple			2	3
--11 OnePlus		1	6
--12 Samsung		2	3
--13 Xiaomi			1	0

SELECT Manufacturer, COUNT(*) AS Model, SUM(ProductCount) AS Units FROM Products
		GROUP BY GROUPING SETS(Manufacturer,ProductCount);
--   Manufacturer Model Units
--1		NULL		2	0	<= TOTAL
--2		NULL		1	1	<= TOTAL
--3		NULL		1	2	<= TOTAL
--4		NULL		1	3	<= TOTAL
--5		NULL		1	6	<= TOTAL
--6		Apple		2	3	
--7		OnePlus		1	6
--8		Samsung		2	3
--9		Xiaomi		1	0

--Add 
SELECT Manufacturer, COUNT(*) AS Model, SUM(ProductCount) AS Units FROM Products
		GROUP BY GROUPING SETS(ROLLUP(Manufacturer), ProductCount);
--   Manufacturer Model Units
--1		NULL		2		0
--2		NULL		1		1
--3		NULL		1		2
--4		NULL		1		3
--5		NULL		1		6
--6		NULL		6		12 <= ROLLUP
--7		Apple		2		3
--8		OnePlus		1		6
--9		Samsung		2		3
--10	Xiaomi		1		0

SELECT Manufacturer, COUNT(*) AS Models, ProductCount, SUM(ProductCount) AS Units FROM Products
			GROUP BY GROUPING SETS((Manufacturer, ProductCount), ProductCount)

--количество моделей и общее количество товаров этих моделей по производителю
SELECT ProductName, Manufacturer, ProductCount,
		COUNT(*) OVER(PARTITION BY Manufacturer) AS Models,
		SUM(ProductCount) OVER (PARTITION BY Manufacturer) AS Units
		FROM Products;
--OVER ставится после агрегатной функции, затем в скобках идет выражение PARTITION BY и столбец, по которому выполняется группировка
--в данном случае мы выбираем название модели, производителя, количество единиц модели и добавляем к этому количество моделей для 
--данного производителя и общее количество единиц всех моделей производителя
