airbnb_db-# \di
                       List of relations
 Schema |          Name           | Type  |  Owner  |  Table   
--------+-------------------------+-------+---------+----------
 public | booking_pkey            | index | patrick | booking
 public | idx_booking_payment_id  | index | patrick | payment
 public | idx_email               | index | patrick | users
 public | idx_first_name          | index | patrick | users
 public | idx_property_booking_id | index | patrick | booking
 public | idx_property_name       | index | patrick | property
 public | message_pkey            | index | patrick | message
 public | payment_pkey            | index | patrick | payment
 public | property_pkey           | index | patrick | property
 public | review_pkey             | index | patrick | review
 public | users_email_key         | index | patrick | users
 public | users_pkey              | index | patrick | users

CREATE EXTENSION pg_stat_statements;

SELECT query, calls, total_exec_time, rows, mean_exec_time FROM pg_stat_statements ORDER BY total_exec_time DESC LIMIT 5; 
 query | calls | total_exec_time | rows | mean_exec_time 
-------+-------+-----------------+------+----------------
(0 rows)

EXPLAIN ANALYZE SELECT booking.id, users.first_name FROM booking INNER JOIN users ON booking.user_id=users.id;

 QUERY PLAN                                                  
-------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=1.11..2.17 rows=4 width=122) (actual time=0.266..0.279 rows=4 loops=1)
   Hash Cond: (booking.user_id = users.id)
   ->  Seq Scan on booking  (cost=0.00..1.04 rows=4 width=8) (actual time=0.061..0.064 rows=4 loops=1)
   ->  Hash  (cost=1.05..1.05 rows=5 width=122) (actual time=0.153..0.155 rows=5 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 9kB
         ->  Seq Scan on users  (cost=0.00..1.05 rows=5 width=122) (actual time=0.108..0.114 rows=5 loops=1)
 Planning Time: 3.367 ms
 Execution Time: 0.458 ms
(8 rows)

SELECT query, calls, total_exec_time, rows, mean_exec_time FROM pg_stat_statements ORDER BY total_exec_time DESC LIMIT 5;

                                                           query                                                           | calls |  total_exec_time   | rows |   mean_exec_time    
---------------------------------------------------------------------------------------------------------------------------+-------+--------------------+------+---------------------
 EXPLAIN ANALYZE SELECT booking.id, users.first_name FROM booking INNER JOIN users ON booking.user_id=users.id             |     1 |           4.145115 |    0 |            4.145115
 SELECT query, calls, total_exec_time, rows, mean_exec_time FROM pg_stat_statements ORDER BY total_exec_time DESC LIMIT $1 |     2 | 0.6557550000000001 |    2 | 0.32787750000000004
 SELECT booking.id, users.first_name FROM booking INNER JOIN users ON booking.user_id=users.id                             |     1 |           0.127254 |    4 |            0.127254
(3 rows)

DROP INDEX idx_email;
SELECT query, calls, total_exec_time, rows, mean_exec_time FROM pg_stat_statements ORDER BY total_exec_time DESC LIMIT 5;


                                                           query                                                           | calls |   total_exec_time   | rows |   mean_exec_time    
---------------------------------------------------------------------------------------------------------------------------+-------+---------------------+------+---------------------
 EXPLAIN ANALYZE SELECT booking.id, users.first_name FROM booking INNER JOIN users ON booking.user_id=users.id             |     1 |            4.145115 |    0 |            4.145115
 DROP INDEX idx_email                                                                                                      |     1 |            2.437567 |    0 |            2.437567
 SELECT query, calls, total_exec_time, rows, mean_exec_time FROM pg_stat_statements ORDER BY total_exec_time DESC LIMIT $1 |     3 |  0.9214650000000001 |    5 |            0.307155
 SELECT booking.id, users.first_name FROM booking INNER JOIN users ON booking.user_id=users.id                             |     2 | 0.23278500000000002 |    8 | 0.11639250000000001
(4 rows)
