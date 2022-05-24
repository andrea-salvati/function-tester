-- Clean and standardize the origin server column
{% macro origin_server_parser(StartTime_unixtime, StreamUrl, C3DeRs)  -%}
CASE
    WHEN "{{ StartTime_unixtime }}" >= 1506124800 AND LEFT("{{ StreamUrl }}",40) ILIKE '%dc3%' then 'DC3'
    WHEN "{{ StartTime_unixtime }}" >= 1506124800 AND LEFT("{{ StreamUrl }}",40) ILIKE '%dc2%' then 'DC2'
    WHEN "{{ StartTime_unixtime }}" >= 1506124800 AND LEFT("{{ StreamUrl }}",40) ILIKE '%dc4%' then 'DC4'
    WHEN "{{ StartTime_unixtime }}" >= 1506124800 AND LEFT("{{ StreamUrl }}",40) ILIKE '%dca%' then 'DCA'
    WHEN "{{ StartTime_unixtime }}" >= 1506124800 AND LEFT("{{ StreamUrl }}",40) ILIKE '%dcb%' then 'DCB'
    WHEN "{{ StartTime_unixtime }}" >= 1506124800 AND LEFT("{{ StreamUrl }}",40) ILIKE '%dc1%' then 'DC1'
    WHEN "{{ StartTime_unixtime }}" >= 1506124800 AND LEFT("{{ StreamUrl }}",40) ILIKE '%dcn%' then 'DCN'
    WHEN "{{ StartTime_unixtime }}" >= 1506124800 AND LEFT("{{ StreamUrl }}",40) ILIKE '%dlvr%' then 'DLVR'
    WHEN "{{ StartTime_unixtime }}" < 1506124800 AND "{{ C3DeRs }}" ILIKE '%dc1%' then 'DC1'
    WHEN "{{ StartTime_unixtime }}" < 1506124800 AND "{{ C3DeRs }}" ILIKE '%dc2%' then 'DC2'
    WHEN "{{ StartTime_unixtime }}" < 1506124800 AND "{{ C3DeRs }}" ILIKE '%dc3%' then 'DC3'
    WHEN "{{ StartTime_unixtime }}" < 1506124800 AND "{{ C3DeRs }}" ILIKE '%dc4%' then 'DC4'
    WHEN "{{ StartTime_unixtime }}" < 1506124800 AND "{{ C3DeRs }}" ILIKE '%dca%' then 'DCA'
    WHEN "{{ StartTime_unixtime }}" < 1506124800 AND "{{ C3DeRs }}" ILIKE '%dcb%' then 'DCB'
    WHEN "{{ StartTime_unixtime }}" < 1506124800 AND "{{ C3DeRs }}" ILIKE '%dcn%' then 'DCN'
    WHEN "{{ StartTime_unixtime }}" < 1506124800 AND "{{ C3DeRs }}" ILIKE '%dlvr%' then 'DLVR'
    ELSE 'Unknown'
END
{%- endmacro %}
