begin;

	update accounts
	set amount = amount - 600
	where id = 3
		and exists (
			select 1 from accounts a
			where a.client = 'bob'
			group by a.client
			having sum(amount) >= 600
		);

commit;