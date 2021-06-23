with
    source as (
        select
            businessentityid
            , firstname
            , middlename
            , lastname
            , title
            , namestyle
            , suffix
            , emailpromotion
            , rowguid
            , modifieddate
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence    
            , _sdc_batched_at
            , _sdc_extracted_at
        from 
            {{source('adventure_works','person')}}
    )

select * from source