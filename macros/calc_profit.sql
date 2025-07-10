{% macro generate_profit_table(table_name) %}
    select
        product_id,
        sum(quantity_sold * unit_sell_price) as total_revenue,
        sum(quantity_sold * unit_purchase_cost) as total_cost,
        sum(quantity_sold * unit_sell_price)
        - sum(quantity_sold * unit_purchase_cost) as total_profit
    from {{ source("airbnb", table_name) }}
    group by product_id
{% endmacro %}
