#### Before Partitioning:

+ Full table scans occurred when querying by start_date.

+ Query latency increased as the dataset grew.

#### After Partitioning by YEAR(start_date):

+ Query planner skips irrelevant partitions (e.g., if querying only 2025).

+ `EXPLAIN` output shows only the relevant partition being accessed.

+ Improved I/O and reduced CPU usage during filtered queries.

+ Overall execution time reduced significantly for date range queries.
