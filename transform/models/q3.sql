{{
    config(
        materialized='view'
    )
}}

WITH q3 AS (
    SELECT
      country_name,
      vendor_name,
      count(ditinct id) total_gmv
      from vendors
      group by 1,2
  
)

select country_name, vendor_name, total_gmv from q3
