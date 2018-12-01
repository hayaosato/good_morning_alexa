#! /usr/bin/ruby

require 'json'

def main(sample)
  number = 6

  data = get_data(number)
  puts sample

  json_data = JSON.pretty_generate(data)

  json_data
end

def get_data(number)
  data = {
    'version' => 1.0,
    'response' => {
      'type' => 'PlainText',
      'text' => "#{number}部屋空いてます"
    },
    'shouldEndSession' => true
  }
  data
end
