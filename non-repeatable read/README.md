## Scenario

We have two concurrent transactions: tx_1 and tx_2. Tx_1 reads the same record twice, but it has a delay before the second read. During this delay, tx_2 updates the record. This leads to a different result for the second read in tx_1.

![https://excalidraw.com/#json=CG5fPkX6j8gup4p8-X6Tm,DKnjyPxrDqeyBGp5yhvltw](./visuals.png)
