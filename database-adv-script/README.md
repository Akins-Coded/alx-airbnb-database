# 📊 SQL Join Queries Documentation – Airbnb Clone Backend

This document describes the purpose and behavior of key SQL join queries used to extract relational data from the Airbnb Clone backend database schema. These queries help retrieve meaningful connections between bookings, users, properties, and reviews.

---

## 📌 Query 1: Booking and User Data – INNER JOIN

```sql
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
```

### 🎯 Purpose:

This query retrieves a list of **all bookings** along with the **users who made those bookings**. It uses an `INNER JOIN` to ensure that only bookings **with a matching user record** are returned.

### ✅ Use Case:

* Display booking history with user details
* Admin dashboards
* Booking reports by guest

---

## 📌 Query 2: Property and Review Data – LEFT JOIN

```sql
SELECT
    property.id AS property_id,
    property.name,
    review.id AS review_id,
    review.rating,
    review.comment
FROM property
LEFT JOIN review ON property.id = review.property_id;
```

### 🎯 Purpose:

This query retrieves all **properties** and any associated **reviews**, if they exist. The `LEFT JOIN` ensures that properties **without any reviews** are still included in the result set, with review fields set to `NULL`.

### ✅ Use Case:

* Property detail pages with or without reviews
* Analytics on review coverage
* Admin moderation tools

---

## 📌 Query 3: Users and Bookings – FULL OUTER JOIN

```sql
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
```

### 🎯 Purpose:

This query returns **all users and all bookings**, even if:

* A user has **never made a booking**
* A booking exists **without a valid associated user** (rare but useful for audits)

Using a `FULL OUTER JOIN`, it ensures no data is left out.

### ✅ Use Case:

* Data validation and integrity checks
* Generating comprehensive user-booking reports
* Identifying orphan bookings or inactive users

---

## 🧾 Summary

| Query | Type of Join      | Main Focus              | Returns Missing Data? |
| ----- | ----------------- | ----------------------- | --------------------- |
| 1     | `INNER JOIN`      | Bookings with users     | ❌ No                  |
| 2     | `LEFT JOIN`       | Properties with reviews | ✅ Yes (for reviews)   |
| 3     | `FULL OUTER JOIN` | Users and bookings      | ✅ Yes (both sides)    |

These SQL statements are crucial for backend analytics, API response shaping, and admin functionality in the Airbnb Clone project.
