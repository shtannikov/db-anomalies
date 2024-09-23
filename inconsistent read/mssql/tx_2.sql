BEGIN TRANSACTION;

	-- Lock state: exclusive lock acquired
	-- The result: 100 -> 0
    UPDATE Accounts
    SET Amount = Amount - 100
    WHERE Id = 2;

   	-- Lock state: exclusive lock acquired
	-- The result: 900 -> 1000
    UPDATE Accounts
    SET Amount = Amount + 100
    WHERE Id = 3;

COMMIT;