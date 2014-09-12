#
# Cookbook Name:: archiva
# Recipe:: nginx_proxy
#
# Copyright 2012, Jorge Espada
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'archiva::default'
include_recipe "nginx::#{node[:archiva][:nginx]}"

template 'archiva_server.conf' do
  path   "#{node[:nginx][:dir]}/sites-available/archiva_server.conf"
  source "nginx_site_#{node[:archiva][:web_template]}.erb"
  owner  'root'
  group  'root'
  mode   '0644'
end

nginx_site 'archiva_server.conf' do
  enable :true
end

template "#{node[:archiva][:home]}/conf/jetty.xml" do
  source   'jetty.xml.erb'
  mode     '0644'
  owner    node[:archiva][:user_owner]
  notifies :restart, 'service[archiva]', :immediately
end
