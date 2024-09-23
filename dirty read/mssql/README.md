## List of isolations with this anomaly

- READ UNCOMMITTED only

## Explanation

SELECT statement is lock-free in READ UNCOMMITTED transactions, so it can't be blocked by UPDATE/INSERT statements from other transactions that acquire an exclusive lock.
