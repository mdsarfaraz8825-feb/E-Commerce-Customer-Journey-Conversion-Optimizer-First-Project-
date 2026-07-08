use ecommerce;

SELECT
    ROUND(
        SUM(p.price) / COUNT(*),
        2
    ) AS average_order_value
FROM events e
JOIN products p
ON e.product_id = p.product_id
WHERE e.event_type = 'purchase';

SELECT
    p.category,
    ROUND(AVG(p.price),2) AS average_order_value
FROM events e
JOIN products p
ON e.product_id=p.product_id
WHERE e.event_type='purchase'
GROUP BY p.category
ORDER BY average_order_value DESC;


SELECT
    e.user_id,
    COUNT(*) AS total_orders,
    ROUND(SUM(p.price),2) AS customer_lifetime_value
FROM events e
JOIN products p
ON e.product_id=p.product_id
WHERE e.event_type='purchase'
GROUP BY e.user_id
ORDER BY customer_lifetime_value DESC;


SELECT COUNT(*)
FROM events
WHERE event_type='purchase';

SELECT
ROUND(SUM(p.price),2)
FROM events e
JOIN products p
ON e.product_id=p.product_id
WHERE event_type='purchase';
