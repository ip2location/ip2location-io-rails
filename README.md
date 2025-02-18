[![Latest Stable Version](https://img.shields.io/gem/v/ip2location_io_rails.svg)](https://rubygems.org/gems/ip2location_io_rails)
[![Total Downloads](https://img.shields.io/gem/dt/ip2location_io_rails.svg)](https://rubygems.org/gems/ip2location_io_rails)

# IP2Location.io Ruby on Rails Library
This IP2Location.io Ruby on Rails library enables user to query for an enriched data set, such as country, region, district, city, latitude & longitude, ZIP code, time zone, ASN, ISP, domain, net speed, IDD code, area code, weather station data, MNC, MCC, mobile brand, elevation, usage type, address type, advertisement category and proxy data with an IP address. It supports both IPv4 and IPv6 address lookup.

This module requires API key to function. You may sign up for a free API key at https://www.ip2location.io/pricing.

## INSTALLATION
1. Add this lines to your application's Gemfile:
```ruby
gem 'ip2location_io_ruby'
gem 'ip2location_io_rails'
```
2. Then execute it
```bash
$ bundle install
```
3. Open the preferred file in the `config/environments` directory. Add the following code to the chosen configuration file after the `Rails.application.configure do` line.
```ruby
config.ip2location_io_key = 'YOUR_API_KEY'
```

## USAGE
1. Create a **TestController** using the below command line
```bash
bin/rails generate controller Test index --skip-routes
```
2. Open the *app/controllers/test_controller.rb* in any text editor.
3. Add the below lines into the controller file.
```ruby
require 'ip2location_io_rails'

class TestController < ApplicationController
  def index
    location_service = Ip2locationIORails.new('8.8.8.8')
    @location = location_service.location.body
  end
end
```
4. Open the *app/views/test/index.html.erb* in any text editor and add the below lines into it.
```
<p>IP2Location.io data for IP 8.8.8.8: <%= @location %></p>
```
5. Add the following line into the *config/routes.rb* file after the `Rails.application.routes.draw do` line.
```ruby
get "/test", to: "test#index"
```
6. Restart your development server.
```bash
$ bin/rails server
```
7. Enter the URL <your domain>/test and run. You should see the proxy information of **8.8.8.8** IP address.

## Support
Email: support@ip2location.com
URL: [https://www.ip2location.com](https://www.ip2location.com)
