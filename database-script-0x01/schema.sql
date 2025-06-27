
-- Table: user
CREATE TABLE user (
    id CHAR(36) PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    role ENUM('guest', 'host', 'admin'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_user_email (email),
    INDEX idx_user_phone (phone_number)
);

-- Table: property
CREATE TABLE property (
    id CHAR(36) PRIMARY KEY,
    host_id CHAR(36),
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES user(id),
    INDEX idx_property_host_id (host_id),
    INDEX idx_property_location (location)
);

-- Table: booking
CREATE TABLE booking (
    id CHAR(36) PRIMARY KEY,
    property_id CHAR(36),
    user_id CHAR(36),
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('confirmed', 'pending', 'cancelled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES property(id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    INDEX idx_booking_user_id (user_id),
    INDEX idx_booking_property_id (property_id),
    INDEX idx_booking_status (status)
);

-- Table: payment
CREATE TABLE payment (
    id CHAR(36) PRIMARY KEY,
    booking_id CHAR(36),
    amount DECIMAL(10, 2) NOT NULL,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES booking(id),
    INDEX idx_payment_booking_id (booking_id),
    INDEX idx_payment_method (payment_method)
);

-- Table: review
CREATE TABLE review (
    id CHAR(36) PRIMARY KEY,
    property_id CHAR(36),
    rating SMALLINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES property(id),
    INDEX idx_review_property_id (property_id),
    INDEX idx_review_rating (rating)
);

-- Table: message
CREATE TABLE message (
    id CHAR(36) PRIMARY KEY,
    sender_id CHAR(36),
    recipient_id CHAR(36),
    message_body TEXT NOT NULL,
    send_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES user(id),
    FOREIGN KEY (recipient_id) REFERENCES user(id),
    INDEX idx_message_sender (sender_id),
    INDEX idx_message_recipient (recipient_id)
);
