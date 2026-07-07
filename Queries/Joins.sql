select
     e.event_time,
     e.event_type,
     p.product,
     p.brand,
     p.price
from events e
join products p
ON e.product_id = p.product_id
limit 10;


select
    p.product,
    count(*) as total_events
from events e
join products p
on e.product_id = p.product_id
group by p.product
order by total_events desc
limit 10;



select
     e.event_time,
     e.event_type,
     p.product,
     p.brand,
     p.price
from events e
join products p
ON e.product_id = p.product_id
limit 10;




select
     e.event_time,
     e.event_type,
     u.user_id,
     p.product,
     p.brand,
     p.price
from events e
join users u
on e.user_id = u.user_id
join products p
on e.product_id = p.product_id
limit 10;



SELECT
    p.product_id,
    p.product,
    p.brand,
    COUNT(*) AS abandoned_count
FROM events e
JOIN products p
ON e.product_id = p.product_id
WHERE e.event_type = 'cart'
AND e.product_id NOT IN (
    SELECT product_id
    FROM events
    WHERE event_type = 'purchase'
)
GROUP BY
    p.product_id,
    p.product,
    p.brand
ORDER BY abandoned_count DESC
LIMIT 10;




select
    p.brand,
	p.product_id,
    count(*) as abandoned_carts
from events e
join products p
on e.product_id = p.product_id
where e.event_type = 'cart'
and e.product_id not in (
     select product_id
     from events
     where event_type = 'purchase'
)
group by
    p.brand,
    p.product_id
order by abandoned_carts desc;





select
   p.brand,
   round(avg (p.price),2) as average_price,
   count(*) as abandoned_carts
from events e
join products p
on e.product_id = p.product_id
where e.event_type = 'cart'
and e.product_id not in(
     select product_id
     from events
     where event_type = 'purchase'
)
group by p.brand
order by abandoned_carts desc;




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




SELECT
ROUND(SUM(p.price),2)
FROM events e
JOIN products p
ON e.product_id=p.product_id
WHERE event_type='purchase';
