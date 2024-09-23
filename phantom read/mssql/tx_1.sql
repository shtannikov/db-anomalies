SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

BEGIN TRANSACTION;

	-- Lock state: shared lock acquired for all existing Bob's accounts until the end of the transaction,
	--														but it doesn't block insertion of new entities
	-- The result: 2
   	SELECT COUNT(*) From Accounts a
	WHERE a.Client = 'bob';

    WAITFOR DELAY '00:00:10';

   	-- Lock state: the lock from the first select is still active, but it didn't affect tx_2 with its insertion
	-- The result: 3
    SELECT COUNT(*) From Accounts a
	WHERE a.Client = 'bob';

ROLLBACK;