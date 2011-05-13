#!/usr/bin/env ruby
require 'lib.rb'

map do |line|
  next if line[0..1] == "##"
  next unless line.index("(").nil? # ignore alternate pronunciations

  word, pronunciation = line.downcase.rstrip.split(" ", 2)

  # each syllable is marked with a stress-indicating digit
  #syllables = pronunciation.count("012")
  syllables = pronunciation.gsub(/[a-z]+/,"").split.join

  # a word that rhymes must match last stressed syllable through the end
  stressed = pronunciation.index("1") || 0
  start = pronunciation.rindex(" ", stressed) || 0
  rhymepart = pronunciation[start..-1]

  puts "#{rhymepart}\t#{syllables}\t#{word}"
end
