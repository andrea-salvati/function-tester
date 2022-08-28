-- Clean and standardize the ClosedCaptionLanguage column
{% macro caption_language_cleaning(closed_caption_language)  -%}
CASE
    WHEN "{{ closed_caption_language }}" IN ('OFF', 'off') THEN 'OFF'
    ELSE NULL
END
{%- endmacro %}
