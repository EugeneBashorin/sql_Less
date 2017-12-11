USE usersdb;

Create table Orders(
Id INT Primary Key Identity,
CustomerId INT,
CreatedAt Date,
Foreign Key(CustomerId) References Customers (Id)
);