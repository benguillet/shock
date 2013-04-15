class Earthquake < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord 
  reverse_geocoded_by :latitude, :longitude
  validates_uniqueness_of :eqid
end
