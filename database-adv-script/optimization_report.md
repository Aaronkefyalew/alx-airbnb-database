 Query Optimization Report

The initial query retrieved all bookings along with user details, property details, and payment details:

```sql
SELECT 
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.property_id,
    p.title AS property_title,
    p.location AS property_location,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.status AS payment_status
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON b.payment_id = pay.payment_id;
