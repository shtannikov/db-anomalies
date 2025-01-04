-- @conn postgres-anomalies

delete from accounts;

insert into accounts
values
  (1, '1001', 'alice', 1000.00),
  (2, '2001', 'bob', 100.00),
  (3, '2002', 'bob', 900.00);

select 'PostgreSQL Database is restored!' AS result;