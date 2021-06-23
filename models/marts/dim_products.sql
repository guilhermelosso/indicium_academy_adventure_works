with
    products as (
        select
            productid
            , product_name
            , productnumber
        from 
            {{ref('stg_product')}}
    )
select * from products