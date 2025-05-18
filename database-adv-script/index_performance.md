query: EXPLAIN ANAZLYZE SELECT booking.id, users.first_name FROM booking INNER JOIN users ON booking.user_id=users.id;

report before indexing:

QUERY PLAN                                                   
---------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=11.57..35.14 rows=1070 width=122) (actual time=0.402..0.419 rows=4 loops=1)
   Hash Cond: (booking.user_id = users.id)
   ->  Seq Scan on booking  (cost=0.00..20.70 rows=1070 width=8) (actual time=0.021..0.026 rows=4 loops=1)
   ->  Hash  (cost=10.70..10.70 rows=70 width=122) (actual time=0.359..0.361 rows=5 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 9kB
         ->  Seq Scan on users  (cost=0.00..10.70 rows=70 width=122) (actual time=0.337..0.343 rows=5 loops=1)
 Planning Time: 12.700 ms
 Execution Time: 0.511 ms
(8 rows)

report after indexing:


                                                 QUERY PLAN                                                  
-------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=1.11..24.68 rows=1070 width=122) (actual time=2.022..2.033 rows=4 loops=1)
   Hash Cond: (booking.user_id = users.id)
   ->  Seq Scan on booking  (cost=0.00..20.70 rows=1070 width=8) (actual time=1.958..1.961 rows=4 loops=1)
   ->  Hash  (cost=1.05..1.05 rows=5 width=122) (actual time=0.038..0.039 rows=5 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 9kB
         ->  Seq Scan on users  (cost=0.00..1.05 rows=5 width=122) (actual time=0.022..0.026 rows=5 loops=1)
 Planning Time: 0.734 ms
 Execution Time: 2.088 ms
(8 rows)
