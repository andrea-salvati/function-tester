-- Calculate the ond flag based on the StreamUrl column
{% macro ond_parser(StreamUrl)  -%}
CASE
    WHEN "{{ StreamUrl }}" LIKE '%channel=13%'
        OR "{{ StreamUrl }}" LIKE '%channel=33%'
        OR "{{ StreamUrl }}" LIKE '%/channel/13%'
        OR "{{ StreamUrl }}" LIKE '%/channel/33%'
        OR "{{ StreamUrl }}" LIKE '%channel=14%'
        OR "{{ StreamUrl }}" LIKE '%channel=34%'
        OR "{{ StreamUrl }}" LIKE '%/channel/14%'
        OR "{{ StreamUrl }}" LIKE '%/channel/34%'
        OR "{{ StreamUrl }}" LIKE '%channel=15%'
        OR "{{ StreamUrl }}" LIKE '%channel=35%'
        OR "{{ StreamUrl }}" LIKE '%/channel/15%'
        OR "{{ StreamUrl }}" LIKE '%/channel/35%' THEN 1
    ELSE 0
END
{%- endmacro %}
