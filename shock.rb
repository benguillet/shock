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
    'Hello, World!'
  end

  class GetEarthquakeMethod < Poncho::JSONMethod
    param :on, :type => :integer
    param :since, :type => :integer
    param :over
    param :near
    # ADD INDEX ON DATETIME? AND LONTITUDE, LAT? 
    @@select = 'eqid, source, version, datetime, latitude, longitude, magnitude, depth, nst, region'
    
    def invoke
      if param(:over)
        @earthquakes = Earthquake.select(@@select).where("magnitude > ?", param(:over)) 
      elsif param(:on)
        @earthquakes = Earthquake.select(@@select).where("strftime('%Y-%m-%d', datetime) = ?", Time.at(param(:on)).to_date)
      elsif param(:since)
        @earthquakes = Earthquake.select(@@select).where("datetime > ?", Time.at(param(:since))) 
      elsif param(:near)
        coords = param(:near).split(',')
        @earthquakes = Earthquake.select(@@select).near(coords, 100)  
      else
        @earthquakes = Earthquake.select(@@select).all
      end
    end
  end
 get '/earthquakes.json', &GetEarthquakeMethod
end
