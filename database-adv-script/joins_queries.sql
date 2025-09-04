-- 1. INNER JOIN: Bookings with Users
SELECT 
    b.booking_id,
    b.property_id,
    b.date,
    u.user_id,
    u.name,
    u.email
FROM Bookings b
INNER JOIN Users u 
    ON b.user_id = u.user_id;

-- 2. LEFT JOIN: Properties with Reviews
SELECT 
    p.property_id,
    p.name AS property_name,
    r.review_id,
    r.rating,
    r.comment
FROM Properties p
LEFT JOIN Reviews r 
    ON p.property_id = r.property_id
ORDER BY p.property_id;


-- 3. FULL OUTER JOIN: Users with Bookings
SELECT 
    u.user_id,
    u.name,
    b.booking_id,
    b.property_id,
    b.date
FROM Users u
FULL OUTER JOIN Bookings b 
    ON u.user_id = b.user_id;
