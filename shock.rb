require 'sinatra'

class Shock  < Sinatra::Base
  get '/' do 
    "Hello, World!"
  end
end
