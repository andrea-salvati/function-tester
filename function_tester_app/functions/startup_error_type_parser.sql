-- Calculate the startup error type
{% macro startup_error_type_parser(StartUpTime_ms)  -%}
CASE
    WHEN "{{ StartUpTime_ms }}" = -1 THEN 'Play Unsuccessful'
    WHEN "{{ StartUpTime_ms }}" = -3 THEN 'Could Not Determine Startup Time'
    ELSE NULL
END
{%- endmacro %}
