{{
    config(
        materialized='view'
    )
}}

WITH q3 AS (
    SELECT
      orders.country_name country_name,
      vendors.vendor_name vendor_name,
      sum(orders.gmv_local) total_gmv
      from orders left join vendors on orders.vendor_id = vendors.id
      group by 1,2
  
)

select country_name,vendor_name,total_gmv from q3
