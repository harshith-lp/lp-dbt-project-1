{{
    config(
        materialized='view'
    )
}}

SELECT
    *,
    CASE
    WHEN minimum_nights = 0 THEN 1
    ELSE minimum_nights
  END AS minimum_nights_2,
  REPLACE(
    price_str,
    '$'
  ) :: NUMBER(
    10,
    2
  ) AS price,

FROM
{{ ref('src_listings') }}
