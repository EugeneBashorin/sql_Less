--WHERE
--  = comparison 
--  < > => !=
--  < and !< LESS & NOT LESS
--  > and !> MORE & NOT MORE
--  <=  >=
USE productDb;

SELECT * FROM Products
		WHERE Manufacturer = 'Apple'; -- The same 'APPLE', 'apple'

SELECT * FROM Products
		WHERE Price > 20000;

--AND/OR/NOT  IF use AND/OR/NOT in common expression, then FIRST NOT express SECOND AND express, THIRD OR express
SELECT * FROM Products
		WHERE Manufacturer = 'APPLE' AND Price > 22000;

SELECT * FROM Products
		WHERE Manufacturer = 'SUMSUNG' OR Price < 14000;

SELECT * FROM Products
		WHERE NOT Manufacturer = 'APPLE';

SELECT * FROM Products
		WHERE Manufacturer <> 'APPLE'; --THE SAME AS PREVIOS

SELECT * FROM Products
		WHERE Manufacturer = 'APPLE' OR Price > 25000 AND ProductCount > 2; -- FIRST OPERATION Price > 25000 AND ProductCount > 2 SECOND OR

SELECT * FROM Products
		WHERE (Manufacturer = 'APPLE' OR Price > 25000) AND ProductCount > 2; -- FIRST OPERATION Manufacturer = 'APPLE' OR Price > 25000 SECOND AND

--IS NULL	SOME COLUMNS HAVE VALUE == NULL, IT ISN'T EQUAL EMPTY ROW

SELECT * FROM Products
	WHERE ProductCount IS NULL;
	
SELECT * FROM Products
	WHERE ProductCount IS NOT NULL; 