require 'spec_helper'

describe 'sauceproxy::server' do

  before do
    Fauxhai.mock(platform:'centos', version:'6.3')
  end

  it 'should create a sauceproxy directory with the right ownership' do
    chef_run = ChefSpec::ChefRunner.new do |node|
      node.set['sauceproxy'] = Hash.new
      node.set['sauceproxy']['server'] = Hash.new
      node.set['sauceproxy']['server']['user'] = 'fake'
      node.set['sauceproxy']['server']['install_dir'] = '/tmp/fake'
    end
    chef_run.converge 'sauceproxy::server'
    chef_run.should create_directory '/tmp/fake'
    chef_run.directory('/tmp/fake').should be_owned_by('fake')
#    Haven't got this working yet. Need to figure out how to retrieve Chef::Config[:file_cache_path]
#    from within RSpec
#    chef_run.should create_remote_file '/var/cache/chef/Sauce-Connect-3.0-r21.zip'
  end

  it 'should start a service called sauceproxy' do
    chef_run = ChefSpec::ChefRunner.new
    chef_run.converge 'sauceproxy::server'
    chef_run.should create_file '/etc/init.d/sauceproxy'
    chef_run.should set_service_to_start_on_boot 'sauceproxy'
    chef_run.should start_service 'sauceproxy'
  end
end
