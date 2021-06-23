with
    source as (
        select
            salesorderid
            , salesreasonid 
            , modifieddate
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence    
            , _sdc_batched_at
            , _sdc_extracted_at
        from 
            {{source('adventure_works','salesorderheadersalesreason')}}
    )

select * from source


