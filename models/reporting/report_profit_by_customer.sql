select
customer_id,
segment,
country,
sum(order_profit) as profit
from {{ ref('stg_orders') }}
group by 
customer_id,
segment,
country