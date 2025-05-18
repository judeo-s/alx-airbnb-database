EXPLAIN ANALYZE SELECT * FROM booking 
INNER JOIN users ON booking.user_id = users.id
INNER JOIN property ON booking.property_id = property.id
INNER JOIN payment ON booking.id = payment.booking_id;

                                                          QUERY PLAN                                                          
------------------------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=49.24..82.08 rows=1270 width=1498) (actual time=0.181..0.207 rows=5 loops=1)
   Hash Cond: (booking.property_id = property.id)
   ->  Hash Join  (cost=35.19..64.63 rows=1270 width=1090) (actual time=0.132..0.150 rows=5 loops=1)
         Hash Cond: (booking.user_id = users.id)
         ->  Hash Join  (cost=34.08..60.12 rows=1270 width=84) (actual time=0.109..0.121 rows=5 loops=1)
               Hash Cond: (payment.booking_id = booking.id)
               ->  Seq Scan on payment  (cost=0.00..22.70 rows=1270 width=36) (actual time=0.007..0.009 rows=5 loops=1)
               ->  Hash  (cost=20.70..20.70 rows=1070 width=48) (actual time=0.021..0.023 rows=4 loops=1)
                     Buckets: 2048  Batches: 1  Memory Usage: 17kB
                     ->  Seq Scan on booking  (cost=0.00..20.70 rows=1070 width=48) (actual time=0.008..0.009 rows=4 loops=1)
         ->  Hash  (cost=1.05..1.05 rows=5 width=1006) (actual time=0.012..0.013 rows=5 loops=1)
               Buckets: 1024  Batches: 1  Memory Usage: 9kB
               ->  Seq Scan on users  (cost=0.00..1.05 rows=5 width=1006) (actual time=0.008..0.010 rows=5 loops=1)
   ->  Hash  (cost=11.80..11.80 rows=180 width=408) (actual time=0.035..0.036 rows=4 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 9kB
         ->  Seq Scan on property  (cost=0.00..11.80 rows=180 width=408) (actual time=0.023..0.026 rows=4 loops=1)
 Planning Time: 1.374 ms
 Execution Time: 0.315 ms

EXPLAIN ANALYZE SELECT booking.*, users.first_name, users.last_name, users.email, users.phone_number, property.name, property.description, property.location, payment.payment_method FROM booking                                            
LEFT JOIN users ON booking.user_id = users.id 
LEFT JOIN property ON booking.property_id = property.id
LEFT JOIN payment ON booking.id = payment.booking_id;
                                                          QUERY PLAN                                                          
------------------------------------------------------------------------------------------------------------------------------
 Hash Left Join  (cost=49.24..82.08 rows=1270 width=1092) (actual time=0.042..0.052 rows=5 loops=1)
   Hash Cond: (booking.property_id = property.id)
   ->  Hash Left Join  (cost=35.19..64.63 rows=1270 width=724) (actual time=0.028..0.036 rows=5 loops=1)
         Hash Cond: (booking.user_id = users.id)
         ->  Hash Right Join  (cost=34.08..60.12 rows=1270 width=52) (actual time=0.019..0.026 rows=5 loops=1)
               Hash Cond: (payment.booking_id = booking.id)
               ->  Seq Scan on payment  (cost=0.00..22.70 rows=1270 width=8) (actual time=0.003..0.004 rows=5 loops=1)
               ->  Hash  (cost=20.70..20.70 rows=1070 width=48) (actual time=0.010..0.011 rows=4 loops=1)
                     Buckets: 2048  Batches: 1  Memory Usage: 17kB
                     ->  Seq Scan on booking  (cost=0.00..20.70 rows=1070 width=48) (actual time=0.007..0.008 rows=4 loops=1)
         ->  Hash  (cost=1.05..1.05 rows=5 width=676) (actual time=0.006..0.006 rows=5 loops=1)
               Buckets: 1024  Batches: 1  Memory Usage: 9kB
               ->  Seq Scan on users  (cost=0.00..1.05 rows=5 width=676) (actual time=0.003..0.004 rows=5 loops=1)
   ->  Hash  (cost=11.80..11.80 rows=180 width=372) (actual time=0.012..0.012 rows=4 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 9kB
         ->  Seq Scan on property  (cost=0.00..11.80 rows=180 width=372) (actual time=0.002..0.003 rows=4 loops=1)
 Planning Time: 0.264 ms
 Execution Time: 0.080 ms

 
