-- Calculate the hd flag from the origin server, article type, date of the stream, avg bitrate and streaming time
{% macro hd_flag_parser(str_origin_server, str_article_type, str_full_date, str_avg_bitrate, str_total_streaming_time, str_fixture_name, str_pbb_flag, str_ond_flag, str_mob_manifest_flag)  -%}
CASE
        -- DC3 and DC4 Logic
        WHEN ("{{ str_origin_server }}" = 'DC3' OR "{{ str_origin_server }}" = 'DC4')
                AND "{{ str_article_type }}" <> 'Highlights'
                AND "{{ str_full_date }}" >= '2017-10-09'
                AND "{{ str_full_date }}" < '2018-03-01'
                AND "{{ str_avg_bitrate }}" >= 0.85*3128
                AND "{{ str_total_streaming_time }}" >= 120000 THEN 1
        WHEN ("{{ str_origin_server }}" = 'DC3' OR "{{ str_origin_server }}" = 'DC4')
                AND "{{ str_article_type }}" = 'Highlights'
                AND "{{ str_full_date }}" >= '2017-10-09'
                AND "{{ str_full_date }}" < '2018-03-01'
                AND "{{ str_avg_bitrate }}" >= 0.85*3128
                AND "{{ str_total_streaming_time }}" >= 60000 THEN 1
        WHEN ("{{ str_origin_server }}" = 'DC3' OR "{{ str_origin_server }}" = 'DC4')
                AND "{{ str_article_type }}" <> 'Highlights'
                AND "{{ str_full_date }}"  < '2017-10-09'
                AND "{{ str_full_date }}" < '2018-03-01'
                AND "{{ str_avg_bitrate }}" >= 0.85*4256 AND "{{ str_total_streaming_time }}" >= 120000 THEN 1
        WHEN ("{{ str_origin_server }}" = 'DC3' OR "{{ str_origin_server }}" = 'DC4')
                AND "{{ str_article_type }}" = 'Highlights'
                AND "{{ str_full_date }}"  < '2017-10-09'
                AND "{{ str_full_date }}" < '2018-03-01'
                AND "{{ str_avg_bitrate }}" >= 0.85*4256
                AND "{{ str_total_streaming_time }}" >= 60000 THEN 1
        -- DC1 and DC2 Logic including Linear Channel Profile
        WHEN ("{{ str_origin_server }}" = 'DC1' OR "{{ str_origin_server }}" = 'DC2')
                AND "{{ str_full_date }}" >= '2017-09-23'
                AND "{{ str_full_date }}" < '2018-03-01'
                AND "{{ str_fixture_name }}" NOT IN ('NFL Network 247 Channel','Linear One','Linear Two','MLB Network')
                AND "{{ str_article_type }}" <> 'Highlights'
                AND "{{ str_avg_bitrate }}" >= 0.85*5308
                AND "{{ str_total_streaming_time }}" >= 120000 THEN 1
        WHEN ("{{ str_origin_server }}" = 'DC1' OR "{{ str_origin_server }}" = 'DC2')
                AND "{{ str_full_date }}" >= '2017-09-23'
                AND "{{ str_full_date }}" < '2018-03-01'
                AND "{{ str_fixture_name }}" NOT IN ('NFL Network 247 Channel','Linear One','Linear Two','MLB Network')
                AND "{{ str_article_type }}" = 'Highlights'
                AND "{{ str_avg_bitrate }}" >= 0.85*5308
                AND "{{ str_total_streaming_time }}" >= 60000 THEN 1
        WHEN ("{{ str_origin_server }}" = 'DC1' OR "{{ str_origin_server }}" = 'DC2')
                AND "{{ str_full_date }}" >= '2017-09-23'
                AND "{{ str_full_date }}" < '2018-03-01'
                AND "{{ str_fixture_name }}" IN ('NFL Network 247 Channel','Linear One','Linear Two','MLB Network')
                AND "{{ str_article_type }}" <> 'Highlights'
                AND "{{ str_avg_bitrate }}" >= 0.85*3006
                AND "{{ str_total_streaming_time }}" >= 120000 THEN 1
        -- DCN Logic - NFL Shoulder Content
        WHEN ("{{ str_origin_server }}" = 'DCN')
                AND "{{ str_full_date }}" >= '2017-09-23'
                AND "{{ str_article_type }}" = 'Highlights'
                AND "{{ str_avg_bitrate }}" >= 0.85*4128
                AND "{{ str_total_streaming_time }}" >= 60000 THEN 1
        -- Unknown DC - Captures anomalous data as well as DC1, DC2, DC3, DC4 streams pre-September 2017 when streamurl became available
        WHEN "{{ str_origin_server }}" = 'Unknown'
                AND "{{ str_article_type }}" <> 'Highlights'
                AND "{{ str_avg_bitrate }}" >= 0.85*3128
                AND "{{ str_total_streaming_time }}" >= 120000 THEN 1
        WHEN "{{ str_origin_server }}" = 'Unknown'
                AND "{{ str_article_type }}" = 'Highlights'
                AND "{{ str_avg_bitrate }}" >= 0.85*3128
                AND "{{ str_total_streaming_time }}" >= 60000 THEN 1
        -- Data from 1.34 - 1.36.8 has incorrect DC information
        WHEN "{{ str_article_type }}" IN ('Live','Catch Up')
                AND "{{ str_full_date }}" >= '2018-03-01'
                AND "{{ str_full_date }}" < '2018-08-13'
                AND "{{ str_avg_bitrate }}" >= 0.85*3128
                AND "{{ str_total_streaming_time }}" >= 120000 THEN 1
        WHEN "{{ str_article_type }}" NOT IN ('Live','Catch Up','Highlights')
                AND "{{ str_full_date }}" >= '2018-03-01'
                AND "{{ str_full_date }}" < '2018-08-27'
                AND "{{ str_avg_bitrate }}" >= 0.85*5308
                AND "{{ str_total_streaming_time }}" >= 120000 THEN 1
        WHEN "{{ str_article_type }}" IN ('Highlights')
                AND ("{{ str_origin_server }}" <> 'DCN')
                AND "{{ str_full_date }}" >= '2018-03-01'
                AND "{{ str_full_date }}" < '2018-08-27'
                AND "{{ str_avg_bitrate }}" >= 0.85*3128
                AND "{{ str_total_streaming_time }}" >= 60000 THEN 1
        -- Playbox bypass and OND!!!!
        WHEN "{{ str_article_type }}" IN ('Live','Catch Up')
                AND "{{ str_full_date }}" >= '2018-08-13'
                AND ("{{ str_pbb_flag }}" = 0 AND "{{ str_ond_flag }}" = 0)
                AND "{{ str_avg_bitrate }}" >= 0.85*3128
                AND "{{ str_total_streaming_time }}" >= 120000 THEN 1
        WHEN "{{ str_article_type }}" IN ('Live','Catch Up')
                AND "{{ str_full_date }}" >= '2018-08-13'
                AND ("{{ str_pbb_flag }}" = 1 OR "{{ str_ond_flag }}" = 1)
                AND "{{ str_mob_manifest_flag }}" = 0
                AND "{{ str_avg_bitrate }}" >= 0.85*3128
                AND "{{ str_total_streaming_time }}" >= 120000 THEN 1
        WHEN "{{ str_article_type }}" IN ('Live','Catch Up')
                AND "{{ str_full_date }}" >= '2018-08-13'
                AND ("{{ str_pbb_flag }}" = 1 OR "{{ str_ond_flag }}" = 1)
                AND "{{ str_mob_manifest_flag }}" = 1
                AND "{{ str_avg_bitrate }}" >= 0.85*2364
                AND "{{ str_total_streaming_time }}" >= 120000 THEN 1
        -- New Encoding Ladder on DC1 and DC2
        WHEN "{{ str_article_type }}" NOT IN ('Live','Catch Up','Highlights')
                AND "{{ str_full_date }}" >= '2018-08-27'
                AND "{{ str_avg_bitrate }}" >= 0.85*3128
                AND "{{ str_total_streaming_time }}" >= 120000 THEN 1
        WHEN "{{ str_article_type }}" IN ('Highlights')
                AND ("{{ str_origin_server }}" <> 'DCN')
                AND "{{ str_full_date }}" >= '2018-08-27'
                AND "{{ str_avg_bitrate }}" >= 0.85*3128
                AND "{{ str_total_streaming_time }}" >= 60000 THEN 1
        ELSE 0
        END
{%- endmacro %}
