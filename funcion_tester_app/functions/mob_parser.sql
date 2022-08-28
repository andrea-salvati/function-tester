-- Calculate the mob manifest flag based on the StreamUrl column
{% macro mob_parser(StreamUrl)  -%}
CASE
    WHEN "{{ StreamUrl }}" LIKE '%/mob/%'
        OR "{{ StreamUrl }}" LIKE '%/mob25f/%'
        OR "{{ StreamUrl }}" LIKE '%/all/%' THEN 1
    ELSE 0
END
{%- endmacro %}
