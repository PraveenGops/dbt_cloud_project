{{ config(materialized = 'table')}}

select * from {{ ref("project_ad_assignment_int")}}