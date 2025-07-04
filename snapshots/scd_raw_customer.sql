{% snapshot scd_raw_customer %}
    {{
        config(
            target_schema='dev',
            target_database='airbnb',
            unique_key='Customer_ID',
            strategy='check',
            check_cols=['Customer_State'],  
            invalidate_hard_deletes=True
        )
    }}

    select * from {{ source('airbnb', 'customers') }}
{% endsnapshot %}
