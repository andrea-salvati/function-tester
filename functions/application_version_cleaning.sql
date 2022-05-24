-- Clean and standardize the ApplicationVersion column
{% macro application_version_cleaning(ApplicationVersion)  -%}
CASE
    WHEN "{{ ApplicationVersion }}" NOT RLIKE '[0-9].*[.].*' THEN 'Unknown'
    WHEN "{{ ApplicationVersion }}" LIKE '%%%' AND LENGTH("{{ ApplicationVersion }}") < 10 THEN SPLIT_PART("{{ ApplicationVersion }}",'%',1)
    WHEN "{{ ApplicationVersion }}" IS NULL THEN 'Unknown'
    ELSE "{{ ApplicationVersion }}"
END
{%- endmacro %}
