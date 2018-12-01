#! /usr/bin/ruby

require 'spec_helper'
require 'main'

describe sample do
  it {
    is_expected.to eq 'hoge'
  }
end
