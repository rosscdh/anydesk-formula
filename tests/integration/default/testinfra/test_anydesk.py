def test_file_exists(host):
    anydesk = host.file('/anydesk.yml')
    assert anydesk.exists
    assert anydesk.contains('your')

# def test_anydesk_is_installed(host):
#     anydesk = host.package('anydesk')
#     assert anydesk.is_installed
#
#
# def test_user_and_group_exist(host):
#     user = host.user('anydesk')
#     assert user.group == 'anydesk'
#     assert user.home == '/var/lib/anydesk'
#
#
# def test_service_is_running_and_enabled(host):
#     anydesk = host.service('anydesk')
#     assert anydesk.is_enabled
#     assert anydesk.is_running
