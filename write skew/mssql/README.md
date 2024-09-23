## List of isolations with this anomaly

- SNAPSHOT

## Explanation

In order to prevent Write Skew anomaly the transaction should check that captured read-only records don't have new versions as well in addition to modified records. This is required because readonly records can participate in decision making around updates and outdated values lead to inconsistent update (Write Skew is one of such updates).
MS SQL doesn't provide tools to achieve this desired behavior for separate SELECT statements, but this is built into conditions for UPDATE statements in SHAPSHOT.
