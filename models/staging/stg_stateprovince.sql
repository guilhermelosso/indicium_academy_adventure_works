with
    source as (
        select
            stateprovinceid
            , stateprovincecode
            , countryregioncode
            , isonlystateprovinceflag
            , name as stateprovincename
            , territoryid
            , rowguid
            , modifieddate
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence    
            , _sdc_batched_at
            , _sdc_extracted_at
        from 
            {{source('adventure_works','stateprovince')}}
    )

select * from source
