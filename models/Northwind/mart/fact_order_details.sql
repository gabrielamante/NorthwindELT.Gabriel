{{ config(materialized='table') }}

with products as (
        select product_id
        from {{ ref('dim_products') }}
    )
    , orders as (
    select order_id
        from {{ ref('dim_suppliers') }}
    )
    , orders_details_final as (
    select
        orders.order_id
        , products.product_id
        , order_details.unit_price
        , order_details.quantity
        , order_details.discount
    from {{ ref('stg_order_details') }} order_details
    left join orders on order_details.order_id = orders.order_id
    left join products on order_details.product_id = products.product_id
)

select * from order_details_final