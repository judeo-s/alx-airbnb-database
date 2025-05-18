-- INNER JOIN to retrieve all bookings and the respective users who made those bookings
SELECT 
    Booking.id AS booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    Booking.created_at AS booking_date,
    User.id AS user_id,
    User.first_name,
    User.last_name,
    User.email
FROM Booking
INNER JOIN User ON Booking.user_id = User.id;



-- LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    Property.id AS property_id,
    Property.name AS property_name,
    Property.location,
    Review.id AS review_id,
    Review.rating,
    Review.comment,
    Review.created_at AS review_date
FROM Property
LEFT JOIN Review ON Property.id = Review.property_id ORDER BY rating;



-- FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
SELECT
	User.id AS user_id,
	User.first_name,
	User.last_name,
	User.email,
	Booking.id AS booking_id,
	Booking.property_id,
	Booking.start_date,
	Bookng.end_date,
	Booking.total_price,
	Booking.status
FROM User
FULL OUTER JOIN Booking ON Bookng.user_id = User.id;
