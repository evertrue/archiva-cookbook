#
# Cookbook Name:: archiva
# Recipe:: nginx_proxy
#
# Copyright 2012, Jorge Espada
#

# Install an nginx server and proxy trafic to archiva

include_recipe "nginx::#{node[:archiva][:nginx]}"

template "archiva_server.conf" do
  path "#{node[:nginx][:dir]}/sites-available/archiva_server.conf"
  source "nginx_site_#{node[:archiva][:web_template]}.erb"
  owner "root"
  group "root"
  mode 0644
end

nginx_site "archiva_server.conf" do
  enable :true
end

template "#{node[:archiva][:home]}/conf/jetty.xml" do
  source "jetty.xml.erb"
  mode 0755
  owner node[:archiva][:user_owner]
  notifies :restart, resources(:service => "archiva"), :immediately
end
