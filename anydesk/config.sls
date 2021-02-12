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


setup_anydesk_config_settings:
    file.keyvalue:
      - name: "C:/ProgramData/AnyDesk/system.conf"
      - key_values:
          'ad.security.interactive_access': '{{ config.settings.security.interactive_access | default("0") }}'
          'ad.features.unattended':  '{{ config.settings.features.unattended | default("true") }}'
      - separator: '='
      - uncomment: '# '
      - key_ignore_case: True
      - append_if_not_found: True
