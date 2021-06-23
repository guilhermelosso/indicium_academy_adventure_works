with
    credit_card as (
        select
            creditcardid
            , cardtype 
            , cardnumber
            , expmonth
            , expyear
            , modifieddate
        from
            {{ref('stg_creditcard')}}
    )
select * from credit_card