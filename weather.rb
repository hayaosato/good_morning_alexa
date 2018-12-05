#! /usr/bin/ruby
require 'net/http'
require 'json'
require 'time'

WEATHER_LIST = {
  'Clear' => '晴れ',
  'Clouds' => '曇り',
  'rain' => '雨',
  'snow' => '雪'
}.freeze

# get weatherreport from openweathermap
module WeatherReport
  def access_weather
    Dotenv.load
    base_url = 'https://api.openweathermap.org/data/2.5/forecast'
    today = Time.now
    @fixed_time = Time.local(today.year, today.month, today.day, '18', '00', '00')
    puts @fixed_time
    city = 'Tokyo,JP'
    api_key = ENV['WEATHER_KEY']
    access_url = base_url + '?q=' + city + '&' + 'appid=' + api_key
    @weather_data = Net::HTTP.get(URI.parse(access_url))
    parse_data
    weather_convert
    @weather
  end

  def parse_data
    hash_data = JSON.parse(@weather_data)
    hash_data['list'].each do |data|
      weather_datetime = data['dt_txt']
      utc_datetime = Time.strptime(weather_datetime + '+0000', '%Y-%m-%d %H:%M:%S %z')
      if utc_datetime.localtime == @fixed_time
        @weather = data['weather'][0]['main']
        break
      end
    end
  end

  def weather_convert
    @weather = WEATHER_LIST[@weather]
  end
end
