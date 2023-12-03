select 
o.order_ID,
o.order_date,
o.Ship_mode,
o.order_selling_price - o.order_cost_price as order_profit,
o.order_selling_price,
o.order_cost_price,
c.customer_name,
c.segment,
c.country,
p.product_name,
p.category,
p.sub_category
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c on o.customer_id = c.customer_id
left join {{ ref('raw_product') }} as p on o.product_id = p.product_id