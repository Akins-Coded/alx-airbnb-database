-- ⚡ Performance Testing: Example using EXPLAIN to compare performance
-- Before and after creating indexes, run:

-- Example 1: Analyze booking-to-user join
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

-- These commands help verify if the execution time improves after adding indexes.
