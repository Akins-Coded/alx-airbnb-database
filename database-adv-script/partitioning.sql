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
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Copy existing data to the new table:
INSERT INTO booking_partitioned
SELECT * FROM booking;

-- Rename the old table (as backup):
RENAME TABLE booking TO booking_old;

-- Rename the new table to original name:
RENAME TABLE booking_partitioned TO booking;

