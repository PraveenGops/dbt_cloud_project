{{ config(materialized = 'incremental',
          unique_key = 'employee_id',
          incremental_strategy = 'merge') }}

select * from {{ref("emp_details_int")}}

{% if is_incremental() %}
    where etl_created_ts > ( select max(etl_created_ts) from {{ this}})
{% endif %}