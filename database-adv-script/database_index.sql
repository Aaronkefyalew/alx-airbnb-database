-- =====================================
-- Database Index Optimization Script
-- =====================================

-- =============================
-- Step 1: Measure performance BEFORE indexes
-- =============================
-- Example queries to test Booking table
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 123;
EXPLAIN ANALYZE SELECT * FROM Booking WHERE property_id = 456;
EXPLAIN ANALYZE SELECT * FROM Booking WHERE booking_date >= '2025-01-01';

-- Example queries to test User table
EXPLAIN ANALYZE SELECT * FROM User WHERE email = 'test@example.com';
EXPLAIN ANALYZE SELECT * FROM User WHERE username = 'john_doe';

-- Example queries to test Property table
EXPLAIN ANALYZE SELECT * FROM Property WHERE location = 'Addis Ababa';
EXPLAIN ANALYZE SELECT * FROM Property WHERE host_id = 789;
EXPLAIN ANALYZE SELECT * FROM Property WHERE price < 100;

-- =============================
-- Step 2: Create Indexes
-- =============================
-- User Table Indexes
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_username ON User(username);

-- Booking Table Indexes
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_booking_date ON Booking(booking_date);
CREATE INDEX idx_booking_user_date ON Booking(user_id, booking_date);

-- Property Table Indexes
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_price ON Property(price);
CREATE INDEX idx_property_location_price ON Property(location, price);

-- =============================
-- Step 3: Measure performance AFTER indexes
-- =============================
-- Booking table
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 123;
EXPLAIN ANALYZE SELECT * FROM Booking WHERE property_id = 456;
EXPLAIN ANALYZE SELECT * FROM Booking WHERE booking_date >= '2025-01-01';

-- User table
EXPLAIN ANALYZE SELECT * FROM User WHERE email = 'test@example.com';
EXPLAIN ANALYZE SELECT * FROM User WHERE username = 'john_doe';

-- Property table
EXPLAIN ANALYZE SELECT * FROM Property WHERE location = 'Addis Ababa';
EXPLAIN ANALYZE SELECT * FROM Property WHERE host_id = 789;
EXPLAIN ANALYZE SELECT * FROM Property WHERE price < 100;
