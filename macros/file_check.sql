
{% macro check_file_count(table_name)%}

	{% if execute %}
		{%- set query -%}
			select count(*) from {{table_name}}
		{%- endset -%}
	
	{%- set results = run_query(query) -%}
	{%- set row_count = results.columns[0].values()[0] | int -%}

    {{ log("row_count: " ~ row_count, info=True) }}

	
	{% if row_count == 0 %}
		{{ exceptions.raise_compiler_error("error no data in " ~ table_name) }}
	{% endif %}

	{% endif %}
	
	{{return('Validation passed') }}

{% endmacro %}