--AVG'only numb'/SUM'only numb'/MIN/MAX/COUNT(находит количество строк в запросе)
USE productDb;

SELECT AVG(Price) AS Average_Price FROM Products;

SELECT AVG(Price) AS Average_Price_by_Apple FROM Products
			WHERE Manufacturer = 'Apple';

SELECT AVG(Price * ProductCount) AS Average_Price_for_All_Items FROM Products;

--COUNT-calculates the number of rows for a particular column, rows with null value are ignored
SELECT COUNT(ProductName) FROM Products;

SELECT SUM(Price * ProductCount) FROM Products;

--для вычисления только над уникальных значений, исключив из набора значений повторяющиеся данные DISTINCT;
SELECT AVG(DISTINCT ProductCount) FROM Products;

SELECT AVG(Price) AS Average_Price,
		MIN(Price) AS MIN_Price,
		MAX(Price) AS MAX_Price,
		SUM(Price) AS TOTAL_SUM
		FROM Products;