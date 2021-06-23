with
    source as (
        select 
            purchaseordernumber 
            , shipmethodid 
            , salesorderid        
            , billtoaddressid
            , salespersonid
            , modifieddate
            , rowguid
            , taxamt
            , shiptoaddressid
            , onlineorderflag
            , territoryid
            , status
            , currencyrateid
            , orderdate
            , creditcardapprovalcode
            , subtotal        
            , creditcardid        
            , revisionnumber
            , freight
            , duedate
            , totaldue
            , customerid
            , shipdate
            , accountnumber           
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence    
            , _sdc_batched_at
            , _sdc_extracted_at

        from 
            {{source('adventure_works','salesorderheader')}}
    )

select * from source


