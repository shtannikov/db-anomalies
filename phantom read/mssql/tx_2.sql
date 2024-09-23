BEGIN TRANSACTION;

	INSERT INTO Accounts (Number, Client, Amount)
	VALUES (2003, 'bob', 500.00);

COMMIT;