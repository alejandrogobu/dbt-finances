with account as (

  select top 1 account_id,account_name,bank from {{ref('stg_caixa')}}
  
union

  select top 1 account_id,account_name,bank from {{ref('stg_myinvestor')}}
)


select * from account