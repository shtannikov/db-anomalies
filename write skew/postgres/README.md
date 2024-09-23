## List of isolations with this anomaly

- REPEATABLE READ

## Explanation

In order to prevent Write Skew anomaly the transaction should check that captured read-only records don't have new versions as well in addition to modified records. This is how SERIALIZABLE prevents this anomaly and this is required because readonly records can participate in decision making around updates and outdated values lead to inconsistent updates (Write Skew is one of such updates).
