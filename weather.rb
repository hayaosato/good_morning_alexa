#! /usr/bin/ruby
require 'dotenv'
require 'net/http'
require 'json'

def access_weather
  # https://api.openweathermap.org/data/2.5/forecast

  base_url = 'https://api.openweathermap.org/data/2.5/forecast'
  city = 'Tokyo,JP'
  api_key = ENV['WEATHER_KEY']
  access_url = base_url + '?q=' + city + '&' + 'appid=' + api_key
  weather_data = Net::HTTP.get(URI.parse(access_url))
  parse_data(weather_data)
end

def parse_data(json_data)
  hash_data = JSON.parse(json_data)
  puts hash_data['list'][0]
end

Dotenv.load
access_weather
