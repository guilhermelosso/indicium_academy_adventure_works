with
    addr_city as (
        select
            addressid
            , city
            , stateprovinceid
            , postalcode
        from 
            {{ref('stg_address')}}
    )  
    , state_province as (
        select
            stateprovinceid
            , stateprovincecode
            , countryregioncode
            , stateprovincename
            , territoryid
        from 
            {{ref('stg_stateprovince')}}
    )  
    , country_region as (
        select
            countryregioncode
            , countryname
        from 
            {{ref('stg_countryregion')}}
    )
    , final_address as (
        select
            addr_city.addressid
            , addr_city.stateprovinceid
            , st_prov.territoryid
            , st_prov.stateprovincecode
            , count_reg.countryregioncode
            , addr_city.city
            , st_prov.stateprovincename
            , count_reg.countryname
        from
            addr_city
        left join
            state_province as st_prov on addr_city.stateprovinceid = st_prov.stateprovinceid
        left join
            country_region as count_reg on st_prov.countryregioncode = count_reg.countryregioncode
    )
select * from final_address
