-- =====================================
-- Indexes for User, Booking, and Property Tables
-- Purpose: Improve query performance on high-usage columns
-- =====================================

-- =================
-- User Table Indexes
-- =================
-- Index for fast lookups by email (common for login/search)
CREATE INDEX idx_user_email ON User(email);

-- Index for fast lookups by username
CREATE INDEX idx_user_username ON User(username);

-- ===================
-- Booking Table Indexes
-- ===================
-- Index for filtering bookings by user
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index for filtering bookings by property
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Index for filtering or ordering by booking date
CREATE INDEX idx_booking_booking_date ON Booking(booking_date);

-- Multi-column index for common queries filtering by user and date
CREATE INDEX idx_booking_user_date ON Booking(user_id, booking_date);

-- =====================
-- Property Table Indexes
-- =====================
-- Index for filtering by location
CREATE INDEX idx_property_location ON Property(location);

-- Index for joining with host (user)
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Index for ordering or filtering by price
CREATE INDEX idx_property_price ON Property(price);

-- Multi-column index for queries filtering by location and price
CREATE INDEX idx_property_location_price ON Property(location, price);
