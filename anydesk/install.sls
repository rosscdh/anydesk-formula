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
