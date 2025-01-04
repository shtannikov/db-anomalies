-- @conn postgres-anomalies

begin;

	-- Version management: snapshot with initial version is created,
	--							but it will be removed right after the statement is executed
	-- The result: 100
	select
		'State before the concurrent update in tx_2' as comment,
		a.id,
		a.amount
	from accounts a
	where a.id = 2 or a.id = 3;

	select pg_sleep(10);

	-- Version management: snapshot with new version is created, since tx_2 is already completed
	-- The result: 1000 (updated value)
	select
		'State after the concurrent update in tx_2' as comment,
		a.id,
		a.amount
	from accounts a
	where a.id = 2 or a.id = 3;

	select 'Do not forget to restore the DB before switching to next scenarios (__restore/postgres.sql)' as reminder;

commit;