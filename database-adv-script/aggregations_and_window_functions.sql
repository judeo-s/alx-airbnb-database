SELECT user_id, COUNT(*) AS total_bookings FROM booking GROUP BY user_id;
WITH booking_rows AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY property_id ORDER BY start_date) AS row_num
    FROM BOOKING
)
SELECT property_id, COUNT(*) AS total_bookings,
RANK() OVER (ORDER BY COUNT(*)) AS property_rank FROM booking_rows GROUP BY property_id;
