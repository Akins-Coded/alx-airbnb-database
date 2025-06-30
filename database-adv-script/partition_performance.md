# 🗂️ Partitioning the `booking` Table for Performance Optimization

This document explains how to apply **MySQL partitioning** to the `booking` table without data loss, improving performance for queries on large datasets—especially those filtering by `start_time`.

---

## ⚠️ MySQL Limitation
MySQL **does not allow partitioning an existing table directly**. Partitioning must be defined at creation time.

---

## ✅ Recommended Workaround
We use a safe, multi-step approach to recreate the table with partitions and preserve the data.

### Step-by-Step Guide:

#### 1. **Create a new partitioned table**
```sql
CREATE TABLE booking_partitioned (
    id CHAR(36) PRIMARY KEY,
    property_id CHAR(36),
    user_id CHAR(36),
    start_time DATE NOT NULL,
    end_time DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('confirmed', 'pending', 'cancelled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES property(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
)
PARTITION BY RANGE (YEAR(start_time)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pmax  VALUES LESS THAN MAXVALUE
);
```

#### 2. **Copy all data from the old table**
```sql
INSERT INTO booking_partitioned
SELECT * FROM booking;
```

#### 3. **Rename the original table (backup)**
```sql
RENAME TABLE booking TO booking_old;
```

#### 4. **Rename the partitioned table to the original name**
```sql
RENAME TABLE booking_partitioned TO booking;
```

---

## 🔐 Safety Tips
- Backup your database before starting.
- Run during off-peak hours.
- Test the new partitioned table on a staging environment first.

---

## 📈 Benefits
- Improved query performance on `start_time`
- Faster filtering and range-based queries
- Efficient data pruning using partition awareness

---

> ✅ You now have a partitioned `booking` table without dropping your original data!