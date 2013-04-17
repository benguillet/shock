require File.expand_path '../spec_helper.rb', __FILE__
require File.expand_path '../../task/import.rb', __FILE__

describe Import do
  it "should fetch" do
    Import.fetch_csv('http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M1.txt')
    be_a(File)
  end

  it "can raise exception" do
    Import.fetch_csv('http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M1.tx')
    be_nil
  end
end
