class Earthquake < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord 
  reverse_geocoded_by :latitude, :longitude
  validates_uniqueness_of :eqid
  

  def self.over_magnitude(magnitude)
    return scoped unless magnitude.present?
    where("magnitude > ?", magnitude)
  end

  def self.since(datetime)
    return scoped unless datetime.present?
    where("datetime > ?",  datetime)
  end

  def self.on(datetime)
    return scoped unless datetime.present?
    where("strftime('%Y-%m-%d', datetime) = ?", datetime)
  end
end
