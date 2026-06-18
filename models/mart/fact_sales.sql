{{
    config(
        materialized='table',
        schema='DWH'
    )
}}

with orders as (
    select 
        order_id,
        customer_id,
        product,
        amount,
        order_date
    from {{ source('src_data', 'raw_sales') }}
),

dim_cust as (
    select
        customer_sk
        ,customer_id
        ,valid_from
        ,valid_to
    from {{ ref('dim_customer') }}
)

select
    o.order_id,
    d.customer_sk,
    o.customer_id,
    o.product,
    o.amount,
    o.order_date
FROM orders o 
LEFT JOIN dim_cust d 
ON o.customer_id = d.customer_id
AND o.order_date >= d.valid_from
AND (
    o.order_date < d.valid_to OR d.valid_to is null 
)

