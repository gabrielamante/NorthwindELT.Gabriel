with source_data as (
    select
        country
        , city
        , postal_code
        , homepage
        , address
        , region
        , supplier_id
        , phone
        , fax
        , company_name
        , contact_title
        , contact_name
        -- , _sdc_batched_at
        -- , _sdc_table_version
        -- , _sdc_received_at
        -- , _sdc_sequence
    from {{  source('northwind_elt','suppliers')  }}
)

select * from source_data