## List of isolations with this anomaly

- READ UNCOMMITTED
- READ COMMITTED

## Explanation

In order to block UPDATE statements from other transactions, SELECT shouldn't release its shared lock until the end of the transaction. Meanwhile:

- SELECT is lockfree in READ UNCOMMITTED

- SELECT releases shared lock after its completion in READ COMMITTED
