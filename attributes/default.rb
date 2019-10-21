default['archiva']['mirror']   = 'http://archive.apache.org/dist/archiva/'
default['archiva']['version']  = '2.2.4'
default['archiva']['checksum'] = 'ad099c451529d566db8b5ad6cf2d8bafc6aa2cc3d225c39fd374cad420a6643c'

default['archiva']['install_path'] = '/opt/'
default['archiva']['home']         = '/opt/archiva'
default['archiva']['user_owner']   = 'root'
default['archiva']['group']        = 'root'

default['archiva']['web_host']     = '127.0.0.1'
default['archiva']['web_port']     = '8080'
default['archiva']['web_domain']   = 'archiva.example.com'
default['archiva']['web_template'] = 'default'

default['archiva']['nginx']      = 'default'
default['archiva']['nginx_uri']  = '/'
default['archiva']['nginx_port'] = '80'

default['nginx']['dir']          = '/etc/nginx'
default['nginx']['log_dir']      = '/var/log/nginx'
