class Earthquake < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord 
  reverse_geocoded_by :latitude, :longitude
  validates_uniqueness_of :eqid
  

  def self.over_magnitude(magnitude)
    where("magnitude > ?", magnitude)
  end

  def self.since(datetime)
    where("datetime > ?",  datetime)
  end

  def self.on(date)
    adapter_type = ActiveRecord::Base.connection.adapter_name.downcase.to_sym
    case adapter_type
    when :mysql
      where("DATE(datetime) = ?", date)
    when :sqlite
      where("strftime('%Y-%m-%d', datetime) = ?", date)
    when :postgresql
      where("DATE(datetime) = ?", date)
    else
      raise NotImplementedError, "Unknown adapter type '#{adapter_type}'"
    end
  end

  def self.by_params(params, over, on, since, near)
    select = 'eqid, source, version, datetime, latitude, longitude, magnitude, depth, nst, region'
    earthquakes = scoped.select(select)
    
    if params.empty?
      earthquakes = earthquakes.all
    else
      earthquakes = earthquakes.over_magnitude(over)    if over.present? 
      earthquakes = earthquakes.on(Time.at(on).to_date) if on.present?
      earthquakes = earthquakes.since(Time.at(since))   if since.present?

      if near.present?
        coords = near.split(',')
        earthquakes = earthquakes.near(coords, 5, :select => select)
      end
    end
    earthquakes
  end
end
