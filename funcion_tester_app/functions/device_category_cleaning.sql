-- Improve the str_device_category categorization by using the player name
{% macro device_category_cleaning(device_category, str_player_name)  -%}
CASE
        WHEN "{{ device_category }}" = 'Unknown' AND "{{ str_player_name }}" IN ('Web Player Silverlight'
                                                                        ,'Web Player Shakaplayer'
                                                                        ,'Web Player Hasplayer'
                                                                        ,'Web Player Fairplayplayer') THEN 'Web'
        WHEN "{{ device_category }}" = 'Unknown' AND "{{ str_player_name }}" IN ('Skyq Player HasPlayer') THEN 'Living Room'
        ELSE "{{ device_category }}"
        END
{%- endmacro %}
