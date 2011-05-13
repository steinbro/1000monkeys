#!/usr/bin/env ruby
require 'lib.rb'

reduce do |word, wordlist|
  puts "#{word}\t#{wordlist.join(" ")}"
end
