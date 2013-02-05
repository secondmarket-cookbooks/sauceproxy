#
# Cookbook Name:: sauceproxy
# Recipe:: server
#
# Copyright 2012-2013, SecondMarket Labs, LLC
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

include_recipe "java"

user node['sauceproxy']['server']['user'] do
  comment "SauceLabs Proxy User"
  system true
  action :create
end

directory node['sauceproxy']['server']['install_dir'] do
  owner node['sauceproxy']['server']['user']
  mode 00755
  action :create
end

# Can't assume we have unzip
package "unzip" do
  action :install
end

execute "unzip-saucelabs-proxy" do
  cwd node['sauceproxy']['server']['install_dir']
  command "unzip -o #{Chef::Config[:file_cache_path]}/#{node['sauceproxy']['server']['zipfile']}"
  action :nothing
  notifies :restart, "service[sauceproxy]"
end

remote_file "#{Chef::Config[:file_cache_path]}/#{node['sauceproxy']['server']['zipfile']}" do
  source "#{node['sauceproxy']['server']['download_url']}/#{node['sauceproxy']['server']['zipfile']}"
  action :create_if_missing
  notifies :run, "execute[unzip-saucelabs-proxy]", :immediately
end

template "/etc/init.d/sauceproxy" do
  source "sauceproxy.init.erb"
  mode 00755
  owner "root"
  group "root"
  action :create
end

service "sauceproxy" do
  action :enable
  supports :restart => true
end

template "/etc/sysconfig/sauceproxy" do
  source "sauceproxy.sysconfig.erb"
  mode 00644
  owner "root"
  group "root"
  action :create
end

service "sauceproxy" do
  action :start
end
