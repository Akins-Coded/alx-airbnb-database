-- database: alx-airbnb-database

SELECT
    b.id AS booking_id,
    b.created_at,
    
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email AS user_email,
    
    p.id AS property_id,
    p.name AS property_name,
    p.location AS address,
    
    pay.id AS payment_id,
    pay.amount,
    pay.created_at AS payment_date

FROM 
    booking b,
    user u,
    property p,
    payment pay

WHERE
    b.user_id = u.id
    AND b.property_id = p.id
    AND pay.booking_id = b.id
LIMIT 1000;

EXPLAIN ANALYZE

SELECT
    b.id AS booking_id,
    b.created_at,
    
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email AS user_email,
    
    p.id AS property_id,
    p.name AS property_name,
    p.location AS address,
    
    pay.id AS payment_id,
    pay.amount,
    pay.created_at AS payment_date

FROM 
    booking b,
    user u,
    property p,
    payment pay

WHERE
    b.user_id = u.id
    AND b.property_id = p.id
    AND pay.booking_id = b.id
LIMIT 1000;

-- OPTIMIZED QUERY
SELECT
    b.id AS booking_id,
    b.created_at,
    u.first_name,
    u.last_name,
    u.email AS user_email,
    p.name AS property_name,
    p.location AS property_location,
    pay.amount AS payment_amount,
    pay.created_at AS payment_date

FROM booking b
JOIN user u ON b.user_id = u.id
JOIN property p ON b.property_id = p.id
LEFT JOIN payment pay ON pay.booking_id = b.id

LIMIT 1000;