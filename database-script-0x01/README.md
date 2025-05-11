# database-script-0x01/schema.sql

This is the database schema for an Airbnb-like application. It is written in SQL and uses the InnoDB storage engine.

The schema consists of 6 tables:

* `User`: This table stores information about users, such as their first name, last name, email, password hash, phone number, and role.
* `Property`: This table stores information about properties, such as the host, name, description, location, price per night, and created and updated timestamps.
* `Booking`: This table stores information about bookings, such as the property ID, user ID, start date, end date, total price, and status.
* `Payment`: This table stores information about payments, such as the booking ID, amount paid, payment date, and payment method.
* `Review`: This table stores information about reviews, such as the property ID, user ID, rating, comment, and created timestamp.
* `Message`: This table stores information about messages, such as the sender ID, recipient ID, message body, and sent timestamp.

The schema also includes several indexes to improve query performance. These include indexes on the `User` table by `email`, on the `Property` table by `host_id`, on the `Booking` table by `property_id` and `user_id`, on the `Payment` table by `booking_id`, and on the `Review` table by `property_id` and `user_id`.
