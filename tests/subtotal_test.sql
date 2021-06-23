with 
    soh_subtotal as (
        select
            round(sum(subtotal),2) as subtotal
            , 'soma' as sum_test 
        from
            {{ref('stg_salesorderheader')}}
    )
    , fct_subtotal as ( 
        select
            round(sum(product_subtotal),2) as subtotal
            , 'soma' as sum_test
        from 
            {{ref('fct_order_details')}}
    )
    , final as (
        select
            case
                when soh_subtotal.subtotal = fct_subtotal.subtotal then 0
                when soh_subtotal.subtotal != fct_subtotal.subtotal then 1
            end as subtotal_test
        from 
            soh_subtotal
        left join 
            fct_subtotal on soh_subtotal.sum_test = fct_subtotal.sum_test
    )
    
select * from final
where subtotal_test = 1