create table accounts(
  id integer primary key,
  number text unique,
  client text,
  amount numeric
);

insert into accounts
values
  (1, '1001', 'alice', 1000.00),
  (2, '2001', 'bob', 100.00),
  (3, '2002', 'bob', 900.00);