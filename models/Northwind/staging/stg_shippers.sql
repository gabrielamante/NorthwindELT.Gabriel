with source_data as (
    select
        shipper_id
        , phone
        , company_name
        -- , _sdc_batched_at
        -- , _sdc_table_version
        -- , _sdc_received_at
        -- , _sdc_sequence
    from {{  source('northwind_elt','shippers')  }}
)

select * from source_data