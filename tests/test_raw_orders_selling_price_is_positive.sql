with orders as(
    select * from {{ ref('raw_orders') }}
)

select 
    order_id,
    sum(order_selling_price) total_selling_price
from orders
group by order_id
having total_selling_price < 0