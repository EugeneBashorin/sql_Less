--INTERSECT
--��������� ����� ����� ������ ��� ���� �������, �� ���� ������ �������� ��������� �������� ����������� ��������

--SELECT_���������1	INTERSECT SELECT_���������2

USE test_usersdb;
--����� ���� ����������� �����, ������� ������������ �������� ��� ���������. �� ���� ����� ����� �������� ���� �������
SELECT FirstName, LastName FROM Employees
		INTERSECT SELECT FirstName, LastName FROM Customers;
