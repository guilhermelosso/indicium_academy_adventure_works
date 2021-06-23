with
    source as (
        select
            salesreasonid
            , name as sales_reason
            , reasontype as sales_type
            , modifieddate
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence    
            , _sdc_batched_at
            , _sdc_extracted_at
        from 
            {{source('adventure_works','salesreason')}}
    )

select * from source
