use ecommerce;

CREATE INDEX idx_product_id
ON events(product_id);

CREATE INDEX idx_user_id
ON events(user_id);

CREATE INDEX idx_event_type
ON events(event_type);

CREATE INDEX idx_event_time
ON events(event_time);

SHOW INDEX FROM events;
