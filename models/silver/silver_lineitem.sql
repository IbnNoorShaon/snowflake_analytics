with
    cte_lineitem as (select * from {{ ref("bronze_lineitem") }}),
    cte_orders as (select * from {{ ref("bronze_orders") }}),
    cte_part as (select * from {{ ref("bronze_part") }}),
    cte_supplier as (select * from {{ ref("bronze_supplier") }})

select
    l.order_key,
    l.line_number,
    l.quantity,
    l.extended_price,
    l.discount,
    l.tax,
    l.return_flag,
    l.ship_date,
    l.ship_mode,
    l.extended_price * (1 - l.discount) as net_price,
    o.order_date,
    o.order_status,
    p.part_name,
    p.type as part_type,
    s.supplier_name,
    s.nation_key as supplier_nation_key
from cte_lineitem l
left join cte_orders o on l.order_key = o.order_key
left join cte_part p on l.part_key = p.part_key
left join cte_supplier s on l.supplier_key = s.supplier_key
