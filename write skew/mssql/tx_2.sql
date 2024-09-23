BEGIN TRANSACTION;

	UPDATE Accounts 
	SET Amount = Amount - 600
	WHERE Id = 3
		AND EXISTS (
			SELECT 1 FROM Accounts a
			WHERE a.Client = 'bob'
			GROUP BY a.Client
			HAVING SUM(amount) >= 600
		);

COMMIT;