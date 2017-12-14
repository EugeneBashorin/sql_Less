--EXEPT
--Оператор EXCEPT позволяет найти разность двух выборок, строки которые есть в первой выборке, но которых нет во второй

--SELECT_выражение1	EXCEPT SELECT_выражение2

USE test_usersdb;

--найти всех клиентов банка, которые не являются его сотрудниками
SELECT FirstName, LastName FROM Customers
				EXCEPT SELECT FirstName, LastName FROM Employees;

--получить всех сотрудников банка, которые не являются его клиентами
SELECT FirstName, LastName FROM Employees
				EXCEPT SELECT FirstName, LastName FROM Customers;