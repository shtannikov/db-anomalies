BEGIN TRANSACTION;

	-- Lock state: exclusive lock acquired
	-- The result: 1000 -> 800
    UPDATE Accounts
    SET Amount = Amount - 200
    WHERE Id = 1;

COMMIT;