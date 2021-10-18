with source_data as (
    select
        order_id
        , product_id
        , unit_price
        , quantity
        , discount
        -- , _sdc_batched_at
        -- , _sdc_table_version
        -- , _sdc_received_at
        -- , _sdc_sequence
    from {{  source('northwind_elt','order_details')  }}
)

select * from source_data