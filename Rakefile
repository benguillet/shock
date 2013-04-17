# always require app file first
require './shock'
require 'sinatra/activerecord/rake'
require 'rake/testtask'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new 

task :environment do
  require File.expand_path(File.join(*%w[ config environments ]), File.dirname(__FILE__))
end

task :tasks do
  require File.expand_path(File.join(*%w[ task import ]), File.dirname(__FILE__))
end

namespace :earthquake do
  task :import => :tasks do
    Import.create_rows
  end
end
