{% from 'anydesk/map.jinja' import config with context %}

{%- if config.password | default('') %}
anydesk_client_set_password:
  cmd.run:
  - shell: powershell
  - name: 'echo {{ config.password }} | AnyDesk.exe --set-password'
{%- endif %}


{%- if config.license | default('') %}
anydesk_client_set_license:
  cmd.run:
  - shell: powershell
  - name: 'echo {{ config.license }} | AnyDesk.exe --register-license'
{%- endif %}

