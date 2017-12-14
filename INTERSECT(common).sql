--INTERSECT
--позволяет найти общие строки для двух выборок, то есть данный оператор выполняет операцию пересечения множеств

--SELECT_выражение1	INTERSECT SELECT_выражение2

USE test_usersdb;
--Найти всех сотрудников банка, которые одновременно являются его клиентами. То есть найти общие элементы двух выборок
SELECT FirstName, LastName FROM Employees
		INTERSECT SELECT FirstName, LastName FROM Customers;
