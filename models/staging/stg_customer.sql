with
    source as (
        select
            personid
            , customerid
            , territoryid
            , storeid
            , modifieddate
            , rowguid
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence    
            , _sdc_batched_at
            , _sdc_extracted_at
        from 
            {{source('adventure_works','customer')}}
    )
select * from source
