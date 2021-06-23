with
    order_details as (
        select
            so_details.salesorderdetailid
            , so_details.salesorderid
            , so_details.orderqty
            , so_details.productid
            , so_details.unitprice
            , so_details.unitpricediscount
            , so_details.unitprice * so_details.orderqty *(1 - so_details.unitpricediscount) as product_subtotal
            , so_header.billtoaddressid as bill_address_id
            , so_header.shiptoaddressid as address_id
            , so_header.onlineorderflag
            , so_header.status
            , date(so_header.orderdate) as order_date
            , so_header.creditcardid        
            , so_header.duedate
            , so_header.totaldue
            , so_header.customerid   
        from 
            {{ref('stg_salesorderdetail')}} as so_details
        left join
            {{ref('stg_salesorderheader')}} as so_header on  so_details.salesorderid = so_header.salesorderid 
    )

select * from order_details