-- @conn mssql-anomalies

BEGIN TRANSACTION;

	INSERT INTO Accounts (Id, Number, Client, Amount)
	VALUES (4, 2003, 'bob', 500.00);

COMMIT;