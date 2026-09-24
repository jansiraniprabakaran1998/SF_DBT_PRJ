{{ config(materialized = 'view') }}

with source as (
    select * from {{ ref('stg_employee') }}
)
select 
    employee_id as emp_id,
    employee_name as emp_name,
    place as area 
from source