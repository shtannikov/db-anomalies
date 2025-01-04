-- @conn mssql-anomalies

BEGIN TRANSACTION;

	-- Lock state: shared lock acquired, but it will be released right after the statement is executed
	-- The result: 1000
   	SELECT 
		'State before the concurrent update in tx_2' as Comment,
		a.Id,
		a.Amount
	From Accounts a
	WHERE a.Id = 1;

    WAITFOR DELAY '00:00:10';

   	-- Lock state: shared lock acquired, but it has no effect since tx_2 is already completed
	-- The result: 800 (updated value)
   	SELECT 
		'State after the concurrent update in tx_2' as Comment,
		a.Id,
		a.Amount
	From Accounts a
	WHERE a.Id = 1;

	SELECT 'Do not forget to restore the DB before switching to next scenarios (__restore/mssql.sql)' as Reminder;

COMMIT;