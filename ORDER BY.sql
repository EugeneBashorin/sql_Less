USE productDb;
SELECT * FROM Products ORDER BY ProductName;

SELECT ProductName, ProductCount * Price AS TotalSum -- Order By with NickName of column 
		FROM Products ORDER BY TotalSum;

SELECT ProductName FROM Products
		ORDER BY ProductName DESC;

SELECT ProductName, Price FROM Products
		ORDER BY Price ASC;

SELECT ProductName, Price, Manufacturer FROM Products
		ORDER BY Manufacturer ASC, ProductName DESC;

SELECT ProductName, Price, ProductCount FROM Products
		ORDER BY ProductCount * Price;					--	=>	ORDER BY Expression