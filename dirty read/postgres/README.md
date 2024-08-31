## List of isolations with this anomaly

- There is no such isolation levels in PostgreSQL

## Explanation

UPDATE operation creates a completely new version of the modified record that is not visible by other transactions until committed.

The same with INSERT, but it seems more obvious.
