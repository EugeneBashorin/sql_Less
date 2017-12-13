--Соединение таблиц.Неявное соединение таблиц
USE productDb;

SELECT * FROM Orders, Customers;

SELECT * FROM Orders,Customers WHERE Orders.CustomersId = Customers.Id;

--По трем таблицам Orders,Customers,Proucts получим все заказы и добавим информацию по клиенту и связанному товару
SELECT Customers.FirstName, Products.ProductName, Orders.CreatedAt
						FROM Customers, Products, Orders
						WHERE Orders.CustomersId = Customers.Id  AND Orders.Productid = Products.Id;

--The same but shorter
SELECT C.FirstName, P.ProductName, O.CreatedAt
							FROM Customers AS C, Products AS P, Orders AS O
							WHERE O.CustomersId = C.Id AND O.Productid = P.Id;

-- FOR ALL VALUES USE =>	C.*, P.ProductName, O.* FROM ...
