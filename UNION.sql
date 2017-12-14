--UNION 
--Оператор UNION подобно inner join или outer join позволяет соединить две таблицы.
--в отличие от inner/outer join объединения соединяют не столбцы разных таблиц, а два однотипных набора в один
--		SELECT_выражение1
--			UNION [ALL] SELECT_выражение2
--			[UNION [ALL] SELECT_выражениеN]
--Если оба объединяемых набора содержат в строках идентичные значения, то при объединении повторяющиеся строки удаляются
--ALL Если необходимо при объединении сохранить все, в том числе повторяющиеся строки, то для этого необходимо использовать оператор ALL 
--Объединять выборки можно и из одной и той же таблицы. пример: в зависимости от суммы на счете клиента надо начислять ему определенные проценты

USE test_usersdb;
--выберем сразу всех клиентов банка и его сотрудников из обеих таблиц
SELECT FirstName, LastName 
		FROM Customers
		UNION SELECT FirstName, LastName FROM Employees;

SELECT FirstName + ' ' + LastName AS FULLNAME
		FROM Customers
		UNION SELECT FirstName + ' ' + LastName AS Employee_Name
		FROM Employees
		ORDER BY FULLNAME DESC;

		--IMPORTANT
--IMPORTANT Если в одной выборке больше столбцов, чем в другой, то они не смогут быть объединены
--SELECT FirstName, LastName, AccountSum	-- <=  3 COLUMN ERROR
--		FROM Customers
--		UNION SELECT FirstName, LastName	-- <=  2 COLUMN ERROR
--		FROM Employees;

		--IMPORTANT
--IMPORTANT соответствующие столбцы должны соответствовать по типу. следующий пример завершится с ошибкой из-за не соответствия по типу данных
--SELECT FirstName, LastName			-- <=  COLUMNS NVARCHAR(50) / NVARCHAR(50) ERROR
--		FROM Customers
--		UNION SELECT Id, LastName	-- <=  COLUMNS INT / NVARCHAR(50) ERROR
--		FROM Employees;

--UNION ALL
SELECT FirstName, LastName FROM Customers
		UNION ALL SELECT FirstName, LastName FROM Employees;

--В зависимости от суммы на счете клиента нам надо начислять ему определенные проценты
SELECT FirstName, LastName, AccountSum, AccountSum + AccountSum * 0.1 AS TotalSum 
			FROM Customers WHERE AccountSum < 3000
			UNION SELECT FirstName, LastName,AccountSum , AccountSum + AccountSum * 0.3 AS TotalSum 
			FROM  Customers WHERE AccountSum > 3000;