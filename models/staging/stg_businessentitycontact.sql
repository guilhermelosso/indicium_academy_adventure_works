with
    source as (
        select
            personid 		
            , businessentityid
            , contacttypeid
            , rowguid
            , modifieddate
            , _sdc_received_at
            , _sdc_table_version
            , _sdc_sequence
            , _sdc_batched_at
            , _sdc_extracted_at
        from 
            {{source('adventure_works','businessentitycontact')}}
    )

select * from source