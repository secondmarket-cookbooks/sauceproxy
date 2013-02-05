#
# Cookbook Name:: sauceproxy
# Attributes:: default
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

# You can choose 'latest' as version, but keep in mind that whenever Saucelabs does a new release, your proxy will restart!
default['sauceproxy']['server']['version']='3.0-r22'
default['sauceproxy']['server']['download_url']='http://saucelabs.com/downloads'
default['sauceproxy']['server']['zipfile']="Sauce-Connect-#{node['sauceproxy']['server']['version']}.zip"
default['sauceproxy']['server']['install_dir']='/opt/sauceproxy'
default['sauceproxy']['server']['user']='sauceprx'
default['sauceproxy']['server']['log_file']="#{node['sauceproxy']['server']['install_dir']}/sauce_connect.log"

# Typically overridden in the role
default['sauceproxy']['server']['api_user']=''
default['sauceproxy']['server']['api_key']=''
