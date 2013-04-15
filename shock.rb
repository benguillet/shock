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
    @@select = 'eqid, source, version, datetime, latitude, longitude, magnitude, depth, nst, region'
    
    def invoke
      @earthquakes = Earthquake.scoped.select(@@select)
      
      if params.empty?
        @earthquakes = @earthquakes.all
      else
        @earthquakes = @earthquakes.over_magnitude(param(:over))    if param(:over).present? 
        @earthquakes = @earthquakes.on(Time.at(param(:on)).to_date) if param(:on).present?
        @earthquakes = @earthquakes.since(Time.at(param(:since)))   if param(:since).present?
      
        if param(:near)
          coords = param(:near).split(',')
          @earthquakes = @earthquakes.near(coords, 5, :select => @@select)
        end
      end
      @earthquakes
    end
  end
 get '/earthquakes.json', &GetEarthquakeMethod
end
