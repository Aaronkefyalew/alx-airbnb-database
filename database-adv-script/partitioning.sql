

-- Step 1: Rename original table
ALTER TABLE Booking RENAME TO Booking_old;

-- Step 2: Create partitioned table
CREATE TABLE Booking (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20),
    payment_id INT
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions (example: yearly)
CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 4: Migrate data from old table
INSERT INTO Booking (booking_id, user_id, property_id, start_date, end_date, status, payment_id)
SELECT booking_id, user_id, property_id, start_date, end_date, status, payment_id
FROM Booking_old;

-- Step 5: Drop old table (optional, after verifying data)
-- DROP TABLE Booking_old;

-- =====================================================
-- Step 6: Test queries to compare performance
-- =====================================================

-- Example 1: Fetch bookings in March 2024
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date BETWEEN '2024-03-01' AND '2024-03-31';

-- Example 2: Fetch bookings in July 2025
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date BETWEEN '2025-07-01' AND '2025-07-31';

-- Example 3: Count bookings in 2024
EXPLAIN ANALYZE
SELECT COUNT(*) FROM Booking
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
