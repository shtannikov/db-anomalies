begin;

	update accounts
	set amount = amount - 100
	where id = 2;
	
	update accounts
	set amount = amount + 100
	where id = 3;

commit;