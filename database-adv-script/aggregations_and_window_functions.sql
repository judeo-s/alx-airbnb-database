-- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT 
    User.id AS user_id,
    CONCAT(User.first_name, ' ', User.last_name) AS full_name,
    COUNT(Booking.id) AS total_bookings
FROM 
    User
LEFT JOIN 
    Booking ON User.id = Booking.user_id
GROUP BY 
    User.id, User.first_name, User.last_name;



-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received
SELECT
    Property.id AS property_id,
    Property.name AS property_name,
    COUNT(Booking.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(Booking.id) DESC) AS booking_rank
FROM
    Property
LEFT JOIN
    Booking ON Property.id = Booking.property_id
GROUP BY
    Property.id, Property.name;

