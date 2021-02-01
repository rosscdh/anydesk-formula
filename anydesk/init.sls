{% from 'anydesk/map.jinja' import config with context %}

# Install the installer thing
install_anydesk:
  chocolatey.installed:
    - name: anydesk
    - version: '{{ config.version }}'
    {%- if config.source %}
    - source: '{{ config.source }}'
    {%- endif %}
    {%- if config.force %}
    - force: True
    {%- endif %}


# any desk needs to actually be installed; the above gets teh installer which is then used to install this
'AnyDesk.exe --install "C:\Program Files (x86)\AnyDesk.exe" --start-with-win --silent --create-shortcuts --create-desktop-icon':
  cmd.run:
  - shell: powershell
  - require:
    - file: 'C:\Program Files (x86)\AnyDesk.exe'


{%- if config.password %}
anydesk_client_set_password:
  cmd.run:
  - shell: powershell
  - name: 'echo "{{ config.password }}" | AnyDesk.exe --set-password'
{%- endif %}


{%- if config.license %}
anydesk_client_set_license:
  cmd.run:
  - shell: powershell
  - name: 'echo "{{ config.license }}" | AnyDesk.exe --register-license'
{%- endif %}


anydesk_client_status:
  cmd.run:
  - shell: powershell
  - name: 'AnyDesk.exe --get-status'


anydesk_client_id:
  cmd.run:
  - shell: powershell
  - name: 'AnyDesk.exe --get-id'