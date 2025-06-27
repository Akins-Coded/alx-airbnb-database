-- user Table
INSERT INTO user (id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('1', 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '1234567890', 'guest', NOW()),
('2', 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', '0987654321', 'host', NOW()),
('3', 'Alice', 'Johnson', 'alice.j@example.com', 'hashed_password_3', '5555555555', 'admin', NOW()),
('4', 'Michael', 'Brown', 'michael.brown@example.com', 'hashed_password_4', '2223334444', 'guest', NOW()),
('5', 'Emily', 'Clark', 'emily.clark@example.com', 'hashed_password_5', '7778889999', 'host', NOW());

-- property Table
INSERT INTO property (id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('101', '2', 'Seaside Villa', 'Beachside property with modern amenities.', 'Lagos', 150.00, NOW(), NOW()),
('102', '2', 'Mountain Cabin', 'Rustic cabin with mountain view.', 'Jos', 90.00, NOW(), NOW()),
('103', '5', 'Urban Loft', 'Modern loft in the city center.', 'Abuja', 200.00, NOW(), NOW()),
('104', '5', 'Country House', 'Peaceful retreat in the countryside.', 'Ibadan', 120.00, NOW(), NOW());

-- booking Table
INSERT INTO booking (id, property_id, user_id, start_time, end_time, total_price, status, created_at) VALUES
('201', '101', '1', '2025-07-01 14:00:00', '2025-07-05 10:00:00', 600.00, 'confirmed', NOW()),
('202', '102', '4', '2025-08-10 15:00:00', '2025-08-12 11:00:00', 180.00, 'pending', NOW()),
('203', '103', '1', '2025-09-01 13:00:00', '2025-09-04 10:00:00', 600.00, 'confirmed', NOW()),
('204', '104', '4', '2025-10-01 13:00:00', '2025-10-03 10:00:00', 240.00, 'cancelled', NOW());

-- payment Table
INSERT INTO payment (id, booking_id, amount, payment_method, created_at) VALUES
('301', '201', 600.00, 'credit_card', NOW()),
('302', '202', 180.00, 'paypal', NOW()),
('303', '203', 600.00, 'stripe', NOW());

-- review Table
INSERT INTO review (id, property_id, rating, comment, created_at) VALUES
('401', '101', 5, 'Perfect location and great host!', NOW()),
('402', '102', 4, 'Nice cabin, but too cold at night.', NOW()),
('403', '103', 5, 'Loved the loft. Super stylish!', NOW());

-- message Table
INSERT INTO message (id, sender_id, recipient_id, message_body, send_at) VALUES
('501', '1', '2', 'Is the Seaside Villa available in July?', NOW()),
('502', '2', '1', 'Yes, it’s available from July 1st to 5th.', NOW()),
('503', '4', '5', 'Can I check-in early at the Country House?', NOW()),
('504', '5', '4', 'Sure! Early check-in is okay.', NOW());
