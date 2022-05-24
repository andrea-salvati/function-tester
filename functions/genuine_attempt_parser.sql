-- Calculate if a play request is a genuine attempt from the PlayingTime_ms and StartUpError columns
{% macro genuine_attempt_parser(PlayingTime_ms, StartUpError)  -%}
CASE
    WHEN "{{ PlayingTime_ms }}" IS NOT NULL THEN 1
    WHEN "{{ PlayingTime_ms }}" IS NULL AND "{{ StartUpError }}" = True THEN 1
    WHEN "{{ PlayingTime_ms }}" IS NULL AND "{{ StartUpError }}" = False THEN 0
    ELSE 0
END
{%- endmacro %}
