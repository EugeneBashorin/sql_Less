--Подзапросы в основных командах SQL

--В SELECT можем вводить подзапросы способами:
--Использовать в условии в выражении WHERE
--Использовать в условии в выражении HAVING
--Использовать в качестве таблицы для выборки в выражении FROM
--Использовать в качестве спецификации столбца в выражении SELECT
USE productDb;
--получим все товары, у которых цена выше средней
SELECT * FROM Products
		WHERE Price > (SELECT AVG(Price) FROM Products);

--выберем всех покупателей из таблицы Customers, у которых нет заказов в таблице Orders
SELECT * FROM Customers
		WHERE Id NOT IN (SELECT CustomersId FROM Orders);

		--Набор значений
--в операторах сравнения подзапросы должны возвращать одно скалярное значение.
--Чтобы при использовании в операторах сравнения подзапрос мог возвращать набор значений,
-- перед ним необходимо использовать один из операторов: ALL, SOME, ANY.
--ALL => условие в операции сравнения должно быть верно для всех значений, которые возвращаются подзапросом
--ANY/SOME =>условие в операции сравнения должно быть истинным для хотя бы одного из значений,
		-- возвращаемых подзапросом. По действию аналогичны, можно применять любое из них

--найдем все товары, цена которых меньше чем у любого товара фирмы Apple
SELECT * FROM Products
		WHERE Price < ALL(SELECT MIN(Price) FROM Products
											 WHERE ProductName = 'Apple');
--WHERE Price < val1 AND Price < val2 AND Price < val3
SELECT * FROM Products
		WHERE Price < (SELECT MIN(Price) FROM Products
											 WHERE ProductName = 'Apple');

--получим товары, которые стоят меньше самого дорого товара компании Apple
SELECT * FROM Products
		WHERE Price < ANY(SELECT Price FROM Products WHERE Manufacturer = 'Apple');
--The Same
SELECT * FROM Products
		WHERE Price < (SELECT MAX(Price) FROM Products WHERE Manufacturer = 'Apple');

--Подзапрос как спецификация столбца

--Результат подзапроса может представлять отдельный столбец в выборке.
--выберем все заказы и добавим к ним информацию о названии товара
SELECT *,
	(SELECT ProductName FROM Products WHERE Id = Orders.Productid ) AS Product
	 FROM Orders;

--			INSERT
--В команде INSERT подзапросы могут применяться для определения значения,
-- которое вставляется в один из столбцов:
INSERT INTO Orders(Productid, CustomersId, CreatedAt, ProductCount, Price) VALUES(
(SELECT Id FROM Products WHERE ProductName='Galaxy S8'),
(SELECT Id FROM Customers WHERE FirstName = 'Tom'),
'2017-11-12',
2,
(SELECT Price FROM Products WHERE ProductName = 'Galaxy S8')
);

--			UPDATE
--В UPDATE подзапросы применяются:
--В качестве устанавливаемого значения после оператора SET
--Как часть условия в выражении WHERE

--увеличим количество купленных товаров на 2 в тех заказах, где покупатель Тоm.
UPDATE Orders
		SET ProductCount = ProductCount + 2 
		WHERE CustomersId = (SELECT Id FROM Customers WHERE FirstName = 'Tom');

--установим для заказа цену товара, полученную в результате подзапроса
UPDATE Orders
		SET Price = (SELECT Price FROM Products WHERE Id = Orders.Productid)+2000
		WHERE Id = 1;

--			DELETE
--удалим все заказы на Galaxy S8, которые сделал Bob
DELETE FROM Orders 
		WHERE Productid = (SELECT Id FROM Products WHERE ProductName = 'Galaxy S8')
		AND CustomersId = (SELECT Id FROM Customers WHERE FirstName = 'Bob');
