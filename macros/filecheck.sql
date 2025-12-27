{% macro filecheck_macro(year,table_name) %}
    {% set result_count %}
        select count(*)
        from {{ table_name }}
        where right(year,4) = {{ year }}
    {% endset %}


{% endmacro %}
