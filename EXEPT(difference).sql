--EXEPT
--�������� EXCEPT ��������� ����� �������� ���� �������, ������ ������� ���� � ������ �������, �� ������� ��� �� ������

--SELECT_���������1	EXCEPT SELECT_���������2

USE test_usersdb;

--����� ���� �������� �����, ������� �� �������� ��� ������������
SELECT FirstName, LastName FROM Customers
				EXCEPT SELECT FirstName, LastName FROM Employees;

--�������� ���� ����������� �����, ������� �� �������� ��� ���������
SELECT FirstName, LastName FROM Employees
				EXCEPT SELECT FirstName, LastName FROM Customers;