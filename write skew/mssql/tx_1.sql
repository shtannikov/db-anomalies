SET TRANSACTION ISOLATION LEVEL SNAPSHOT;

BEGIN TRANSACTION;

	-- Lock state: no lock acquired, but snapshot created
	-- The result: $100 in account with Id=2
	-- Important to note: without this SELECT statement Write Skew anomaly won't occur!
	--							MS SQL has an interesting implementation of UPDATE conditions for SNAPSHOT isolation.
	SELECT a.Id, a.Amount FROM Accounts a
	WHERE a.Client = 'bob';

	WAITFOR DELAY '00:00:10';

	-- Lock state: exclusive lock acquired for the record with Id=2, but it has no effect since tx_2 is already completed.
	--							For the rest of records no lock is required as the snapshot is used, and the snapshot leads to ignoring of tx_2 changes
	-- The result: $-500 in account with Id=2
	UPDATE Accounts 
	SET Amount = Amount - 600
	WHERE Id = 2
		AND EXISTS (
			SELECT 1 FROM Accounts a
			WHERE a.Client = 'bob'
			GROUP BY a.Client
			HAVING SUM(amount) >= 600
		);
	
COMMIT;