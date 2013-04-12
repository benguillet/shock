source 'https://rubygems.org'

gem 'rake'
gem 'sinatra'
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'unicorn'
gem 'foreman'
gem 'poncho'

group :development, :test do
  gem 'sqlite3'
  gem 'rack-test'
end
   
group :production do
 # this gem is required to use postgres on Heroku
 gem 'pg' 
end
