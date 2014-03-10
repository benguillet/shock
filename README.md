Shock
=====
[![Build Status](https://travis-ci.org/benjamin-guillet/shock.png)](https://travis-ci.org/benjamin-guillet/shock)
[![Code Climate](https://codeclimate.com/github/benjamin-guillet/shock.png)](https://codeclimate.com/github/benjamin-guillet/shock)

A simple JSON REST API to fetch data about earthquakes.

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

### Licence
    The MIT License (MIT)

    Copyright (c) 2013 Benjamin Guillet

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
