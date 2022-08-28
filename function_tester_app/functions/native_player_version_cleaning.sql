-- Clean and standardize the player version column column
{% macro native_player_version_cleaning(NativePlayerVersion)  -%}
CASE
    WHEN "{{ NativePlayerVersion }}" = 'dv.fw=TVJSPlayer' THEN NULL
    WHEN "{{ NativePlayerVersion }}" = 'dv.fw=AVFoundation' THEN NULL
    WHEN "{{ NativePlayerVersion }}" = 'abstract+method' THEN NULL
    ELSE "{{ NativePlayerVersion }}"
END
{%- endmacro %}
