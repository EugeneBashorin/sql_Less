--INNER JOIN - ƒл€ €вного соединени€ данных из двух таблиц примен€етс€ оператор JOIN.
--¬ большинстве случаев дл€ соединени€ примен€етс€ первичный ключ главной таблицы и внешний ключ зависимой таблицы
-- SELECT столбцы FROM таблица1
--			[INNER] JOIN таблица2 ON условие1
--			[[INNER] JOIN таблица3 ON условие2]

USE productDb;
--выберем все заказы и добавим к ним информацию о товарах;
SELECT Orders.CreatedAt, Orders.ProductCount, Products.ProductName
							FROM Orders
							INNER JOIN Products ON Products.Id = Orders.Productid;

--THE SAME BUT SHORTER
SELECT O.CreatedAt, O.ProductCount, P.ProductName
				FROM Orders AS O
				INNER JOIN Products AS P
						ON P.Id = O.Productid;

--добавим к заказу информацию о покупателе из таблицы Customers
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

--ѕри использовании оператора JOIN следует учитывать, что процесс соединени€ таблиц может быть ресурсоемким,
--следует соедин€ть только те таблицы, данные из которых действительно необходимы.
-- „ем больше таблиц соедин€етс€, тем больше снижаетс€ производительность.
