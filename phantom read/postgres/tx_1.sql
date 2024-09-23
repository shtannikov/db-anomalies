begin;

	-- Version management: snapshot with all existing Bob's accounts is created,
	--							but it will be removed right after the statement is executed
	-- The result: 2
	select count(*) from accounts a
	where a.client = 'bob';

	select pg_sleep(10);

	-- Version management: new snapshot with all existing Bob's accounts is created,
	--							and it has +1 account now, since tx_2 is already completed
	-- The result: 3
	select count(*) from accounts a
	where a.client = 'bob';

end;