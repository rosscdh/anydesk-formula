{% from 'anydesk/map.jinja' import config with context %}

anydesk_client_status:
  cmd.run:
  - shell: powershell
  - name: 'AnyDesk.exe --get-status'

anydesk_client_id:
  cmd.run:
  - shell: powershell
  - name: 'AnyDesk.exe --get-id'
