require File.expand_path '../spec_helper.rb', __FILE__
require File.expand_path '../../tasks/import.rb', __FILE__

describe Import do
  it "can fetch" do
    import = Import.new
    import.fetch_csv('http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M1.txt').must_be_instance_of(File)
  end

  it "can raise exception" do
    import = Import.new
    import.fetch_csv('http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M1.tx').must_be_nil
  end
end
