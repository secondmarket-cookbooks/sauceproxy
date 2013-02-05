name             "sauceproxy"
maintainer       "SecondMarket Labs, LLC"
maintainer_email "systems@secondmarket.com"
license          "Apache 2.0"
description      "Installs/Configures SauceLabs Proxy"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.8"

%w{fedora redhat centos oracle amazon}.each do |p|
  supports p
end

depends "java"
