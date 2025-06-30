
-- Index on user.id (used in JOINs)
CREATE INDEX idx_user_id ON user(id);

-- Index on booking.user_id (used in JOINs and WHERE filters)
CREATE INDEX idx_booking_user_id ON booking(user_id);

-- Index on booking.property_id (used in JOINs and WHERE filters)
CREATE INDEX idx_booking_property_id ON booking(property_id);

-- Index on booking.status (used in WHERE filters)
CREATE INDEX idx_booking_status ON booking(status);

-- Index on property.id (used in JOINs)
CREATE INDEX idx_property_id ON property(id);

-- Index on property.location (used in WHERE filters or search)
CREATE INDEX idx_property_location ON property(location);

-- Index on review.property_id (used in JOINs and subqueries)
CREATE INDEX idx_review_property_id ON review(property_id);
