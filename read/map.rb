#!/usr/bin/env ruby
require 'lib.rb'

map do |line|
  words = line.split
  (words.size - 1).times do |i|
    puts "#{words[i]}\t#{words[i+1]}"
  end
end
