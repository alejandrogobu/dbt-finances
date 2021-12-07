with all_raw as(

select * from {{ref('stg_all_transaction')}}

),

fct_transaction as (

select

  A.id as id,
  A.id_order_transaction as id_order_transaction,
  A.account_id as account_id,
  A.date as date,
  A.description as description,
  B.category_id as category_id,
  A.amount as amount,
  A.account_balance as account_balance,
  A.etl_load as etl_load

from all_raw A
inner join  {{ref('stg_category')}} B
on A.category = B.original_category
)

select * from fct_transaction