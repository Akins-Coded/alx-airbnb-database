-- Total Bookings By Each User

SELECT
    u.id AS user_id,
    u.first_name,
    COUNT(b.id) AS total_bookings
FROM user u
LEFT JOIN booking b ON u.id = b.user_id
GROUP BY u.id, u.first_name;

-- Show most booked property
SELECT 
    b.property_id,
    p.name AS property_name,
    COUNT(*) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM 
    booking b
JOIN 
    property p ON b.property_id = p.id
GROUP BY 
    b.property_id, p.name;
