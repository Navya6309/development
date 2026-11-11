select 
try_cast(id as int) as id,
first_name,
last_name
 from {{source('datafeed_shared_schema','raw_customerdata')}}
