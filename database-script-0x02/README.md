# 📦 Sample Data Population Script

This repository contains a SQL script designed to populate a relational database for a property booking application (similar to Airbnb) with realistic sample data.

## 📂 File

- `realistic_sample_data.sql` – SQL insert statements that populate the following tables:
  - `user`
  - `property`
  - `booking`
  - `payment`
  - `review`
  - `message`

## 🧱 Schema Overview

The database schema models an online property booking system, with the following entities:

| Table     | Description                                |
|-----------|--------------------------------------------|
| `user`    | Stores user details like name, role, and contact |
| `property`| Properties listed by hosts                 |
| `booking` | Booking records between users and properties |
| `payment` | Payment information tied to bookings       |
| `review`  | Feedback provided by users on properties   |
| `message` | Communication between users                |

## 🔢 Sample Data Highlights

- **Users:** 5 users (guests, hosts, and an admin) with realistic names, emails, and roles.
- **Properties:** 4 properties hosted by 2 different hosts in various Nigerian cities.
- **Bookings:** 4 bookings by different guests with varied statuses.
- **Payments:** Payments match the booking values using different methods (credit card, PayPal, Stripe).
- **Reviews:** Feedback given for multiple properties with ratings between 4 and 5.
- **Messages:** Users communicate regarding availability and logistics.

## 🚀 How to Use

1. Make sure your MySQL database is set up and the schema has been created.
2. Import the SQL script:
   ```bash
   mysql -u your_user -p your_database < realistic_sample_data.sql
