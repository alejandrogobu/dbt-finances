with stg_all_transaction as (

  select * from {{ref('stg_caixa')}}
  
union

  select * from {{ref('stg_myinvestor')}}
)


select * from stg_all_transaction

-- If you want add more bank you need add the stg_ corresponde for this bank and in this stg_all_transaction add the union.
