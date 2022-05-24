-- Improve the str_device_category categorization by using the player name
{% macro device_hardware_type_cleaning(device_hardware_type_f, str_player_name)  -%}
CASE
        WHEN "{{ device_hardware_type_f }}" = 'Unknown' AND "{{ str_player_name }}" IN ('Skyq Player HasPlayer') THEN 'Set Top Box'
        ELSE "{{ device_hardware_type_f }}"
        END
{%- endmacro %}
