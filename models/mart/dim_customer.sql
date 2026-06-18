{{ config(
        materialized = 'table',
        schema = 'DWH'    
)}}


---- TO GENERATE SK -- CHOOSING CUSTOMER_ID+VALID_FROM

SELECT {{ dbt_utils.generate_surrogate_key(['CUSTOMER_ID','DBT_VALID_FROM'])}} as customer_sk,

    customer_id,
    first_name,
    last_name,
    email,
    city,

      -- SCD2 validity window
  dbt_valid_from            AS valid_from,
  dbt_valid_to              AS valid_to,

 --- flag


 case 
    when dbt_valid_to is null then True
    else False end as is_current

,dbt_updated_at            AS record_updated_at

from  {{ref('snap_customers')}}

