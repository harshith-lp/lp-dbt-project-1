{{
    config(
        materialized='table'
    )
}}

select 
HOST_ID,
is_superhost,
created_at,
updated_at,
NVL(
        host_name,
        'Anonymous'
    ) AS host_name

    from {{ref('src_hosts')}}

   
    
