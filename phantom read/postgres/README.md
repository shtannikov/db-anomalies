## List of isolations with this anomaly

- READ COMMITTED

## Explanation

READ COMMITTED creates a new snapshot per a statement, so each statement sees the latest committed values.

Unlike MS SQL, PostgreSQL doesn't have this anomaly in transactions with REPEATABLE READ isolation. The reason is that a REPEATABLE READ transaction has a single snapshot with record versions created before the transaction started.
