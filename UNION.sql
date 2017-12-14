--UNION 
--�������� UNION ������� inner join ��� outer join ��������� ��������� ��� �������.
--� ������� �� inner/outer join ����������� ��������� �� ������� ������ ������, � ��� ���������� ������ � ����
--		SELECT_���������1
--			UNION [ALL] SELECT_���������2
--			[UNION [ALL] SELECT_���������N]
--���� ��� ������������ ������ �������� � ������� ���������� ��������, �� ��� ����������� ������������� ������ ���������
--ALL ���� ���������� ��� ����������� ��������� ���, � ��� ����� ������������� ������, �� ��� ����� ���������� ������������ �������� ALL 
--���������� ������� ����� � �� ����� � ��� �� �������. ������: � ����������� �� ����� �� ����� ������� ���� ��������� ��� ������������ ��������

USE test_usersdb;
--������� ����� ���� �������� ����� � ��� ����������� �� ����� ������
SELECT FirstName, LastName 
		FROM Customers
		UNION SELECT FirstName, LastName FROM Employees;

SELECT FirstName + ' ' + LastName AS FULLNAME
		FROM Customers
		UNION SELECT FirstName + ' ' + LastName AS Employee_Name
		FROM Employees
		ORDER BY FULLNAME DESC;

		--IMPORTANT
--IMPORTANT ���� � ����� ������� ������ ��������, ��� � ������, �� ��� �� ������ ���� ����������
--SELECT FirstName, LastName, AccountSum	-- <=  3 COLUMN ERROR
--		FROM Customers
--		UNION SELECT FirstName, LastName	-- <=  2 COLUMN ERROR
--		FROM Employees;

		--IMPORTANT
--IMPORTANT ��������������� ������� ������ ��������������� �� ����. ��������� ������ ���������� � ������� ��-�� �� ������������ �� ���� ������
--SELECT FirstName, LastName			-- <=  COLUMNS NVARCHAR(50) / NVARCHAR(50) ERROR
--		FROM Customers
--		UNION SELECT Id, LastName	-- <=  COLUMNS INT / NVARCHAR(50) ERROR
--		FROM Employees;

--UNION ALL
SELECT FirstName, LastName FROM Customers
		UNION ALL SELECT FirstName, LastName FROM Employees;

--� ����������� �� ����� �� ����� ������� ��� ���� ��������� ��� ������������ ��������
SELECT FirstName, LastName, AccountSum, AccountSum + AccountSum * 0.1 AS TotalSum 
			FROM Customers WHERE AccountSum < 3000
			UNION SELECT FirstName, LastName,AccountSum , AccountSum + AccountSum * 0.3 AS TotalSum 
			FROM  Customers WHERE AccountSum > 3000;