select 
    replace(value:employee_id,'"') as employee_id
    ,replace(value:exit_date,'"') as exit_date
    ,replace(value:exit_reason,'"') as exit_reason
    ,replace(value:notice_period_days,'"') as notice_period_days
    ,replace(value:last_working_day,'"') as last_working_day
    ,replace(value:eligible_for_rehire,'"') as eligible_for_rehire
    ,replace(value:exit_type,'"') as exit_type

from {{source("src_from_dl2","DL2_EMPLOYEE_EXIT")}},
LATERAL FLATTEN (input => source_data)