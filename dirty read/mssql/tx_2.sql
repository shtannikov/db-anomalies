SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

BEGIN TRANSACTION;

	-- Lock state: no lock required, so exclusive lock in tx_1 doesn't block tx_2
	-- The result: 1100 returned, even though tx_1 is not committed
   	SELECT a.Id, a.Amount From Accounts a
	WHERE a.Id = 1;

COMMIT;