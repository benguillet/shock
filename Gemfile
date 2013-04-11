source 'https://rubygems.org'

gem 'rake'
gem 'sinatra'
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'unicorn'
gem 'foreman'
gem 'poncho'

group :development, :test do
  # works locally only, uses heroku scheduler on prod
  gem 'whenever', :require => false 
  gem 'sqlite3'
end
   
group :production do
 # this gem is required to use postgres on Heroku
 gem 'pg' 
end
