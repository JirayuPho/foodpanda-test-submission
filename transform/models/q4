{{
    config(
        materialized='view'
    )
}}

WITH q4 AS (
    SELECT
      extract(year from orders.date_local) year,
      orders.country_name country_name,
      vendors.vendor_name vendor_name,
      sum(orders.gmv_local) total_gmv
      from orders left join vendors on orders.vendor_id = vendors.id
      group by 1,2,3
  )

with q4_2 as (select *, rank() over(partition by  year,country_name,vendor_name order by total_gmv DESC) rank from q4)

select year,country_name,vendor_name,total_gmv from q4_2 where rank <=2
