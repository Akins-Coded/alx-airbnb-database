
SELECT *
FROM property
WHERE id IN (
    SELECT property_id
    FROM review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);


SELECT *
FROM user u
WHERE (
    SELECT COUNT(*)
    FROM booking b
    WHERE b.user_id = u.id
) > 3;
