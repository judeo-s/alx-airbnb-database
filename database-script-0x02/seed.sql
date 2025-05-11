-- Inserting sample data into the User table
INSERT INTO User (first_name, last_name, email, password_hash, phone_number, role) VALUES
('John', 'Doe', 'john.doe@example.com', 'hashed_password_123', '123-456-7890', 'guest'),
('Jane', 'Smith', 'jane.smith@example.com', 'secure_pass_456', '987-654-3210', 'host'),
('Peter', 'Jones', 'peter.jones@example.com', 'complex_hash_789', '555-123-4567', 'guest'),
('Alice', 'Brown', 'alice.brown@example.com', 'another_secure_hash', '111-222-3333', 'host'),
('Admin', 'User', 'admin@example.com', 'admin_password_hash', '000-999-8888', 'admin');

-- Inserting sample data into the Property table
INSERT INTO Property (host_id, name, description, location, pricepernight) VALUES
(2, 'Cozy Apartment in City Center', 'A comfortable and well-equipped apartment close to all amenities.', '123 Main St, Anytown', 75.00),
(2, 'Luxury Villa with Ocean View', 'A spacious villa with breathtaking ocean views and private pool.', '45 Ocean Dr, Seaside', 250.00),
(4, 'Charming Cottage in the Woods', 'A rustic cottage surrounded by nature, perfect for a getaway.', '78 Forest Ln, Woodsville', 90.00),
(4, 'Modern Loft in Downtown', 'A stylish loft with city views and easy access to nightlife.', '90 Downtown Ave, Cityville', 120.00);

-- Inserting sample data into the Booking table
INSERT INTO Booking (property_id, user_id, start_date, end_date, total_price, status) VALUES
(1, 1, '2025-06-01', '2025-06-05', 300.00, 'confirmed'),
(2, 3, '2025-07-10', '2025-07-17', 1750.00, 'confirmed'),
(1, 3, '2025-08-01', '2025-08-03', 150.00, 'pending'),
(3, 1, '2025-06-15', '2025-06-22', 630.00, 'confirmed'),
(4, 3, '2025-09-01', '2025-09-07', 840.00, 'confirmed'),
(2, 1, '2025-10-05', '2025-10-07', 500.00, 'canceled');

-- Inserting sample data into the Payment table
INSERT INTO Payment (booking_id, amount, payment_method) VALUES
(1, 300.00, 'credit_card'),
(2, 1750.00, 'paypal'),
(4, 630.00, 'credit_card'),
(5, 840.00, 'stripe');

-- Inserting sample data into the Review table
INSERT INTO Review (property_id, user_id, rating, comment) VALUES
(1, 1, 4, 'Great location and comfortable apartment.'),
(2, 3, 5, 'Absolutely stunning villa with amazing views!'),
(1, 3, 3, 'It was okay, but could be cleaner.'),
(3, 1, 5, 'Perfect for a peaceful retreat in nature.'),
(4, 3, 4, 'Stylish loft in a vibrant part of the city.');

-- Inserting sample data into the Message table
INSERT INTO Message (sender_id, recipient_id, message_body) VALUES
(1, 2, 'Hi, I have a question about the apartment booking.'),
(2, 1, 'Sure, what would you like to know?'),
(3, 4, 'Is the cottage pet-friendly?'),
(4, 3, 'Yes, pets are welcome at the cottage.'),
(1, 4, 'Regarding the loft, is parking available?'),
(4, 1, 'Yes, there is paid parking nearby.');
