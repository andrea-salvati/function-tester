-- Clean and standardize the ApplicationType column
{% macro application_type_cleaning(ApplicationType)  -%}
CASE
    WHEN "{{ ApplicationType }}" = 'smartcast' THEN 'Smartcast'
    WHEN "{{ ApplicationType }}" ILIKE '%tizen%' AND LENGTH("{{ ApplicationType }}")<50 THEN 'Tizen'
    WHEN "{{ ApplicationType }}" = 'xfinity' THEN 'Xfinity'
    WHEN "{{ ApplicationType }}" ILIKE '%webos%' AND LENGTH("{{ ApplicationType }}")<50 THEN 'Web OS'
    WHEN "{{ ApplicationType }}" ILIKE '%android' AND LENGTH("{{ ApplicationType }}")<50 THEN 'Android' --might want to clarify if this is android mobile
    WHEN "{{ ApplicationType }}" ILIKE '%exoplayer%' AND LENGTH("{{ ApplicationType }}")<50 THEN 'Android TV'
    WHEN "{{ ApplicationType }}" ILIKE '%abstract%' AND LENGTH("{{ ApplicationType }}")<50 THEN 'Abstract Method'
    WHEN "{{ ApplicationType }}" ILIKE 'ios' AND LENGTH("{{ ApplicationType }}")<50 THEN 'IOS'
    WHEN "{{ ApplicationType }}" ILIKE '%skyq%' AND LENGTH("{{ ApplicationType }}")<50 THEN 'Sky Q'
    WHEN "{{ ApplicationType }}" ILIKE '%MDK_SKY_Q' AND LENGTH("{{ ApplicationType }}")<50 THEN 'Sky Q'
    WHEN "{{ ApplicationType }}" ILIKE 'roku' AND LENGTH("{{ ApplicationType }}")<50 THEN 'Roku TV'
    WHEN "{{ ApplicationType }}" = '[DAZN 2.0] SHAKA' THEN 'Web' --this is Chrome, Edge Chromium and Firefox browsers
    WHEN "{{ ApplicationType }}" = '[DAZN 2.0] SHAKA_WEDGE' THEN 'Web' --this is Edge legacy
    WHEN "{{ ApplicationType }}" = '[DAZN 2.0] HASPLAYER' THEN 'Web' --this is Internet Explorer
    WHEN "{{ ApplicationType }}" = '[DAZN 2.0] HTML5_FAIRPLAY' THEN 'Web' --this is safari browser
    WHEN "{{ ApplicationType }}" ILIKE 'web' AND LENGTH("{{ ApplicationType }}")<50 THEN 'Web'
    WHEN "{{ ApplicationType }}" ILIKE 'Netcast' AND LENGTH("{{ ApplicationType }}")<50 THEN 'Netcast'
    WHEN "{{ ApplicationType }}" ILIKE 'Orsay' AND LENGTH("{{ ApplicationType }}")<50 THEN 'Orsay'
    WHEN "{{ ApplicationType }}" = 'operatv' THEN 'Opera TV'
    WHEN "{{ ApplicationType }}" ILIKE '%chromecast%' AND LENGTH("{{ ApplicationType }}")<50 THEN 'chromecast'
    WHEN "{{ ApplicationType }}" ILIKE '%MDK_ANDROID_TV%' AND LENGTH("{{ ApplicationType }}")<50 THEN 'Android TV'
    WHEN "{{ ApplicationType }}" ILIKE '%Hisense%' AND LENGTH("{{ ApplicationType }}")<50 THEN 'Hisense TV'
    WHEN "{{ ApplicationType }}" ILIKE '%xboxone%' AND LENGTH("{{ ApplicationType }}")<50 THEN 'Xbox One'
    WHEN "{{ ApplicationType }}" ILIKE '%PS5%' AND LENGTH("{{ ApplicationType }}")<50 THEN 'PlayStation 5'
    WHEN "{{ ApplicationType }}" = 'PlayStation+4' THEN 'PlayStation 4'
    WHEN "{{ ApplicationType }}" ILIKE '%PS4%' AND LENGTH("{{ ApplicationType }}")<50 THEN 'PlayStation 4'
    WHEN "{{ ApplicationType }}" = 'PlayStation+3' THEN 'PlayStation 3'
    WHEN "{{ ApplicationType }}" ILIKE '%AppleTV%' AND LENGTH("{{ ApplicationType }}")<50 THEN 'Apple TV'
    WHEN "{{ ApplicationType }}" ILIKE '%Toshiba%' AND "{{ ApplicationType }}" ILIKE '%tv%' AND LENGTH("{{ ApplicationType }}")<50 THEN 'Toshiba TV'
    WHEN "{{ ApplicationType }}" ILIKE '%Panasonic%' AND "{{ ApplicationType }}" ILIKE '%tv%' AND LENGTH("{{ ApplicationType }}")<50 THEN 'Panasonic TV'
    WHEN "{{ ApplicationType }}" ILIKE '%SONY%' AND "{{ ApplicationType }}" ILIKE '%tv%' AND LENGTH("{{ ApplicationType }}")<50 THEN 'SONY TV'
    WHEN "{{ ApplicationType }}" ILIKE '%android%' AND "{{ ApplicationType }}" ILIKE '%tv%' AND "{{ ApplicationType }}" != '%5BDAZN+2.0%5D+MDK_ANDROID_TV' AND LENGTH("{{ ApplicationType }}")<50 THEN 'Android TV'
    WHEN "{{ ApplicationType }}" = 'hisensejp' THEN 'Hisensejp'
    WHEN "{{ ApplicationType }}" = 'sonyceb' THEN 'Sony CEB'
    WHEN "{{ ApplicationType }}" ILIKE '%MDK_WEBMAF%' AND LENGTH("{{ ApplicationType }}")<50 THEN 'PS4'
    WHEN "{{ ApplicationType }}" = 'funai' THEN 'Funai'
    WHEN "{{ ApplicationType }}" ILIKE '%MAGENTA%' AND LENGTH("{{ ApplicationType }}")<50 THEN 'Magenta'
    ELSE 'Unknown'
END
{%- endmacro %}
