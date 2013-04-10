require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' 
require './models/earthquake'

class Shock  < Sinatra::Base
  get '/' do 
    "Hello, World!"
  end
end
