#! /usr/bin/ruby

require 'json'

def main(sample)
  number = 6

  data = build_response(number)
  puts sample

  puts data
end

def build_response(number)
  output_speech = build_output_speech(number)
  data = {
    'version' => 1.0,
    'response' => {
      'output_speech' => output_speech,
      'shouldEndSession' => true
    }
  }
  data
end

def build_output_speech(number)
  output_speech = {
    'type' => 'PlainText',
    'text' => "#{number}部屋空いてます! こんにちは"
  }
  output_speech
end

main('sample')
