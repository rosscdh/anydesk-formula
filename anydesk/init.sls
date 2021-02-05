
{% from 'anydesk/map.jinja' import config with context %}
{%- set kernel = grains.kernel|lower %}
{%- if kernel ==  'windows' %}
include:
- .install
- .run
- .info
{%- endif %}
