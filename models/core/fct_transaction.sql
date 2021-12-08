{{
    config(
        materialized='incremental'
    )
}}

with fct_transaction as (

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

from {{ref('stg_all_transaction')}} A
inner join  {{ref('stg_category')}} B
on A.category = B.original_category
)

select * from fct_transaction

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where date > (select max(date) from {{ this }})

{% endif %}
