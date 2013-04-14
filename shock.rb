require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' 
require './models/earthquake'
require 'poncho'

Time.zone = "UTC"
ActiveRecord::Base.default_timezone = :utc

class Shock  < Sinatra::Base
  get '/' do 
    'Hello, World!'
  end

  class GetEarthquakeMethod < Poncho::JSONMethod
    param :on, :type => :integer
    param :since, :type => :integer
    param :over
    
    @@select = 'eqid, source, version, datetime, latitude, longitude, magnitude, depth, nst, region'
    
    def invoke
      if param(:over)
        @earthquakes = Earthquake.select(@@select).where("magnitude > ?", param(:over)) 
      elsif param(:since)
        @earthquakes = Earthquake.select(@@select).where("datetime > ?", Time.at(param(:since))) 
      else
        @earthquakes = Earthquake.select(@@select).all
      end
    end
  end
 get '/earthquakes.json', &GetEarthquakeMethod
end
