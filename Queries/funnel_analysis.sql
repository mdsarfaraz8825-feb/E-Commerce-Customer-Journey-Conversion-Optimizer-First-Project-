with funnel as (
    select
        sum(case when event_type = 'view' then 1 else 0 end) as total_views,
        sum(case when event_type = 'cart' then 1 else 0 end) as total_carts,
        sum(case when event_type = 'purchase' then 1 else 0 end) as total_purchases
	from events
)
 select * from funnel;




 with funnel as (
     select 
         sum(case when event_type = 'view' then 1 else 0 end) as total_views,
         sum(case when event_type = 'cart' then 1 else 0 end) as total_carts
	from events
    )
select 
     total_views,
     total_carts,
     round((total_carts*100.0) /total_views, 2) as view_to_cart_conversion
from funnel;



with funnel as (
     select 
        sum(case when event_type = 'cart' then 1 else 0 end) as total_carts,
        sum(case when event_type = 'purchase' then 1 else 0 end) as total_purchases
	from events
) 
select 
     total_carts,
     total_purchases,
     round((total_purchases * 100.0) / total_carts, 2) as cart_to_purchase_conversion
  from funnel;
