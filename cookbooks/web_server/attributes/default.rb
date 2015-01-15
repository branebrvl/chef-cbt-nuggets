default['php']['packages'] = %w{ php php-common php-cli php-gd php-mysql php-pgsql php-sqlite php-pecl-memcached php-mcrypt php-fpm php-imagick php-intl php-xdebug}

default['yum']['remi-php55']['enabled'] = true

default['mysql']['server_root_password'] = 'password'
default['mysql']['server_debian_password'] = 'password'
default['mysql']['server_repl_password'] = 'password'
default['mysql']['bind_address'] = '0.0.0.0'

default['databases']['create'] = ['flow', 'flow_test']
default['sites'] = ['default']

default['apache']['version'] = '2.4'
# default['apache']['user'] = ''
# default['apache']['group'] = ''

default['selinux']['state'] = 'disabled'
# setsebool -P httpd_can_network_connect 1
# node['selinux']['booleans'] - A hash of SELinux boolean names and the values they should be set to. Values can be off, false, or 0 to disable; or on, true, or 1 to enable.
