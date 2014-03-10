require File.expand_path '../spec_helper.rb', __FILE__
require File.expand_path '../../shock.rb', __FILE__

describe 'Shock' do

  context 'successful requests' do

    it "should retrieve earthquakes with status code of 200" do
      get '/earthquakes.json'
      last_response.status.should == 200
    end

    it "should retrieve a content-type of json" do
      get '/earthquakes.json'
      last_response.header['Content-Type'].should include 'application/json'
    end

    it 'should get the right earthquakes based on a specific day' do
      get '/earthquakes.json?on=1365838383'
      last_response.body.should include("\"datetime\":\"2013-04-13T15:01:39Z\"")
    end

    it 'should get the right earthquakes based on the magnitude' do
      get '/earthquakes.json?over=6'
      last_response.body.should include("\"eqid\":\"b000g2y5\"")
    end

    it 'should get the right earthquakes based on since' do
      get '/earthquakes.json?since=1365838383'
      last_response.body.should include("\"eqid\":\"2013nza3\"")
    end

    it 'should handle properly parameters on and since together' do
      get '/earthquakes.json?over=4&on=1365838383&since=1365838383'
      last_response.body.should have_json_size(13)
    end

    it "should say welcome" do
      get '/'
      last_response.should be_ok
      last_response.body.should == 'Welcome to the ShockAPI!'
    end

  end

end
