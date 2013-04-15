Shock
=====
A simple JSON REST API to fetch data about earthquakes

### Setup
Get a local copy of  the repo:
    git clone https://github.com/benjamin-guillet/shock.git

Install all the required gems:
    bundle install

Create database:    
    rake db:migrate
    
Fill the database:
    rake earthquake:import

Start web server (unicorn):
    foreman start

Launch specs:
    rake spec

### Usage
    GET /earthquakes.json
    # Returns all earthquakes

    GET /earthquakes.json?on=1364582194
    # Returns earthquakes on the same day (UTC) as the unix timestamp 1364582194

    GET /earthquakes.json?since=1364582194
    # Returns earthquakes since the unix timestamp 1364582194

    GET /earthquakes.json?over=3.2
    # Returns earthquakes > 3.2 magnitude

    GET /earthquakes.json?near=36.6702,-114.8870
    # Returns all earthquakes within 5 miles of lat: 36.6702, lng: -114.8870

    GET /earthquakes.json?over=3.2&near=36.6702,-114.8870&since=1364582194
    # Returns all earthquakes over 3.2 magnitude within 5 miles of 36.6702,-114.8870 since 2013-03-29 18:36:34 UTC

    GET /earthquakes.json?over=3.2&on=1364582194&since=1364582194
    # Returns all earthquakes over 3.2 magnitude between 2013-03-29 18:36:34 UTC and 2013-03-29 23:59:59 UTC


