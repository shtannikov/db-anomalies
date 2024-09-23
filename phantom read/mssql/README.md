## List of isolations with this anomaly

- READ UNCOMMITTED
- READ COMMITTED
- REPEATABLE READ
- SNAPSHOT

## Explanation

In order to block INSERT statements from other transactions, SELECT should acquire a shared **range** lock untill the end of the transaction. Meanwhile:

- SELECT is lockfree in READ UNCOMMITTED

- SELECT releases shared lock after its completion in READ COMMITTED

- SELECT locks only selected rows in REPEATABLE READ

- SELECT is lockfree in SNAPSHOT, and even though a SNAPSHOT transaction sees only those versions of existing records that were created before the transaction started, it still can see new records inserted by concurrent committed transactions.
