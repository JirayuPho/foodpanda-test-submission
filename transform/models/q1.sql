{{
    config(
        materialized='view'
    )
}}

WITH q1 AS (
    SELECT
      country_name,
      sum(gmv_local) total_gmv
      from orders
      group by 1
  
)

select country_name, total_gmv from q1
