#! /usr/bin/ruby
require 'dotenv'
require 'net/http'
require 'json'
require 'time'

def access_fortune
  base_url = 'http://api.jugemkey.jp/api/horoscope/free/'
  today = Time.now.strftime('%Y/%m/%d')
  access_url = base_url + today
  fortune_data = Net::HTTP.get(URI.parse(access_url))
  fortune_hash = JSON.parse(fortune_data)
  constellation = fortune_hash['horoscope'][today][2]
  # content = constellation['content']
  # rank = constellation['rank']
  constellation
end

access_fortune
