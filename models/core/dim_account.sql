{{
    config(
        materialized='table'
    )
}}


with dim_account as (

    select
        account_id as account_id,
        account_name as account_name,
        bank as bank   
    from {{ref('stg_account')}} 
)

select * from dim_account