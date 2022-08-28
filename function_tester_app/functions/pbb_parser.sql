-- Calculate the pbb flag based on the StreamUrl column
{% macro pbb_parser(StreamUrl)  -%}
CASE
    WHEN "{{ StreamUrl }}" LIKE '%channel=12%'
        OR "{{ StreamUrl }}" LIKE '%channel=32%'
        OR "{{ StreamUrl }}" LIKE '%/channel/12%'
        OR "{{ StreamUrl }}" LIKE '%/channel/32%'
        OR "{{ StreamUrl }}" LIKE '%channel=37%'
        OR "{{ StreamUrl }}" LIKE '%channel=38%'
        OR "{{ StreamUrl }}" LIKE '%/channel/37%'
        OR "{{ StreamUrl }}" LIKE '%/channel/38%'
        OR "{{ StreamUrl }}" LIKE '%channel=17%'
        OR "{{ StreamUrl }}" LIKE '%channel=18%'
        OR "{{ StreamUrl }}" LIKE '%/channel/17%'
        OR "{{ StreamUrl }}" LIKE '%/channel/18%' THEN 1
    ELSE 0
END
{%- endmacro %}
