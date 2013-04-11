# always require app file first
require './shock'
require 'sinatra/activerecord/rake'

task :environment do
  require File.expand_path(File.join(*%w[ config environments ]), File.dirname(__FILE__))
end

task :tasks do
  require File.expand_path(File.join(*%w[ tasks import ]), File.dirname(__FILE__))
end

namespace :earthquake do
  task :import => :tasks do
    import = Import.new
    import.create_rows
  end
end
