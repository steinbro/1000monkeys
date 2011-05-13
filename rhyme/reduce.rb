#!/usr/bin/env ruby
require 'lib.rb'

reduce do |rhymepart, words|
  wordlist = words.collect{|w| w.split("\t", 2)[1] }.join(" ")
  words.each do |thing|
    syllables, word = thing.downcase.split("\t", 2)
    puts "#{word}\t#{syllables}\t#{rhymepart}\t#{wordlist}"
  end
end
