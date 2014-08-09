#
# Cookbook Name:: chef-archiva
# Attributes:: default
#
# Author:: Jorge Espada <espada.jorge@gmail.com>

default[:archiva][:version] = "1.3.9"
default[:archiva][:bin_version] = "1.3.9.1"
default[:archiva][:url_version] = "http://supergsego.com/apache/archiva/#{node[:archiva][:version]}/binaries/apache-archiva-#{node[:archiva][:bin_version]}-bin.tar.gz"
default[:archiva][:checksum] = "b9fd7d2d7da290a3d5b07b720586f037e1d2966f28eb7040bb9add37bc30468a"


default[:archiva][:install_path] = "/opt/"
default[:archiva][:home] = "/opt/archiva"
default[:archiva][:user_owner] = "root"


#Web settings (archiva)
default[:archiva][:web_host]               = "127.0.0.1"
default[:archiva][:web_port]               = "8080"
default[:archiva][:web_domain]             = "archiva.example.com"
default[:archiva][:web_template]           = "default"

#nginx install from (source, package..)
default[:archiva][:nginx] = "default"
#this will configure the nginx proxy (defaul /)
default[:archiva][:nginx_uri] = "/"
#Port where nginx vhost should listen(80 defaul)
default[:archiva][:nginx_port] = "80"
