# Joins Queries for Booking and User Data
SELECT
    booking.id AS booking_id,
    booking.start_time,
    booking.end_time,
    booking.total_price,
    booking.status,
    user.id AS user_id,
    user.first_name AS name
FROM booking
INNER JOIN user ON booking.user_id = user.id;
    -- This query retrieves booking details along with the user's name who made the booking.

-- Joins Queries for Property and Review Data
SELECT
    property.id AS property_id,
    property.name,
    review.id AS review_id,
    review.created_at AS reviewed_date,
    review.rating,
    review.comment
FROM property
LEFT JOIN review ON property.id = review.property_id
ORDER BY reviewed_date;
    -- This query retrieves property details along with any reviews associated with that property.  


SELECT
    user.id AS user_id,
    user.first_name AS name,
    booking.id AS booking_id,
    booking.start_time,
    booking.end_time,
    booking.total_price,
    booking.status
FROM user
FULL OUTER JOIN booking ON user.id = booking.user_id;
