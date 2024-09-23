begin;

	-- Version management: snapshot with initial version is created,
	--							but it will be removed right after the statement is executed
	-- The result: 100
	select a.id, a.amount from accounts a
	where a.id = 2;

	select pg_sleep(10);

	-- Version management: snapshot with new version is created, since tx_2 is already completed
	-- The result: 1000 (updated value)
	select a.id, a.amount from accounts a
	where a.id = 3;

commit;