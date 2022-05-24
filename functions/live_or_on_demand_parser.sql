-- Clean and standardize the C3VideoIsLive column
{% macro live_or_on_demand_parser(C3VideoIsLive)  -%}
CASE
    WHEN "{{ C3VideoIsLive }}" = 'T' THEN 'Live'
    WHEN "{{ C3VideoIsLive }}" = 'F' THEN 'On-Demand'
    ELSE 'Unknown'
END
{%- endmacro %}
