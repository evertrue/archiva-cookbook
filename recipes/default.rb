#
# Cookbook Name:: archiva
# Recipe:: default
# Author:: Jorge Espada <espada.jorge@gmail.com>
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

include_recipe 'apt' if platform_family?('debian')
include_recipe 'ark'
include_recipe 'java'

ark 'archiva' do
  url         "http://archive.apache.org/dist/archiva/#{node[:archiva][:version]}" \
              "/binaries/apache-archiva-#{node[:archiva][:version]}-bin.tar.gz"
  version     node[:archiva][:version]
  prefix_root node[:archiva][:install_path]
  prefix_home node[:archiva][:install_path]
  home_dir    node[:archiva][:home]
  checksum    node[:archiva][:checksum]
  owner       node[:archiva][:user_owner]
  action      :install
end

link '/etc/init.d/archiva' do
  to "#{node[:archiva][:home]}/bin/archiva"
end

arch = node[:kernel][:machine]
if platform?('ubuntu') && arch.include?('x86_64')
  [
    'bin/wrapper-linux-x86-32',
    'lib/libwrapper-linux-x86-32.so'
  ].each do |file|
    file "#{node[:archiva][:home]}/#{file}" do
      action :delete
    end
  end
end

service 'archiva' do
  supports status: true, start: true, stop: true, restart: true
  action [:enable, :start]
end
