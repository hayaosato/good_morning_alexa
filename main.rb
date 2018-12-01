#! /usr/bin/ruby

require 'json'

def main(sample)
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
  puts '======='
  puts sample

  return data.to_json
end
