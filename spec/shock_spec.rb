require File.expand_path '../spec_helper.rb', __FILE__
require File.expand_path '../../shock.rb', __FILE__

describe 'Shock' do
  
  context 'successful requests' do    
    
    it 'should get a specific earthquake' do
      get '/earthquakes.json?on=1366003272&near=38.7497,-122.7308&over=2.1'
      earthquake = FactoryGirl.build(:earthquake)
      last_response.body.should be_json_eql('[' + earthquake.to_json + ']')
    end

    it 'should be of size 123' do
      get '/earthquakes.json?on=1365838383'
      last_response.body.should have_json_size(123)
    end

    it 'should get the right earthquake based on the day' do
      get '/earthquakes.json?on=1365838383'
      last_response.body.should include("\"datetime\":\"2013-04-13T15:01:39Z\"")
    end

    it "can says welcome" do
      get '/'
      last_response.should be_ok
      last_response.body.should == 'Welcome to the ShockAPI!'
    end
  
  end

end
