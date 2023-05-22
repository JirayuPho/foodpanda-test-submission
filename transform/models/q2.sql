{{
    config(
        materialized='view'
    )
}}

WITH q2 AS (
    SELECT
      vendor_name,
      count(ditinct id) customer_count,
      count(ditinct id) total_gmv
      from vendors
      group by 1
      where country_name = "Taiwan"
  
)

select country_name, customer_count, total_gmv from q2
