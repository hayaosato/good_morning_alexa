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

  data = JSON.pretty_generate(data)

  return data
end
