-- Calculate the cdn based on the time of the stream (before or after 2017-09-23) and the StreamUrl
{% macro cdn_parser(start_time_unix, stream_url)  -%}
CASE
    WHEN "{{ start_time_unix }}" >= 1506124800 AND LEFT("{{ stream_url }}",40) ILIKE '%akamai%' THEN 'Akamai'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND LEFT("{{ stream_url }}",40) ILIKE '%ll%' THEN 'Limelight'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND LEFT("{{ stream_url }}",40) ILIKE '%cf%' THEN 'Amazon'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND "{{ stream_url }}" ILIKE '%perform.secure.footprint.net%' THEN 'CenturyLink'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND LEFT("{{ stream_url }}",40) ILIKE '%fw%' THEN 'Flow'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND LEFT("{{ stream_url }}",40) ILIKE '%vn%' THEN 'Verizon'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND LEFT("{{ stream_url }}",40) ILIKE '%un%' THEN 'UDN'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND LEFT("{{ stream_url }}",40) ILIKE '%dr%' THEN 'DLVR'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND LEFT("{{ stream_url }}",40) ILIKE '%ac%' THEN 'Amazon'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND LEFT("{{ stream_url }}",40) ILIKE '%ak%' THEN 'Akamai'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND LEFT("{{ stream_url }}",40) ILIKE '%cl%' THEN 'CenturyLink'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND "{{ stream_url }}" ILIKE '%dazn.secure.footprint.net%' THEN 'CenturyLink'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND LEFT("{{ stream_url }}",40) ILIKE '%llit%' THEN 'Limelight'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND LEFT("{{ stream_url }}",40) ILIKE '%lldach%' THEN 'Limelight'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND LEFT("{{ stream_url }}",40) ILIKE '%llca%' THEN 'Limelight'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND LEFT("{{ stream_url }}",40) ILIKE '%lles%' THEN 'Limelight'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND LEFT("{{ stream_url }}",40) ILIKE '%az%' THEN 'Microsoft Azure'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND LEFT("{{ stream_url }}",40) ILIKE '%gc%' THEN 'Google'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND LEFT("{{ stream_url }}",40) ILIKE '%ms%' THEN 'Mainstreaming'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND LEFT("{{ stream_url }}",40) ILIKE '%br%' THEN 'Broadpeak'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND LEFT("{{ stream_url }}",40) ILIKE '%sh%' THEN 'Stackpath'
    WHEN "{{ start_time_unix }}" >= 1506124800 AND "{{ stream_url }}" IS NULL THEN 'Unknown'
    WHEN "{{ start_time_unix }}" < 1506124800 THEN NULL
    ELSE 'Other'
END
{%- endmacro %}
