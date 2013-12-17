#
# Cookbook Name:: chef-archiva
# Attributes:: default
#
# Author:: Jorge Espada <espada.jorge@gmail.com>

default[:archiva][:url_version] = "http://apache.mivzakim.net/archiva/1.3.6/binaries/apache-archiva-1.3.6-bin.tar.gz"
default[:archiva][:version] = "1.3.6"
default[:archiva][:install_path] = "/opt/"
default[:archiva][:home] = "/opt/archiva"
default[:archiva][:checksum] = "bc696f38bacee90695802ec149f167125b24cc93c690560b5c5826a8e8bf86da"
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
