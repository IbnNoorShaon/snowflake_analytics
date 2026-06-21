with
    orders as (select * from {{ ref("bronze_orders") }}),
    customers as (select * from {{ ref("bronze_customers") }}),
    nation as (select * from {{ ref("bronze_nation") }}),
    region as (select * from {{ ref("bronze_region") }})

select
    o.order_key,
    o.order_date,
    o.order_status,
    o.total_price,
    o.order_priority,
    c.customer_key,
    c.customer_name,
    c.market_segment,
    n.nation_name,
    r.region_key
from orders o
left join customers c on o.customer_key = c.customer_key
left join nation n on c.nation_key = n.nation_key
left join region r on n.region_key = r.region_key
