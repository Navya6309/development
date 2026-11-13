with customers as(
    select id as customer_id,
first_name,
last_name 
from {{ref('emphr')}}
),

orders as (
select  
id as order_id
,user_id as customer_id ,	order_date	,status
from {{ref('orders')}}
),

customer_orders as(
select
customer_id,
max(order_date) as last_order_dt,
min(order_date) as first_order_dt,
count(order_id) as numberoforders
from orders
group by 1
),

final as(
select 
customers.customer_id,
customers.first_name,
customers.last_name,
customer_orders.first_order_dt,
customer_orders.last_order_dt,
coalesce(customer_orders.numberoforders,0) as numberoforders
from 
customers 
left join customer_orders using(customer_id) 
)

select * from final