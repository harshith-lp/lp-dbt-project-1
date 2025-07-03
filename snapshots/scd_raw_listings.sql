{% snapshot scd_raw_listings %}
    {{
        config(
            target_schema='dev',
            target_database='airbnb',
            unique_key='id',
            strategy='timestamp',
            invalidate_hard_deletes=False,
            updated_at='updated_at'
        )
    }}

    select * from {{ source('airbnb', 'listings') }}
 {% endsnapshot %}