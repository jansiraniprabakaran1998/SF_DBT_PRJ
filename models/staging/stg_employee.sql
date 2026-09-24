with source as (
    select * from {{ source('raw', 'sf_dbt_raw_tb') }}
),
renamed as (
    select 
    id as employee_id,
    name as employee_name,
    location as place 
    from source 
    where salary>50000
    )
    select * from renamed