with all_category as (

  select distinct category from {{ref('stg_all_transaction')}}

),


remove_characters as (
                
  select
  seq8() as category_id,
  md5(TRANSLATE(category, 'ÛÌÈ', 'óíé')) as hash,
  category as original_category,
  TRANSLATE(category, 'ÛÌÈ', 'óíé') as category

from all_category
order by category_id asc

)

select * from remove_characters