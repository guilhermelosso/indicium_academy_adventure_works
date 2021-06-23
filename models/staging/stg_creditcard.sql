with
    source as (
        select
            creditcardid
            , cardtype 
            , cardnumber
            , expmonth
            , expyear
            , modifieddate
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence    
            , _sdc_batched_at
            , _sdc_extracted_at
        from 
            {{source('adventure_works','creditcard')}}
    )

select * from source
