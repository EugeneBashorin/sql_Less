USE productDb;
--IN =>	allows to define a set of values ​​that columns should have
SELECT * FROM Products
		WHERE Manufacturer IN('Sumsung','Xiaomi','Huawei');

--THE SAME BUT with OR
 SELECT * FROM Products
		WHERE Manufacturer = 'Sumsung'
		OR Manufacturer = 'Xiaomi'
		OR Manufacturer = 'Huawei';

--BETWEEN
SELECT * FROM Products
		WHERE Price BETWEEN 10000 AND 20000;

SELECT * FROM Products
		WHERE Price NOT BETWEEN 10000 AND 20000;

--LIKE  => for define string template/ regular expression
--	%	- matches any substring that can have any number of characters, a substring may not contain a single character
--	_	- any single character
--	[]	- matches one character in brackets
--	[-]	- matches one character from a specified range
--	[^]	- соответствует одному символу, который не указан после символа ^
SELECT * FROM Products
		WHERE ProductName LIKE'iPhone[6-8]%'