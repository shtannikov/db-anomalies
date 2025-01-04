-- @conn mssql-anomalies

DELETE FROM Accounts;

INSERT INTO Accounts 
VALUES
  (1, '1001', 'alice', 1000.00),
  (2, '2001', 'bob', 100.00),
  (3, '2002', 'bob', 900.00);

SELECT 'MS SQL Database is restored!' AS Result;