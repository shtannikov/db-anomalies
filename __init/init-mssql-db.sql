CREATE DATABASE anomalies;
PRINT 'Database "anomalies" created successfully.';

GO

ALTER DATABASE anomalies
SET ALLOW_SNAPSHOT_ISOLATION ON

GO

CREATE LOGIN test WITH PASSWORD = 'VeryStrongPassword123!';
PRINT 'Login "test" created successfully.';

GO

USE anomalies;

CREATE USER test FOR LOGIN test;
PRINT 'User "test" created successfully.';

GO

ALTER ROLE db_owner ADD MEMBER test;

GO

CREATE TABLE Accounts (
Id INT PRIMARY KEY IDENTITY(1,1),
Number NVARCHAR(255) UNIQUE,
Client NVARCHAR(255),
Amount DECIMAL(18, 2)
);

PRINT 'Table "Accounts" created successfully.';

GO

INSERT INTO Accounts 
VALUES
  ('1001', 'alice', 1000.00),
  ('2001', 'bob', 100.00),
  ('2002', 'bob', 900.00);

PRINT 'Table "Accounts" is populated with initial data.';