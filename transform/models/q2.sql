{{
    config(
        materialized='view'
    )
}}

WITH q2 AS (
    SELECT
      orders.country_name country_name,
      vendors.vendor_name vendor_name,
      count(distinct orders.customer_id) customer_count,
      sum(orders.gmv_local) total_gmv
      from orders left join vendors on orders.vendor_id = vendors.id
      group by 1,2
  
)

select vendor_name,customer_count,total_gmv from q2 where country_name = "Taiwan"
