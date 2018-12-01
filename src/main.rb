#! /usr/bin/ruby

require 'json'

number = 6

data = {
  'version' => 1.0,
  'response' => {
    'type' => 'PlainText',
    'text' => "#{number}部屋空いてます"
  },
  'shouldEndSession' => true
}

sample = 'hoge'
puts sample

puts data.to_json.class

return data.to_json
