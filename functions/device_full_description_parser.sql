-- Improve the device_full_description categorization by using the player name
{% macro device_full_description_parser(device_full_description, str_player_name)  -%}
    CASE
        WHEN "{{ device_full_description }}" = 'Other' AND "{{ str_player_name }}" IN ('Web Player Silverlight') THEN 'Internet Explorer'
        WHEN "{{ device_full_description }}" = 'Other' AND "{{ str_player_name }}" IN ('Web Player Shakaplayer') THEN 'Shaka (Chrome-Firefox-Opera)'
        WHEN "{{ device_full_description }}" = 'Other' AND "{{ str_player_name }}" IN ('Web Player Hasplayer') THEN 'Edge'
        WHEN "{{ device_full_description }}" = 'Other' AND "{{ str_player_name }}" IN ('Web Player Fairplayplayer') THEN 'Safari'
        WHEN "{{ device_full_description }}" = 'Other' AND "{{ str_player_name }}" IN ('Skyq Player HasPlayer') THEN 'Sky Q'
        ELSE "{{ device_full_description }}"
        END
{%- endmacro %}
