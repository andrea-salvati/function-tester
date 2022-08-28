-- Calculte if a stream is capable of HD based on playing time, streaming time and avg bitrate
{% macro hd_capable_flag_parser(str_playing_time, str_article_type, str_avg_bitrate, str_total_streaming_time)  -%}
CASE
        WHEN "{{ str_playing_time }}" IS NOT NULL
                AND "{{ str_article_type }}" != 'Highlights'
                AND "{{ str_total_streaming_time }}" >= 120000
                AND "{{ str_avg_bitrate }}" IS NOT NULL THEN 1
        WHEN "{{ str_playing_time }}" IS NOT NULL
                AND "{{ str_article_type }}" = 'Highlights'
                AND "{{ str_total_streaming_time }}" >= 60000
                AND "{{ str_avg_bitrate }}" IS NOT NULL THEN 1
        ELSE 0
        END
{%- endmacro %}
