-- Clean and standardize the AutoPlay column
{% macro automatic_or_manual_play_parser(AutoPlay)  -%}
CASE
    WHEN LOWER("{{ AutoPlay }}") = 'true' THEN 'Automatic'
    WHEN LOWER("{{ AutoPlay }}") = 'false' THEN 'Manual'
    ELSE 'Unknown'
END
{%- endmacro %}
