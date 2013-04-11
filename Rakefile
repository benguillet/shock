# always require app file first
require './shock'
require 'sinatra/activerecord/rake'

task :environment do
  require File.expand_path(File.join(*%w[ config environments ]), File.dirname(__FILE__))
end

namespace :earthquake do
  task :import => :environment do
    earthquake = Earthquake.new
    earthquake.import
  end
end
