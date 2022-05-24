-- Calculate if a play request is a genuine attempt from the PlayingTime_ms and StartUpError columns
{% macro ebvs_parser(PlayingTime_ms, StartUpError)  -%}
CASE
    WHEN "{{ PlayingTime_ms }}" = 0 AND "{{ StartUpError }}" = 0 then 1
    ELSE 0
END
{%- endmacro %}
