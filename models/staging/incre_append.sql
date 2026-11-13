{{config(materialized ="incremental",
         incremental_strategy="append", 
         )}}

select 
id,user_id ,	order_date	,status
from {{source('datafeed_shared_schema','raw_orders')}} limit 20