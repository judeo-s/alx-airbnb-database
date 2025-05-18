-- Query to retrieve all bookings with user, property, and payment details
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    b.created_at AS booking_created_at,

    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,

    p.id AS property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,

    pay.id AS payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method

FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON b.id = pay.booking_id;
