
-- Index on user.id (used in JOINs)
CREATE INDEX idx_user_id ON user(id);

-- Index on booking.user_id (used in JOINs and WHERE filters)
CREATE INDEX idx_booking_user_id ON booking(user_id);

-- Index on booking.property_id (used in JOINs and WHERE filters)
CREATE INDEX idx_booking_property_id ON booking(property_id);

-- Index on booking.status (used in WHERE filters)
CREATE INDEX idx_booking_status ON booking(status);

-- Index on property.id (used in JOINs)
CREATE INDEX idx_property_id ON property(id);

-- Index on property.location (used in WHERE filters or search)
CREATE INDEX idx_property_location ON property(location);

-- Index on review.property_id (used in JOINs and subqueries)
CREATE INDEX idx_review_property_id ON review(property_id);


EXPLAIN ANALYZE
SELECT *
FROM booking
JOIN user ON booking.user_id = user.id
WHERE booking.status = 'confirmed';

-- Example 2: Analyze property search by location
EXPLAIN ANALYZE
SELECT *
FROM property
WHERE location = 'Lagos';

-- Example 3: Count bookings per property
EXPLAIN ANALYZE
SELECT property_id, COUNT(*)
FROM booking
GROUP BY property_id;
