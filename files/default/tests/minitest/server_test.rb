require File.expand_path('../support/helpers.rb', __FILE__)

describe 'sauceproxy::server' do

  include Helpers::Sauceproxy

  it 'runs as a daemon' do
    service('sauceproxy').must_be_running
  end

end
