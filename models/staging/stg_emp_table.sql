{{ config(materialized = 'table') }}

with cte as (
    select * from {{ source('raw', 'sf_dbt_raw_tb') }}
)
select 
    id as emp_id,
    name as emp_name,
    location as area, 
    salary as Monthly_pay,
    Salary*12 as LPA
from cte