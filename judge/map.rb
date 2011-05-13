#!/usr/bin/env ruby
require 'lib.rb'

syllables, rhymeparts = load_dictionary(ARGV[0])

map do |line|
  line1, line2 = line.split(" / ", 2).collect{|l| l.split}
  meter1, meter2 = "", ""

  line1.each{|word| meter1 += syllables[word.cleaned] }
  line2.each{|word| meter2 += syllables[word.cleaned] }

  # with 1000+ monkeys, we can afford to be picky
  next unless meter1 == meter2

  if (6..10).member?(meter1.length)
    # minimize accented syllables to get most flexibility in pronunciation
    puts "#{meter1.count("12")}\t#{line}"
  end
end
