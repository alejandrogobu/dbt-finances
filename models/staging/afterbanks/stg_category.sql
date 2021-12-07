with all_category as (

  select distinct
   category as category,
   min(date) as firs_Date -- First time that this category exist, use this to create the incremental id 
   from {{ref('stg_all_transaction')}}
   group by 1
   order by 2 asc -- Order for the date that first time occurs

),


remove_characters as (
                
  select
  seq8() as category_id,
  {{dbt_utils.surrogate_key(["TRANSLATE(category, 'ÛÌÈ', 'óíé')"])}} as hash,
  category as original_category,
  TRANSLATE(category, 'ÛÌÈ', 'óíé') as category

from all_category

)

select * from remove_characters