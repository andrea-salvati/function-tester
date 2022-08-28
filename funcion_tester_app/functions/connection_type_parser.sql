-- Clean and standardize the DeviceConnectionType column
{% macro connection_type_parser(DeviceConnectionType)  -%}
CASE
    WHEN "{{ DeviceConnectionType }}" = '0' THEN 'Unknown'
    WHEN UPPER("{{ DeviceConnectionType }}") IN ( 'TYPE_WIFI','WIFI') THEN 'WiFi'
    WHEN UPPER("{{ DeviceConnectionType }}") IN ('ETHERNET') THEN 'Ethernet'
    WHEN UPPER("{{ DeviceConnectionType }}") IN ('4G','CTRADIOACCESSTECHNOLOGYLTE','NETWORK_TYPE_LTE') THEN '4G'
    WHEN UPPER("{{ DeviceConnectionType }}") IN ('3G','CTRADIOACCESSTECHNOLOGYHSDPA','NETWORK_TYPE_HSDPA','NETWORK_TYPE_HSPA','NETWORK_TYPE_HSUPA','NETWORK_TYPE_UMTS','NETWORK_TYPE_EHRPD','NETWORK_TYPE_1XRTT','NETWORK_TYPE_HSPAP','NETWORK_TYPE_EVDO_A') THEN '3G'
    WHEN UPPER("{{ DeviceConnectionType }}") IN ('2G','NETWORK_TYPE_GPRS','NETWORK_TYPE_EDGE') THEN '2G'
    WHEN UPPER("{{ DeviceConnectionType }}") IN ('5G','NETWORK_TYPE_NR') THEN '5G'
    ELSE 'Unknown'
END
{%- endmacro %}
