{{ config(materialized = 'table')}}

select 
     replace(value:employee_id,'"') as employee_id
    ,replace(value:project_id,'"') as project_id
    ,replace(value:project_name,'"') as project_name
    ,replace(value:role_on_project,'"') as role_on_project
    ,replace(value:start_date,'"') as start_date
    ,replace(value:end_date,'"') as end_date
    ,replace(value:ad_access_granted,'"') as ad_access_granted

from {{ source('src_from_dl2','DL2_EMPLOYEE_PROJECT_AD')}},
LATERAL FLATTEN (input => source_data)