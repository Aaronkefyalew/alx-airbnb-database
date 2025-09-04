
-- 1. Initial Query: Retrieve all bookings
-- with user, property, and payment details
SELECT
    b.booking_id,
    b.booking_date,
    b.status AS booking_status,
    u.user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.property_id,
    p.name AS property_name,
    p.location AS property_location,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date
FROM
    Booking b
JOIN
    User u ON b.user_id = u.user_id
JOIN
    Property p ON b.property_id = p.property_id
LEFT JOIN
    Payment pay ON b.booking_id = pay.booking_id;

-- ============================================
-- 2. Analyze Performance of Initial Query
-- ============================================
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.booking_date,
    b.status AS booking_status,
    u.user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.property_id,
    p.name AS property_name,
    p.location AS property_location,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date
FROM
    Booking b
JOIN
    User u ON b.user_id = u.user_id
JOIN
    Property p ON b.property_id = p.property_id
LEFT JOIN
    Payment pay ON b.booking_id = pay.booking_id;

-- ============================================
-- 3. Optimized Query
-- Only select necessary columns and use proper joins
-- ============================================
SELECT
    b.booking_id,
    b.booking_date,
    b.status AS booking_status,
    u.user_id,
    u.name AS user_name,
    p.property_id,
    p.name AS property_name,
    pay.payment_id,
    pay.amount AS payment_amount
FROM
    Booking b
JOIN
    User u ON b.user_id = u.user_id
JOIN
    Property p ON b.property_id = p.property_id
LEFT JOIN
    Payment pay ON b.booking_id = pay.booking_id;

-- ============================================
-- 4. Index Creation for Optimized Performance
-- ============================================
CREATE INDEX IF NOT EXISTS idx_booking_user ON Booking(user_id);
CREATE INDEX IF NOT EXISTS idx_booking_property ON Booking(property_id);
CREATE INDEX IF NOT EXISTS idx_payment_booking ON Payment(booking_id);
