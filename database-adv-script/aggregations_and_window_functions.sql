-- 1. Aggregation with COUNT and GROUP BY:
-- Find the total number of bookings made by each user
SELECT 
    u.user_id,
    u.name,
    COUNT(b.booking_id) AS total_bookings
FROM Users u
LEFT JOIN Bookings b 
    ON u.user_id = b.user_id
GROUP BY u.user_id, u.name
ORDER BY total_bookings DESC;

-- 2. Window Function with RANK:
-- Rank properties based on the total number of bookings they have received
SELECT 
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Properties p
LEFT JOIN Bookings b 
    ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY booking_rank;

-- 3. Window Function with ROW_NUMBER:
-- Assign a unique row number to properties based on their booking counts
SELECT 
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_row_number
FROM Properties p
LEFT JOIN Bookings b 
    ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY booking_row_number;

