with source_data as (
    select
        product_id
        , units_in_stock
        , category_id
        , unit_price
        , product_name
        , quantity_per_unit
        , supplier_id
        , units_on_order
        , discontinued
        , reorder_level
        --, _sdc_table_version
        --, _sdc_received_at
        --, _sdc_batched_at
    from {{  source('northwind_elt','products')  }}
)

select * from source_data