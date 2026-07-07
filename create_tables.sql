CREATE TABLE Customer_Behavior (
	event_time timestamp,
    event_type varchar(50),
    product_id bigint,
    category_id bigint,
    category_code varchar(255),
    brand varchar(255),
    price decimal(10,2),
    user_id bigint,
    user_session varchar(255),
    category varchar(255),
    subcategory varchar(255),
    product varchar(255)
    );
