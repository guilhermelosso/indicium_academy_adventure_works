with
    sales_reason as (
        select
            so_details.salesorderdetailid
            , so_details.salesorderid
            , so_details.orderqty
            , so_details.productid
            , product.product_name
            , so_details.unitprice
            , so_details.unitpricediscount
            , so_details.unitprice * so_details.orderqty *(1 - so_details.unitpricediscount) as product_subtotal
            , so_header.billtoaddressid as bill_address_id
            , so_header.shiptoaddressid as address_id
            , so_header.onlineorderflag
            , so_header.status
            , date(so_header.orderdate) as order_date
            , so_header.creditcardid
            , case 
                when credit_card.cardtype is null then 'Sem Cartão'
                else credit_card.cardtype
            end as card_type        
            , so_header.duedate
            , so_header.totaldue
            , so_header.customerid
            , person.person_name
            , case
                when sales_type is null then 'Não informado'
                else sales_type
            end as sales_reason_type  
        from 
            {{ref('stg_salesorderdetail')}} as so_details
        left join
            {{ref('stg_salesorderheader')}} as so_header on so_details.salesorderid = so_header.salesorderid
        left join 
            {{ref('dim_products')}} as product on so_details.productid = product.productid
        left join 
            {{ref('dim_creditcard')}} as credit_card on so_header.creditcardid = credit_card.creditcardid
        left join 
            {{ref('dim_person')}} as person on so_header.customerid = person.customerid    
        left join
            {{ref('stg_salesorderheadersalesreason')}} as soh_salesreason on soh_salesreason.salesorderid = so_details.salesorderid
        left join    
            {{ref('stg_salesreason')}} as sales_reason on soh_salesreason.salesreasonid = sales_reason.salesreasonid
    )
select * from sales_reason

