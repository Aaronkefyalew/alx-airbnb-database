# Full Database Optimization Report

## Objective
Continuously monitor, refine, and optimize database performance by analyzing query execution plans, creating indexes, implementing partitioning, and making schema adjustments.


## 1. Initial Query Performance

### Query 1: Fetch bookings with user and property details
```sql
SELECT b.booking_id, b.start_date, b.end_date, u.name AS user_name, p.name AS property_name
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date >= '2025-09-01';
EXPLAIN ANALYZE
SELECT b.booking_id, b.start_date, b.end_date, u.name AS user_name, p.name AS property_name
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date >= '2025-09-01';


SELECT u.user_id, u.name, SUM(pay.amount) AS total_paid
FROM Payment pay
JOIN User u ON pay.user_id = u.user_id
GROUP BY u.user_id, u.name;


EXPLAIN ANALYZE
SELECT u.user_id, u.name, SUM(pay.amount) AS total_paid
FROM Payment pay
JOIN User u ON pay.user_id = u.user_id
GROUP BY u.user_id, u.name;


-- Booking table
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Payment table
CREATE INDEX idx_payment_user_id ON Payment(user_id);



