with dim_category as (

    select
        category_id as category_id,
        category as category
    from {{ref('stg_category')}} 
)

select * from dim_category