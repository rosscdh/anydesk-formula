{% from 'anydesk/map.jinja' import config with context %}

# Install the installer thing
install_anydesk:
  chocolatey.installed:
    - name: anydesk
    - version: '{{ config.version }}'
    {%- if config.source | default('') %}
    - source: '{{ config.source }}'
    {%- endif %}
    {%- if config.force | default(false) %}
    - force: True
    {%- endif %}


# any desk needs to actually be installed; the above gets teh installer which is then used to install this
'AnyDesk.exe --install "C:\Program Files (x86)\AnyDesk" --start-with-win --silent --create-shortcuts --create-desktop-icon':
  cmd.run:
  - shell: powershell
  - require:
    - file: 'C:\Program Files (x86)\AnyDesk\AnyDesk.exe'


{%- if config.password | default('') %}
anydesk_client_set_password:
  cmd.run:
  - shell: powershell
  - name: 'echo "{{ config.password }}" | AnyDesk.exe --set-password'
  - require:
    - file: 'C:\Program Files (x86)\AnyDesk\AnyDesk.exe'
{%- endif %}


{%- if config.license | default('') %}
anydesk_client_set_license:
  cmd.run:
  - shell: powershell
  - name: 'echo "{{ config.license }}" | AnyDesk.exe --register-license'
  - require:
    - file: 'C:\Program Files (x86)\AnyDesk\AnyDesk.exe'
{%- endif %}


anydesk_client_status:
  cmd.run:
  - shell: powershell
  - name: 'AnyDesk.exe --get-status'
  - require:
    - file: 'C:\Program Files (x86)\AnyDesk\AnyDesk.exe'

anydesk_client_id:
  cmd.run:
  - shell: powershell
  - name: 'AnyDesk.exe --get-id'
  - require:
    - file: 'C:\Program Files (x86)\AnyDesk\AnyDesk.exe'