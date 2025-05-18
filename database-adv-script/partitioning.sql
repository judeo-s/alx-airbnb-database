-- partitioning.sql

-- Step 1: Drop the existing Booking table if needed (back up data first!)
DROP TABLE IF EXISTS Booking;

-- Step 2: Create a partitioned Booking table by RANGE on start_date
CREATE TABLE Booking (
    id INT PRIMARY KEY AUTO_INCREMENT,
    property_id INT NOT NULL,
    user_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(id),
    FOREIGN KEY (user_id) REFERENCES User(id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pmax  VALUES LESS THAN MAXVALUE
);

-- Step 3: (Optional) Reinsert or load data into the partitioned table
-- INSERT INTO Booking (...) VALUES (...);

-- Step 4: Sample query to test performance
EXPLAIN SELECT * FROM Booking WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';
