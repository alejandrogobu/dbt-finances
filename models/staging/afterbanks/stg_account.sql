with account as (

  select distinct account_id,account_name,bank from {{ref('stg_all_transaction')}}

)

select * from account