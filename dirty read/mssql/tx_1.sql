BEGIN TRANSACTION;

	-- Lock state: exclusive lock acquired
	-- The result: 1000 -> 1100
    UPDATE Accounts
    SET Amount = Amount + 100
    WHERE Id = 1;

    WAITFOR DELAY '00:00:10';

ROLLBACK;