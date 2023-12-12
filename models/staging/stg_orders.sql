select 
{{ dbt_utils.generate_surrogate_key(['o.order_ID', 'c.customer_id','p.product_id']) }} as sk_orders,
o.order_ID,
o.order_date,
o.Ship_mode,
o.order_selling_price - o.order_cost_price as order_profit,
o.order_selling_price,
o.order_cost_price,
c.customer_id,
c.customer_name,
c.segment,
c.country,
p.product_id,
p.product_name,
p.category,
p.sub_category,
{{ markup('order_selling_price', 'order_cost_price') }} as markup,
d.delivery_team
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c on o.customer_id = c.customer_id
left join {{ ref('raw_product') }} as p on o.product_id = p.product_id
left join {{ ref('delivery_team') }} as d on o.ship_mode = d.Shipmode