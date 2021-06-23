with
    source as (
        select
            productid
            , name as product_name
            , productnumber
        from 
            {{source('adventure_works','product')}}
    )

select * from source