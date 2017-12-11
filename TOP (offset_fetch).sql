USE productDb;

SELECT TOP 4 ProductName FROM Products;	-- => The first 4 lines

SELECT TOP 30 PERCENT ProductName FROM Products; -- => 30% OF ProductNameS' ROWS

--OFFSET FETCH => USE ONLY AFTER ORDER BY
--ORDER BY expression 
			--OFFSET смещение_относительно_начала {ROW|ROWS}
			--[FETCH {FIRST|NEXT} количество_извлекаемых_строк {ROW|ROWS} ONLY]
SELECT * FROM Products
		ORDER BY Id
		OFFSET 2 ROWS; -- => miss 2 rows Id 3, 4, 5, ...

SELECT * FROM Products
		ORDER BY Id
		OFFSET 2 ROWS 
		FETCH NEXT 3 ROWS ONLY;