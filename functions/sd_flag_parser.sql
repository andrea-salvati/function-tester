-- Calculate the sd flag from the pbb, ond and mob manifest flags, article type, date of the stream, avg bitrate and streaming time
{% macro sd_flag_parser(str_article_type, str_pbb_flag, str_ond_flag, str_mob_manifest_flag, str_avg_bitrate, str_total_streaming_time, str_full_date)  -%}
CASE
        -- Playbox bypass!!!!
        WHEN "{{ str_article_type }}" IN ('Live','Catch Up')
                AND ("{{ str_pbb_flag }}" = 0
                AND "{{ str_ond_flag }}" = 0
                AND "{{ str_mob_manifest_flag }}" = 0)
                AND "{{ str_avg_bitrate }}" >= 0.85*904
                AND "{{ str_total_streaming_time }}" >= 120000 THEN 1
        WHEN "{{ str_article_type }}" IN ('Live','Catch Up')
                AND ("{{ str_pbb_flag }}" = 1 OR "{{ str_ond_flag }}" = 1)
                AND "{{ str_mob_manifest_flag }}" = 0
                AND "{{ str_avg_bitrate }}" >= 0.85*904
                AND "{{ str_total_streaming_time }}" >= 120000 THEN 1
        WHEN "{{ str_article_type }}" IN ('Live','Catch Up')
                AND ("{{ str_pbb_flag }}" = 0
                AND "{{ str_ond_flag }}" = 0
                AND "{{ str_mob_manifest_flag }}" = 1)
                AND "{{ str_avg_bitrate }}" >= 0.85*544
                AND "{{ str_total_streaming_time }}" >= 120000 THEN 1
        WHEN "{{ str_article_type }}" IN ('Live','Catch Up')
                AND "{{ str_full_date }}" >= '2018-08-13'
                AND ("{{ str_pbb_flag }}" = 1 OR "{{ str_ond_flag }}" = 1)
                AND "{{ str_mob_manifest_flag }}" = 1
                AND "{{ str_avg_bitrate }}" >= 0.85*544
                AND "{{ str_total_streaming_time }}" >= 120000 THEN 1
        --New Encoding Ladder on DC1 AND DC2
        WHEN "{{ str_article_type }}" NOT IN ('Live','Catch Up','Highlights')
                AND "{{ str_full_date }}" >= '2018-08-27'
                AND "{{ str_avg_bitrate }}" >= 0.85*904
                AND "{{ str_total_streaming_time }}" >= 120000 THEN 1
        WHEN "{{ str_article_type }}" IN ('Highlights')
                AND "{{ str_full_date }}" >= '2018-08-27'
                AND "{{ str_avg_bitrate }}" >= 0.85*904
                AND "{{ str_total_streaming_time }}" >= 60000 THEN 1
        ELSE 0
        END
{%- endmacro %}
