## List of isolations with this anomaly

- READ UNCOMMITTED only

## Explanation

SELECT operation is lock-free in READ UNCOMMITTED transactions, so it can't be blocked by UPDATE/INSERT operations from other transactions that acquire an exclusive lock.
