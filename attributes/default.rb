#
# Cookbook Name:: chef-archiva
# Attributes:: default
#
# Author:: Jorge Espada <espada.jorge@gmail.com>

default[:archiva][:url_version] = "http://apache.xfree.com.ar/archiva/binaries/apache-archiva-1.3.5-bin.tar.gz"
default[:archiva][:version] = "1.3.5"
default[:archiva][:install_path] = "/opt/"
default[:archiva][:home] = "/opt/archiva"
default[:archiva][:checksum] = "b6095725a45305c63620f1abac4d80271d2d37bed79f2ab0d0cb8a62449e92cb"
default[:archiva][:user_owner] = "root"


#Web settings (archiva)
default['archiva']['web_host']               = "127.0.0.1"
default['archiva']['web_port']               = "8080"
default['archiva']['web_domain']             = node[:fqdn] #"archiva.example.com"
default['archiva']['web_template']           = "default"

#nginx install from (source, package..)
default['archiva']['nginx'] = "default"
#this will configure the nginx proxy (defaul /)
default['archiva']['nginx_uri'] = "/"
#Port where nginx vhost should listen(80 defaul)
default['archiva']['nginx_port'] = "80"
