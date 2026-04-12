{{ config(materialized = 'table')}}

select *,
    case
      when TERMINATION_DATE is null then 'Y'
      else 'N'
      end as emp_active_ind,  
    current_timestamp() as etl_created_ts
     from {{ ref('emp_details_src')}}