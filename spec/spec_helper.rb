require File.expand_path '../../shock.rb', __FILE__
require 'sinatra'
require 'rspec'
require 'rack/test'
require 'json_spec'
require 'factory_girl'

#setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

FactoryGirl.find_definitions

def app
  Shock
end

RSpec.configure do | config |
  config.include Rack::Test::Methods
  config.include JsonSpec::Helpers
end

JsonSpec.configure do
    exclude_keys "id", "created_at", "updated_at", "bearing", "distance"
end
