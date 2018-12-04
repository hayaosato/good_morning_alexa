#! /usr/bin/ruby
require 'dotenv'
require 'net/http'
require 'json'
require 'time'

# get weather report from openweathermap
module WeatherReport
  def access_weather
    Dotenv.load
    base_url = 'https://api.openweathermap.org/data/2.5/forecast'
    city = 'Tokyo,JP'
    api_key = ENV['WEATHER_KEY']
    access_url = base_url + '?q=' + city + '&' + 'appid=' + api_key
    weather_data = Net::HTTP.get(URI.parse(access_url))
    time = parse_data(weather_data)
    puts time
  end

  def parse_data(json_data)
    hash_data = JSON.parse(json_data)
    weather_datetime = hash_data['list'][0]['dt_txt']
    utc_datetime = Time.strptime(weather_datetime + '+0000', '%Y-%m-%d %H:%M:%S %z')
    utc_datetime.localtime
  end
end

include WeatherReport
access_weather
