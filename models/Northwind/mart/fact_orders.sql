{{ config(materialized='table') }}

with
    customers as (
        select
        customer_sk
        , customer_id
        from {{ ref('dim_customers') }}
    )
    , products as (
        select product_id
        from {{ ref('dim_products') }}
    )
    , suppliers as (
    select supplier_id
        from {{ ref('dim_suppliers') }}
    )
    , shippers as (
    select shipper_id
        from {{ ref('dim_shippers') }}
    )
, orders_with_sk as (
    select
        orders.order_id
        , customers.customer_id
        , shippers.shipper_id
        , orders.order_date
        , orders.ship_region
        , orders.shipped_date
        , orders.ship_country
        , orders.ship_address
        , orders.ship_postal_code
        , orders.ship_city
        , orders.ship_name
        , orders.freight
        , orders.required_date
    from {{ ref('stg_orders') }} orders
    left join customers on orders.customer_id = customers.customer_id
    left join shippers on orders.shipper_id = shippers.shipper_id
)

select * from orders_with_sk