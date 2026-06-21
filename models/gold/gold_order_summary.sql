with
    silver_orders as (select * from {{ ref("silver_orders") }}),
    silver_lineitem as (select * from {{ ref("silver_lineitem") }})

select
    o.order_date,
    o.market_segment,
    o.region_key as region_name,
    count(distinct o.order_key) as total_orders,
    sum(l.extended_price * (1 - l.discount)) as total_revenue,
    avg(l.quantity) as avg_quantity,
    avg(l.discount) as avg_discount
from silver_orders o
join silver_lineitem l on o.order_key = l.order_key
group by 1, 2, 3
