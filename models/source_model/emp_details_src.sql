select 
     replace(source_data:employee_id,'"') as employee_id
    ,replace(source_data:first_name,'"') as first_name
    ,replace(source_data:last_name,'"') as last_name
    ,replace(source_data:gender,'"') as gender
    ,replace(source_data:hire_date,'"') as hire_date
    ,replace(source_data:designation,'"') as designation
    ,replace(source_data:department,'"') as department
    ,replace(source_data:salary,'"') as salary
    ,replace(source_data:employment_status,'"') as employment_status
    ,replace(source_data:location.city,'"') as city
    ,replace(source_data:location.country,'"') as country
    ,replace(source_data:location.state,'"') as state
    ,replace(source_data:manager_id,'"') as manager_id
    ,replace(source_data:phone,'"') as phone
    ,replace(source_data:termination_date,'"') as termination_date
from {{ source("src_from_dl2","DL2_EMPLOYEE_RAW") }}