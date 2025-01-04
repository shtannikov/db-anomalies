-- @conn postgres-anomalies

begin isolation level repeatable read;

	select
		'State before updates' as comment,
		a.id,
		a.amount
	from accounts a
	where a.client = 'bob';

	select pg_sleep(10);

	-- Version management: a snapshot with record versions created before the transaction started
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

	select
		'State after updates in both tx_1 and tx_2' as comment,
		a.id,
		a.amount
	from accounts a
	where a.client = 'bob';

	select 'Do not forget to restore the DB before switching to next scenarios (__restore/postgres.sql)' as reminder;

commit;