-- Calculate if a play request is engaged (2 minutes of autoplay or manually selected)
{% macro engaged_play(total_streaming_time_ms, automatic_or_manual_play, playing_time_ms)  -%}
CASE
    WHEN ((("{{ total_streaming_time_ms }}"/1000) > 120 OR ("{{ automatic_or_manual_play }}" in ('Manual', 'Unknown'))) AND "{{ playing_time_ms }}" > 0) THEN 1
    ELSE 0
END
{%- endmacro %}
