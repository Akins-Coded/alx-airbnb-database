
# 🧮 Database Normalization Explanation

This document explains the normalization approach used in the provided database schema, focusing on how it adheres to standard forms of normalization to ensure data consistency, eliminate redundancy, and promote data integrity.

---

## ⚙️ Applied Normal Forms

### ✅ First Normal Form (1NF)
Each table in the schema:
- Has a primary key that uniquely identifies each row.
- Ensures that all attributes contain only atomic (indivisible) values.
- Contains no repeating groups or arrays.

**Examples:**
- `user.email`, `user.phone_number`, and `property.location` are all atomic values.
- No table has multiple values stored in a single field.

---

### ✅ Second Normal Form (2NF)
- All non-key attributes are fully functionally dependent on the primary key.
- There are no partial dependencies because:
  - Each table has a single-column primary key (`id`).
  - Every attribute in a table depends on that entire primary key.

**Examples:**
- In the `property` table, `host_id`, `name`, and `pricepernight` are fully dependent on `property.id`.
- In the `booking` table, `start_time`, `end_time`, and `status` are fully dependent on `booking.id`.

---

### ✅ Third Normal Form (3NF)
- No transitive dependencies exist between non-key attributes.
- All non-key attributes are only dependent on the primary key and nothing else.

**Examples:**
- In the `user` table, `role` is stored as an enum and does not depend on any other non-key field.
- Payment-related fields such as `amount` and `payment_method` depend only on `payment.id`.

---

## 🔁 Use of Enums for Categorical Values
- The schema uses **enums** for fields with a finite set of values:
  - `user_role_enum`: guest, host, admin
  - `bookings_status_enum`: confirmed, pending, cancelled
  - `payment_method_enum`: credit_card, paypal, stripe

This approach:
- Reduces redundancy
- Prevents invalid data entries
- Encourages referential integrity and consistent value usage

---

## 🔗 Referential Integrity and Foreign Keys

The schema enforces clear relationships through foreign keys:
- `property.host_id → user.id`
- `booking.user_id → user.id`
- `booking.property_id → property.id`
- `payment.booking_id → booking.id`
- `review.property_id → property.id`
- `message.sender_id / recipient_id → user.id`

This supports normalization by avoiding duplicate data (e.g., property info in bookings) and linking related records through references.

---

## 📌 Summary

| Normal Form | Status | Notes |
|-------------|--------|-------|
| 1NF         | ✅     | All attributes are atomic |
| 2NF         | ✅     | All attributes depend on the full primary key |
| 3NF         | ✅     | No transitive dependencies |

The schema is **normalized up to 3NF**, ensuring optimal balance between query performance and data integrity.
