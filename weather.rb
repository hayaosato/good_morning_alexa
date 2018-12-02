#! /usr/bin/ruby
require 'dotenv'
require 'net/http'

def access_weather
  # https://api.openweathermap.org/data/2.5/forecast

  base_url = 'https://api.openweathermap.org/data/2.5/forecast'
  city = 'Tokyo,JP'
  api_key = ENV['WEATHER_KEY']
  access_url = base_url + '?q=' + city + '&' + 'appid=' + api_key
  weather_data = Net::HTTP.get_print(URI.parse(access_url))
  parse_data(weather_data)
end

def parse_data(json_data)
  puts json_data.class
end

Dotenv.load
access_weather
