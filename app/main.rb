#! /usr/bin/ruby

require 'json'
require './fortune'
require './weather'

# Alexa Skill
class Alexa
  include Fortune
  include WeatherReport
  def initialize
    constellation = access_fortune
    @rank = constellation['rank']
    @comment = constellation['content']
    @weather = access_weather
  end

  def build_response
    output_speech = build_output_speech
    data = {
      'version' => '1.0',
      'response' => {
        'outputSpeech' => output_speech,
        'shouldEndSession' => true
      }
    }
    data
  end

  def build_output_speech
    output_speech = {
      'type' => 'PlainText',
      'text' => "今日の天気は#{@weather}です。運勢は第#{@rank}位で、#{@comment}"
    }
    output_speech
  end
end

def main(sample)
  puts sample
  alexa = Alexa.new
  alexa.build_response
end

main('hoge')
