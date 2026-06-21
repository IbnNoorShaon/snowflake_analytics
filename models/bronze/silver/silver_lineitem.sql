with lineitem as (
      select * from {{ ref('bronze_lineitem') }}
  ),
  orders as (
      select * from {{ ref('bronze_orders') }}
  ),
  part as (
      select * from {{ ref('bronze_part') }}
  ),
  supplier as (
      select * from {{ ref('bronze_supplier') }}
  )

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
      p.name            as part_name,
      p.type            as part_type,
  )

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
      p.name            as part_name,
      p.type            as part_type,
      s.name            as supplier_name,
      s.nation_key      as supplier_nation_key
  from lineitem l
  left join orders   o on l.order_key  = o.order_key
  left join part     p on l.part_key   = p.part_key
  left join supplier s on l.supplier_key = s.supplier_key