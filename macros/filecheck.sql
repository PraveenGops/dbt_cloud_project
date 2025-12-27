{% macro filecheck_macro(year,table_name) %}
    {% set result_count %}
        select count(*) as CNT
        from {{ table_name }}
        where right(year,4) = '{{ year }}'
    {% endset %}

{% set result = run_query(query) %}
{{ return(result.rows[0]['CNT']) }}


{% endmacro %}
