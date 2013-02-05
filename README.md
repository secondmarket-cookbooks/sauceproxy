Description
===========

Installs SauceLabs' "Connect" proxy on a server. The proxy allows you to test internal infrastructure with SauceLabs' Selenium testing service by setting up a tunnel.

Requirements
============

## Cookbooks

* java - Note that we've only tested the proxy with the Oracle JDK, but OpenJDK might work too.

## Platforms

* CentOS 5.8, 6.3
* RedHat Enterprise Linux 5.8, 6.3
* Fedora

Attributes
==========

* `node['sauceproxy']['server']['version']` - Version of SauceConnect to download.
* `node['sauceproxy']['server']['download_url']` - The URL to download Sauce Connect from.
* `node['sauceproxy']['server']['zipfile']` - The zip file name containing Sauce Connect.
* `node['sauceproxy']['server']['install_dir']` - Where to unpack the zip file to.
* `node['sauceproxy']['server']['user']` - The user to run the proxy under.
* `node['sauceproxy']['server']['log_file']` - The log file to write output to.
* `node['sauceproxy']['server']['api_user']` - Your API username. Blank by default; set this in a role or an enclosing application cookbook.
* `node['sauceproxy']['server']['api_key']` - Your API key. Blank by default; set this in a role or an enclosing application cookbook.

Tests
=====

There are some elementary minitests in files/default/tests/minitest, as well as test-kitchen integration tests. The tests are by no means complete; please feel free to add more.

Recipes
=======

default
-------

Does nothing. Use the server recipe.

server
------

Downloads and unpacks Sauce Connect on the target system and registers it as a service to start up at boot time.

To-Do
=====

* Add more tests.
* Throw an exception if neither the API user or key are defined.

License and Author
==================

Author:: Julian C. Dunn (<jdunn@secondmarket.com>)

Copyright:: 2012-2013, SecondMarket Labs, LLC.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
