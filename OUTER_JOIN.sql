--OUTER JOIN
--возвращает все строки одной или двух таблиц, которые участвуют в соединении
--LEFT: выборка будет содержать все строки из первой или левой таблицы
--RIGHT: выборка будет содержать все строки из второй или правой таблицы
--FULL: выборка будет содержать все строки из обоих таблиц
--Cross: создает набор строк, где каждая строка из одной таблицы соединяется с каждой строкой из второй таблицы

--SELECT столбцы FROM таблица1
    --{LEFT|RIGHT|FULL} [OUTER] JOIN таблица2 ON условие1
    --[{LEFT|RIGHT|FULL} [OUTER] JOIN таблица3 ON условие2]...

--соединим таблицы Orders и Customers
SELECT FirstName, CreatedAt, ProductCount, Price, Productid		--=>LEFT OUTER JOIN
					FROM Orders
					LEFT OUTER JOIN Customers
					ON Orders.CustomersId = Customers.Id;

SELECT FirstName, CreatedAt, ProductCount, Price, Productid		--=>RIGHT OUTER JOIN
					FROM Orders
					RIGHT OUTER JOIN Customers
					ON Orders.CustomersId = Customers.Id;

SELECT FirstName, CreatedAt, ProductCount, Price, Productid		--=>FULL OUTER JOIN
					FROM Orders
					FULL OUTER JOIN Customers
					ON Orders.CustomersId = Customers.Id;

SELECT FirstName, CreatedAt, ProductCount, Price, Productid		--=>INNER JOIN
					FROM Orders
					INNER JOIN Customers
					ON Orders.CustomersId = Customers.Id;

--Используем левостороннее соединение для добавления к заказам информации о пользователях и товарах
SELECT Customers.FirstName, Orders.CreatedAt, Products.ProductName, Products.Manufacturer
			FROM Orders
			LEFT OUTER JOIN Customers ON Orders.CustomersId = Customers.Id
			LEFT OUTER JOIN Products ON Orders.Productid = Products.Id
			WHERE Products.Price > 30000
			ORDER BY Orders.CreatedAt;

--выберем всех пользователей из Customers, у которых нет заказов в таблице Orders:
SELECT FirstName FROM Customers
			LEFT OUTER JOIN Orders ON Customers.Id = Orders.CustomersId
			WHERE Orders.CustomersId IS NULL;

--COMBINE INNER JOIN / OUTER JOIN
SELECT Customers.FirstName, Orders.CreatedAt, Products.ProductName, Products.Manufacturer, Products.Price
							FROM Orders 
							JOIN Products ON Orders.ProductId = Products.Id AND Products.Price < 40000
							LEFT JOIN Customers ON Orders.CustomersId = Customers.Id
							ORDER BY Orders.CreatedAt;

--Cross Join
-- таблицу заказов Orders и таблицу покупателей Customers
SELECT * FROM Orders CROSS JOIN Customers;



