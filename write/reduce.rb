#!/usr/bin/env ruby
require 'lib.rb'

reduce do |rhymepart, lines|
  lines.size.times do |i|
    lines.size.times do |j|
      unless lines[i].split.last.cleaned == lines[j].split.last.cleaned
        puts "#{lines[i]} / #{lines[j]}"
      end
    end
  end
end
