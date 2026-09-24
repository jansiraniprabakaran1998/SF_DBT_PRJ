{{
    config(
        materialized='incremental',
        unique_key='id',
        incremental_strategy='merge'
    )
}}

with cte as(
    select * from {{ source('raw', 'sf_dbt_raw_tb') }}
)

select 
    id,
    name,
    location_id,
    location,
    salary
from cte 
{% if is_incremental() %}
where salary>(select max(salary) from {{this}})
{% endif %}

