-- @conn postgres-anomalies

begin;

	insert into accounts (id, "number", client, amount)
	values (4, 2003, 'bob', 500.00);

commit;