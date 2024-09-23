begin;

	-- Version management: initial version is marked as dead and new version is created
	-- The result: 1000 -> 800
	update accounts
	set amount = amount - 200
	where id = 1;

commit;
