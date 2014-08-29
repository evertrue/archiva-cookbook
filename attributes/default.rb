default[:archiva][:version]     = '1.3.6'
default[:archiva][:url_version] = 'http://apache.mivzakim.net/archiva/#{node[:archiva][:version]}/binaries/apache-archiva-#{node[:archiva][:version]}-bin.tar.gz'
default[:archiva][:checksum]    = 'bc696f38bacee90695802ec149f167125b24cc93c690560b5c5826a8e8bf86da'

default[:archiva][:install_path] = '/opt/'
default[:archiva][:home]         = '/opt/archiva'
default[:archiva][:user_owner]   = 'root'

default[:archiva][:web_host]     = '127.0.0.1'
default[:archiva][:web_port]     = '8080'
default[:archiva][:web_domain]   = 'archiva.example.com'
default[:archiva][:web_template] = 'default'

default[:archiva][:nginx]      = 'default'
default[:archiva][:nginx_uri]  = '/'
default[:archiva][:nginx_port] = '80'
