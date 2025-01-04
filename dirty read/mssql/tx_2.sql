-- @conn mssql-anomalies

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

BEGIN TRANSACTION;

	-- Lock state: no lock required, so exclusive lock in tx_1 doesn't block tx_2
	-- The result: 1100 returned, even though tx_1 is not committed
   	SELECT
		'State after the concurrent update in tx_1 that is not committed' as Comment,
		a.Id,
		a.Amount
	From Accounts a
	WHERE a.Id = 1;

COMMIT;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT
	'State after tx_1 rollback' as Comment,
	a.Id,
	a.Amount
From Accounts a
WHERE a.Id = 1;