#! /usr/bin/ruby

require 'json'

def main(sample)
  number = 6

  data = get_data(number)
  puts sample

  # json_data = data.to_json
  # json_data
  data
end

def get_data(number)
  data = {
    'version' => 1.0,
    'response' => {
      'outputSpeech' => {
        'type' => 'PlainText',
        'text' => "#{number}部屋空いてます! こんにちは"
      },
      'shouldEndSession' => true
    }
  }
  data
end

main('hoge')
