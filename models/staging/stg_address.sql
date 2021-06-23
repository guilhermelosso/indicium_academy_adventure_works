with
    source as (
        select
            addressid
            , addressline1
            , addressline2
            , city
            , stateprovinceid
            , postalcode
            , spatiallocation
            , rowguid
            , modifieddate
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence    
            , _sdc_batched_at
            , _sdc_extracted_at
        from 
            {{source('adventure_works','address')}}
    )

select * from source
