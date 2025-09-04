--------------------------------------------------
-- USER TABLE INDEXES
--------------------------------------------------

-- Drop index if exists
DROP INDEX IF EXISTS idx_user_email;

-- Index on email for faster search in WHERE clauses
CREATE INDEX idx_user_email ON User(email);

--------------------------------------------------
-- BOOKING TABLE INDEXES
--------------------------------------------------

-- Drop indexes if exist
DROP INDEX IF EXISTS idx_booking_user_id;
DROP INDEX IF EXISTS idx_booking_property_id;
DROP INDEX IF EXISTS idx_booking_date;
DROP INDEX IF EXISTS idx_booking_user_property;

-- Index on user_id for faster filtering by user
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index on property_id for faster filtering by property
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Index on booking_date for queries ordered or filtered by date
CREATE INDEX idx_booking_date ON Booking(booking_date);

-- Composite index for queries filtering by user and property together
CREATE INDEX idx_booking_user_property ON Booking(user_id, property_id);

--------------------------------------------------
-- PROPERTY TABLE INDEXES
--------------------------------------------------

-- Drop indexes if exist
DROP INDEX IF EXISTS idx_property_city;
DROP INDEX IF EXISTS idx_property_price;
DROP INDEX IF EXISTS idx_property_city_price;

-- Index on city for faster city-based search
CREATE INDEX idx_property_city ON Property(city);

-- Index on price for faster price-based filtering
CREATE INDEX idx_property_price ON Property(price);

-- Composite index for queries filtering by city and price together
CREATE INDEX idx_property_city_price ON Property(city, price);

--------------------------------------------------
-- EXPLAIN ANALYZE EXAMPLES
--------------------------------------------------

-- Example before creating indexes
-- EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 123;

-- Example after creating indexes
-- EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 123;

-- Example composite query
-- EXPLAIN ANALYZE SELECT * FROM Property WHERE city = 'Addis Ababa' AND price < 500;
