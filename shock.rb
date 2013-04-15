require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' 
require 'geocoder'
require './models/earthquake'
require 'poncho'

Time.zone = "UTC"
ActiveRecord::Base.default_timezone = :utc

class Shock  < Sinatra::Base
  get '/' do 
    'Welcome to the ShockAPI!'
  end

  class GetEarthquakeMethod < Poncho::JSONMethod
    param :on, :type => :integer
    param :since, :type => :integer
    param :over
    param :near
    
    def invoke
      Earthquake.by_params(params, param(:over), param(:on), param(:since), param(:near))
    end
  end
 
  get '/earthquakes.json', &GetEarthquakeMethod
end
