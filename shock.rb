require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' 
require './models/earthquake'
require 'poncho'

class Shock  < Sinatra::Base
  get '/' do 
    "Hello, World!"
  end

  class GetEarthquakeMethod < Poncho::JSONMethod
    def invoke
      @earthquakes = Earthquake.all
    end
  end

 get '/earthquakes.json', &GetEarthquakeMethod
end
