BEGIN TRANSACTION;

	-- Lock state: shared lock acquired, but it will be released right after the statement is executed
	-- The result: 100
   	SELECT a.Id, a.Amount From Accounts a
	WHERE a.Id = 2;

    WAITFOR DELAY '00:00:10';

   	-- Lock state: shared lock acquired, but it has no effect since tx_2 is already completed
	-- The result: 1000 (updated value)
    SELECT a.Id, a.Amount From Accounts a
	WHERE a.Id = 3;

ROLLBACK;