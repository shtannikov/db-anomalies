begin isolation level repeatable read;

	select pg_sleep(10);

	-- Version management: snapshot with all existing Bob's accounts is created
	-- Lock state: exclusive lock acquired for the record with Id=2, but it has no effect since tx_2 is already completed.
	--							For the rest of records no lock is required as the snapshot is used, and the snapshot leads to ignoring of tx_2 changes
	-- The result: $-500 in account with Id=2
	update accounts
	set amount = amount - 600
	where id = 2
		and exists (
			select 1 from accounts a
			where a.client = 'bob'
			group by a.client
			having sum(amount) >= 600
		);

commit;