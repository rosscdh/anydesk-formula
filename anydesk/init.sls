
{% from 'anydesk/map.jinja' import config with context %}

{%- if kernel ==  'windows' %}
include:
- .install
- .info
{%- endif %}
