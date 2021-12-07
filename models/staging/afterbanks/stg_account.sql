with account as (

  select distinct account_id,account_name,bank from {{ref('stg_caixa')}}
  
union all 

  select distinct account_id,account_name,bank from {{ref('stg_myinvestor')}}
)


select * from account