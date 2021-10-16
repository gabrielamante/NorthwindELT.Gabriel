with source_data as (
    select
        country
        , city
        , postal_code
        , address
        , region
        , customer_id
        , contact_name
        , phone
        , fax
        , company_name
        , contact_title
        -- , _sdc_batched_at
        -- , _sdc_extracted_at
        -- , _sdc_table_version
        -- , _sdc_received_at
        -- , _sdc_sequence
    from {{  source('northwind_elt','customers')  }}
)

select * from source_data