with
    clients as (
        select
            person.businessentityid
            , case
                when customer.customerid is null then 'Outro'
                else 'Cliente'
            end as type_of_contact 
            , customer.customerid
            , person.title
            , concat(firstname," ", middlename, " ", lastname) as person_name
            , person.suffix
            , person.emailpromotion
            , person.modifieddate
        from 
            {{ref('stg_person')}} as person
        left join
            {{ref('stg_customer')}} as customer on person.businessentityid = customer.personid
    )
select * from clients