# Optimization Report: Query Performance Analysis

## Database
**Database:** `alx-airbnb-database`  
**Tables involved:** `booking`, `user`, `property`, `payment`

---

## Objective
Analyze the performance and efficiency differences between:

- A detailed, unoptimized query  
- An optimized version of the same query, trimmed for performance

---

## Queries Compared

### 1. Original Query (Detailed Version)

```sql
SELECT 
    b.id AS booking_id,
    b.start_time,
    b.end_time,
    b.total_price AS booking_total,
    b.status AS booking_status,

    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    u.role AS user_role,

    p.id AS property_id,
    p.name AS property_name,
    p.description AS property_description,
    p.location,
    p.pricepernight,

    pay.id AS payment_id,
    pay.amount AS payment_amount,
    pay.payment_method,
    pay.created_at AS payment_date

FROM booking b
JOIN user u ON b.user_id = u.id
JOIN property p ON b.property_id = p.id
LEFT JOIN payment pay ON pay.booking_id = b.id;

## Optimized Query

SELECT 
    b.id AS booking_id,
    b.start_time,
    b.end_time,
    b.total_price,
    b.status,

    u.first_name,
    u.last_name,
    u.email,

    p.name AS property_name,
    p.location,
    p.pricepernight,

    pay.amount AS payment_amount,
    pay.payment_method

FROM booking b
INNER JOIN user u ON b.user_id = u.id
INNER JOIN property p ON b.property_id = p.id
LEFT JOIN payment pay ON pay.booking_id = b.id;

### Performance Considerations
Reduced Columns: By limiting selected columns, the optimized query reduces:

### Memory usage

Data transfer between DB and application

Sorting and temporary table overhead

Explicit INNER JOIN: Using INNER JOIN enhances readability and clarity for the query planner.

Index Usage: Both queries benefit from indexing on user_id, property_id, and booking_id. The optimized query is more efficient due to fewer columns being handled.

