{{ config(materialized = 'table')}}

with ad_src as 
    ( select EMPLOYEE_ID,PROJECT_ID,PROJECT_NAME,ROLE_ON_PROJECT,START_DATE, end_date,ad_access_granted
        from {{ ref('project_ad_assignment_src')}} )
,

emp_src as (
    select EMPLOYEE_ID, FIRST_NAME,LAST_NAME,EMPLOYMENT_STATUS

    from {{ref("emp_details_src")}}
)
,
join_details as (
    select a.EMPLOYEE_ID as EMPLOYEE_ID
       ,a.PROJECT_ID as PROJECT_ID
       ,a.PROJECT_NAME as PROJECT_NAME
       ,a.ROLE_ON_PROJECT as ROLE_ON_PROJECT
       ,a.START_DATE as START_DATE
       ,a.end_date as end_date
       ,a.ad_access_granted as ad_access_granted
       ,e.FIRST_NAME as FIRST_NAME
       ,e.LAST_NAME as LAST_NAME
       ,e.EMPLOYMENT_STATUS as EMPLOYMENT_STATUS
       
    from  emp_src e
    JOIN  ad_src a
    ON e.employee_id = a.employee_id 
    )
,
final as (
    select
    employee_id,
    case when ad_access_granted = true then 'PL'||employee_id
         when ad_access_granted = false and EMPLOYMENT_STATUS is null then null   
         when ad_access_granted = false then employee_id
    end as eagle_id,
    FIRST_NAME,LAST_NAME,
    project_id,project_name,role_on_project,start_date,end_date, ad_access_granted
    from join_details
)

select * from final