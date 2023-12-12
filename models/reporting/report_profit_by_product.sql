select
product_id,
product_name,
category,
sub_category,
sum(order_profit) as profit
from {{ ref('stg_orders') }}
group by
product_id,
product_name,
category,
sub_category