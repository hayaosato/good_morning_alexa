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

return data.to_json
