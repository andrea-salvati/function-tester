-- Clean and standardize the CommentatoryLanguage column
{% macro commentatory_language_cleaning(CommentatoryLanguage)  -%}
CASE
    WHEN "{{ CommentatoryLanguage }}" = 'audio_eng' THEN 'en'
    WHEN "{{ CommentatoryLanguage }}" = 'eng' THEN 'en'
    WHEN "{{ CommentatoryLanguage }}" IN ('OFF','und','de','es' ,'en','it','deu','ja','pt') THEN "{{ CommentatoryLanguage }}"
    ELSE NULL
END
{%- endmacro %}
